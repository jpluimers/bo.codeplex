unit uSet3DGridPosition;

{***********************************
Name:				Set 3D Grid Position Unit
Purpose:		Use this unit to determine the positioning of a 3D interface
						Styles Supported:
							-Concave

Copyright Jeffrey Lefebvre, 2011
Rights granted to use in your application, 
and distribute with this copyright notice intact.

For a more up to date version, go to LearnDelphi.com
Blog: Kiwistamp.ca
***********************************}

interface

uses FMX.Types3D;

procedure Set3DGridPosition(ItemID: Integer; SceneWidth : Integer;
    SceneNumColumns : Integer; ItemPosition: TPosition3D; var ItemWidth,
    ItemHeight, ItemYRotation : Single);

implementation

procedure Set3DGridPosition(ItemID: Integer; SceneWidth : Integer; SceneNumColumns : Integer;
  ItemPosition: TPosition3D; var ItemWidth, ItemHeight, ItemYRotation : Single);
const
  HeightWidthRatio : Single = 4/5;
var
  PercentageOfColumn: Single;
  PercentageValue: Single;
  CurrentRow: Single;
begin
  ItemWidth := SceneWidth / SceneNumColumns;
  ItemHeight := ItemWidth * HeightWidthRatio;

  PercentageOfColumn := ((ItemID / (SceneNumColumns)) - trunc(ItemID / SceneNumColumns));
  PercentageValue := ((1 / (SceneNumColumns)) - trunc(1 / SceneNumColumns));
  CurrentRow := trunc(ItemID / SceneNumColumns); //0 based


  ItemYRotation := ((PercentageOfColumn + (PercentageValue / 2)) * 100) - 50;
                    //incremental position              //start position

  ItemPosition.X := SceneWidth * PercentageOfColumn + (ItemWidth / 2);
                //incremental position              //start position
  ItemPosition.Y := ((ItemHeight) * (CurrentRow)) + (ItemHeight / 2);

  ItemPosition.Z := (abs(((PercentageOfColumn + (PercentageValue / 2)) * 100) - 50) - 50) * -4;
end;

end.
