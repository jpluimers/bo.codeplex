unit HiddenExecuteSettingsLoaderUnit;

interface

uses
  LoggerInterfaceUnit,
  HiddenExecuteSettingsUnit;

type
  TCas400MqConversationSettingsApply = class(TObject)
  private
  public
//    class procedure Apply(const MqConversationSettings: TCas400MqConversationSettings; const Logger: ILeveledLogger; const Cas400Conversation: TCustomCas400MqConversation); static;
//    class procedure Obtain(const Cas400Conversation: TCustomCas400MqConversation; const Logger: ILeveledLogger; const MqConversationSettings: TCas400MqConversationSettings); static;
    class procedure LoadConversationSettings(const Logger: ILeveledLogger{; const Conversation: TLoggingCas400MqConversation}); static;
  end;

implementation

uses
  LoggerUnit,
  Variants, HiddenExecuteArgumentsUnit;

//class procedure TCas400MqConversationSettingsApply.Apply(const MqConversationSettings: TCas400MqConversationSettings; const Logger: ILeveledLogger; const Cas400Conversation:
//    TCustomCas400MqConversation);
//begin
//  Cas400Conversation.As400MachineName := MqConversationSettings.As400Name;
//  Cas400Conversation.ChannelName := MqConversationSettings.ChannelName;
//  Cas400Conversation.ConnectionDomainSuffix := MqConversationSettings.ConnectionDomainSuffix;
//  Cas400Conversation.ConnectionPort := MqConversationSettings.ConnectionPort;
//  Cas400Conversation.EncryptConversation := MqConversationSettings.EncryptConversation;
//  Cas400Conversation.InitializationQueueName := MqConversationSettings.InitializationQueueName;
//  Cas400Conversation.ModelQueueName := MqConversationSettings.ModelQueueName;
//  Cas400Conversation.QueueManagerName := MqConversationSettings.QueueManagerName;
//  Cas400Conversation.ReceiveAskForRetryAfterTimeout := MqConversationSettings.ReceiveAskForRetryAfterTimeout;
//  Cas400Conversation.ReceiveWaitIntervalMilliseconds := MqConversationSettings.ReceiveWaitIntervalMilliseconds;
//  Cas400Conversation.Debug := MqConversationSettings.VerbosityLevel >= vlDebug;
//  Logger.Enabled := MqConversationSettings.VerbosityLevel <> vlOff;
//  Logger.VerbosityLevel := MqConversationSettings.VerbosityLevel;
//  Logger.Warn.Log('Conversation properties copied from settings:');
//  Logger.Warn.Log('As400MachineName', Cas400Conversation.As400MachineName);
//  Logger.Warn.Log('ChannelName', MqConversationSettings.ChannelName);
//  Logger.Warn.Log('ConnectionDomainSuffix', MqConversationSettings.ConnectionDomainSuffix);
//  Logger.Warn.Log('ConnectionPort', MqConversationSettings.ConnectionPort);
//  Logger.Warn.Log('EncryptConversation', MqConversationSettings.EncryptConversation);
//  Logger.Warn.Log('InitializationQueueName', MqConversationSettings.InitializationQueueName);
//  Logger.Warn.Log('ModelQueueName', MqConversationSettings.ModelQueueName);
//  Logger.Warn.Log('QueueManagerName', MqConversationSettings.QueueManagerName);
//  Logger.Warn.Log('ReceiveAskForRetryAfterTimeout', MqConversationSettings.ReceiveAskForRetryAfterTimeout);
//  Logger.Warn.Log('ReceiveWaitIntervalMilliseconds', MqConversationSettings.ReceiveWaitIntervalMilliseconds);
//  Logger.Warn.Log('Debug', Cas400Conversation.Debug);
//  Logger.Warn.Log('Enabled', Logger.Enabled);
//  Logger.Warn.Log('VerbosityLevel', Logger.VerbosityLevelString);
//  Logger.Warn.Log('ConnectionHostNameAndPort', Cas400Conversation.ConnectionHostNameAndPort);
//end;
//
//class procedure TCas400MqConversationSettingsApply.Obtain(const Cas400Conversation: TCustomCas400MqConversation; const Logger: ILeveledLogger; const MqConversationSettings:
//    TCas400MqConversationSettings);
//  function Obtain(const Default, Actual: string): string; overload;
//  begin
//    if Actual <> NullAsStringValue then
//      Result := Actual
//    else
//      Result := Default;
//  end;
//begin
//  MqConversationSettings.As400Name := Obtain(MqConversationSettings.As400Name, Cas400Conversation.As400MachineName);
//  MqConversationSettings.ChannelName := Obtain(MqConversationSettings.ChannelName, Cas400Conversation.ChannelName);
//  MqConversationSettings.ConnectionDomainSuffix := Obtain(MqConversationSettings.ConnectionDomainSuffix, Cas400Conversation.ConnectionDomainSuffix);
//  MqConversationSettings.ConnectionPort := Cas400Conversation.ConnectionPort;
//  MqConversationSettings.EncryptConversation := Cas400Conversation.EncryptConversation;
//  MqConversationSettings.InitializationQueueName := Obtain(MqConversationSettings.InitializationQueueName, Cas400Conversation.InitializationQueueName);
//  MqConversationSettings.ModelQueueName := Obtain(MqConversationSettings.ModelQueueName, Cas400Conversation.ModelQueueName);
//  MqConversationSettings.QueueManagerName := Obtain(MqConversationSettings.QueueManagerName, Cas400Conversation.QueueManagerName);
//  MqConversationSettings.ReceiveAskForRetryAfterTimeout := Cas400Conversation.ReceiveAskForRetryAfterTimeout;
//  MqConversationSettings.ReceiveWaitIntervalMilliseconds := Cas400Conversation.ReceiveWaitIntervalMilliseconds;
//  MqConversationSettings.VerbosityLevel := Logger.VerbosityLevel;
//  Logger.Warn.Log('Initial settings copied from conversation properties:');
//  Logger.Warn.Log('As400Name', MqConversationSettings.As400Name);
//  Logger.Warn.Log('ChannelName', MqConversationSettings.ChannelName);
//  Logger.Warn.Log('ConnectionDomainSuffix', MqConversationSettings.ConnectionDomainSuffix);
//  Logger.Warn.Log('ConnectionPort', MqConversationSettings.ConnectionPort);
//  Logger.Warn.Log('EncryptConversation', MqConversationSettings.EncryptConversation);
//  Logger.Warn.Log('InitializationQueueName', MqConversationSettings.InitializationQueueName);
//  Logger.Warn.Log('ModelQueueName', MqConversationSettings.ModelQueueName);
//  Logger.Warn.Log('QueueManagerName', MqConversationSettings.QueueManagerName);
//  Logger.Warn.Log('ReceiveAskForRetryAfterTimeout', MqConversationSettings.ReceiveAskForRetryAfterTimeout);
//  Logger.Warn.Log('ReceiveWaitIntervalMilliseconds', MqConversationSettings.ReceiveWaitIntervalMilliseconds);
//  Logger.Warn.Log('VerbosityLevel', Logger.VerbosityLevelString);
//end;

class procedure TCas400MqConversationSettingsApply.LoadConversationSettings(const Logger: ILeveledLogger{; const Conversation: TLoggingCas400MqConversation});
var
  HiddenExecuteArguments: THiddenExecuteArguments;
  HiddenExecuteSettings: THiddenExecuteSettings;
begin
//  Conversation.Logger := Logger;
  HiddenExecuteSettings := THiddenExecuteSettings.Create(nil);
  try
//    TCas400MqConversationSettingsApply.Obtain(Conversation, Logger, MqConversationSettings);
    HiddenExecuteArguments := THiddenExecuteArguments.Create();
    try
      HiddenExecuteArguments.Run(Logger, HiddenExecuteSettings);
//      TCas400MqConversationSettingsApply.Apply(MqConversationSettings, Logger, Conversation);
    finally
      HiddenExecuteArguments.Free;
    end;
  finally
    HiddenExecuteSettings.Free;
  end;
end;

end.
