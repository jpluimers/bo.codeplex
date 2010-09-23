unit ORMListBaseFormUnit;

interface

uses
  Forms,
  ORMEntityUnit,
  SysUtils,
  ORMDetailBaseFormUnit;

type
  TORMListBaseForm = class(TForm)
  strict protected
    procedure EditOrInsert<T: TORMDetailBaseForm>(const PostAction: TPostAction; const EntityList: TEntityList; const AssignEntityProc: TProc<T>);
  end;

type
  TRequiredFieldsCloseQueryEventCatcher = class // must be interface because it is used from the Generic EditOrInsert method
  strict private
    EntityList: TEntityList;
    EditOrInsertForm: TORMDetailBaseForm;
    procedure CloseQueryEvent(Sender: TObject; var CanClose: Boolean);
    procedure caSetColorWhenRequiredForDataAwareControlController;
  public
    constructor Create(const EntityList: TEntityList; const EditOrInsertForm: TORMDetailBaseForm); overload;
    constructor Create; overload; deprecated 'Use the overloaded Create constructor that has parameters';
  end;

implementation

uses
  Controls,
  DB,
  DBConsts,
  DataAwareControlControllerUnit,
  Rtti;

procedure TORMListBaseForm.EditOrInsert<T>(const PostAction: TPostAction; const EntityList: TEntityList; const AssignEntityProc: TProc<T>);
var
  EditOrInsertForm: T;
  FormClass: TFormClass;
  Form: TForm;
  CloseQueryEventCatcher: TRequiredFieldsCloseQueryEventCatcher;
  PostActionValue: TValue;
  PostActionText: string;
begin
  // Form := T.Create(Application); //##jpl: generics bug; workaround:
  FormClass := T;
  Form := FormClass.Create(Application);
  // EditOrInsertForm := Form as T; //##jpl: generics bug; workaround:
  Assert(Form is T);
  EditOrInsertForm := T(Form);
  try
    case PostAction of
      paEdit:
        EntityList.Edit;
      paInsert:
        EntityList.Insert;
    end;
    AssignEntityProc(EditOrInsertForm);
    try
      CloseQueryEventCatcher := TRequiredFieldsCloseQueryEventCatcher.Create(EntityList, EditOrInsertForm);
      PostActionValue := TValue.From<TPostAction>(PostAction);
      PostActionText := PostActionValue.ToString();
      Delete(PostActionText, 1, 2);
      EditOrInsertForm.Caption := Format('%s - %s - %s', [EditOrInsertForm.Caption, EntityList.TableName, PostActionText]);
      if EditOrInsertForm.ShowModal = mrOk then
        EntityList.Post
      else
        EntityList.Cancel;
    finally
      CloseQueryEventCatcher.Free();
    end;
  finally
    EditOrInsertForm.Free;
  end;
end;

constructor TRequiredFieldsCloseQueryEventCatcher.Create(const EntityList: TEntityList; const EditOrInsertForm: TORMDetailBaseForm);
begin
  inherited Create();
  Assert(Assigned(EntityList), 'EntityList is required');
  Assert(Assigned(EditOrInsertForm), 'EditOrInsertForm is required');
  Self.EntityList := EntityList;
  Self.EditOrInsertForm := EditOrInsertForm;
  EditOrInsertForm.OnCloseQuery := Self.CloseQueryEvent;
end;

constructor TRequiredFieldsCloseQueryEventCatcher.Create;
begin
  Assert(False, Format('Call the overloaded %s.Create constructor', [ClassName]));
end;

procedure TRequiredFieldsCloseQueryEventCatcher.CloseQueryEvent(Sender: TObject; var CanClose: Boolean);
var
  Field: TField;
begin
  if IsPositiveResult(EditOrInsertForm.ModalResult) then
  begin
    // jpl: logic borrowed from private TDataSet.CheckRequiredFields method
    for Field in EntityList.Fields do
    begin
      if Field.Required and not Field.ReadOnly and (Field.FieldKind = fkData) and Field.IsNull then
      begin
        Field.FocusControl;
        caSetColorWhenRequiredForDataAwareControlController();
        // CanClose := False; //jpl: not needed, as the Exception will keep the form from closing
        DatabaseErrorFmt(SFieldRequired, [Field.DisplayName], Field);
      end;
    end;
  end;
end;

procedure TRequiredFieldsCloseQueryEventCatcher.caSetColorWhenRequiredForDataAwareControlController;
var
  DataAwareControlController: TDataAwareControlController;
  Component: TObject;
begin
  for Component in EditOrInsertForm do
  begin
    if Component is TDataAwareControlController then
    begin
      DataAwareControlController := Component as TDataAwareControlController;
      if Assigned(DataAwareControlController.DataSource) then
        if Assigned(DataAwareControlController.DataSet) then
          if DataAwareControlController.DataSet = EntityList then
            DataAwareControlController.ControllerActions := DataAwareControlController.ControllerActions + [caSetColorWhenRequired];
    end;
  end;
end;

end.
