unit uClientMQTT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sgcWebSocket_Classes, sgcWebSocket_Client, sgcWebSocket, StdCtrls,
  ExtCtrls, sgcWebSocket_Protocol_Base_Client,
  sgcWebSocket_Protocols, sgcWebSocket_Types, sgcWebSocket_Classes_Indy,
  sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocol_MQTT_Message,
  sgcBase_Classes, sgcTCP_Classes;

type
  TfrmClientPROTOCOL = class(TForm)
    pnlClient: TPanel;
    memoLog: TMemo;
    WSClient: TsgcWebSocketClient;
    btnSubscribe: TButton;
    pnlClientActive: TPanel;
    btnStart: TButton;
    btnStop: TButton;
    pnlClientOptions: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    chkCompressed: TCheckBox;
    chkTLS: TCheckBox;
    txtHost: TEdit;
    Label5: TLabel;
    Default: TLabel;
    txtDefaultPort: TEdit;
    Label6: TLabel;
    txtSSLPort: TEdit;
    chkProxy: TCheckBox;
    Label7: TLabel;
    txtProxyUsername: TEdit;
    txtProxyPassword: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    txtProxyHost: TEdit;
    txtProxyPort: TEdit;
    Label10: TLabel;
    btnUnsubscribe: TButton;
    txtChannel: TEdit;
    btnPublish: TButton;
    txtPublishChannel: TEdit;
    txtPublishMessage: TEdit;
    Label1: TLabel;
    Label12: TLabel;
    cboServers: TComboBox;
    Label15: TLabel;
    MQTT: TsgcWSPClient_MQTT;
    btnPing: TButton;
    Label2: TLabel;
    cboQoS: TComboBox;
    chkRetain: TCheckBox;
    procedure btnSubscribeClick(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnUnsubscribeClick(Sender: TObject);
    procedure btnPublishClick(Sender: TObject);
    procedure cboServersChange(Sender: TObject);
    procedure MQTTMQTTConnect(Connection: TsgcWSConnection; const Session: Boolean;
        const ReasonCode: Integer; const ReasonName: string; const
        ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure MQTTMQTTDisconnect(Connection: TsgcWSConnection; ReasonCode: Integer;
        const ReasonName: string; DisconnectProperties:
        TsgcWSMQTTDISCONNECTProperties);
    procedure MQTTMQTTPing(Connection: TsgcWSConnection);
    procedure MQTTMQTTPubAck(Connection: TsgcWSConnection; aPacketIdentifier: Word;
        ReasonCode: Integer; const ReasonName: string; PubAckProperties:
        TsgcWSMQTTPUBACKProperties);
    procedure MQTTMQTTPubComp(Connection: TsgcWSConnection; aPacketIdentifier:
        Word; ReasonCode: Integer; const ReasonName: string; PubCompProperties:
        TsgcWSMQTTPUBCOMPProperties);
    procedure MQTTMQTTPublish(Connection: TsgcWSConnection; aTopic, aText: string;
        PublishProperties: TsgcWSMQTTPublishProperties);
    procedure MQTTMQTTPubRec(Connection: TsgcWSConnection; aPacketIdentifier: Word;
        ReasonCode: Integer; const ReasonName: string; PubRecProperties:
        TsgcWSMQTTPUBRECProperties);
    procedure MQTTMQTTSubscribe(Connection: TsgcWSConnection; aPacketIdentifier:
        Word; aCodes: TsgcWSSUBACKS; SubscribeProperties:
        TsgcWSMQTTSUBACKProperties);
    procedure MQTTMQTTUnSubscribe(Connection: TsgcWSConnection; aPacketIdentifier:
        Word; aCodes: TsgcWSUNSUBACKS; UnsubscribeProperties:
        TsgcWSMQTTUNSUBACKProperties);
    procedure WSClientException(Connection: TsgcWSConnection; E: Exception);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientPROTOCOL: TfrmClientPROTOCOL;

implementation

{$R *.dfm}

procedure TfrmClientPROTOCOL.btnSubscribeClick(Sender: TObject);
begin
  MQTT.Subscribe(txtChannel.text);
end;

procedure TfrmClientPROTOCOL.btnStartClick(Sender: TObject);
begin
  if chkTLS.Checked then
    WSClient.Port := StrToInt(txtSSLPort.text)
  else
    WSClient.Port := StrToInt(txtDefaultPort.text);
  WSClient.Host := txtHost.text;

  WSClient.TLS := chkTLS.Checked;

  WSClient.Proxy.Enabled := chkProxy.Checked;
  WSClient.Proxy.Username := txtProxyUsername.text;
  WSClient.Proxy.Password := txtProxyPassword.text;
  WSClient.Proxy.Host := txtProxyHost.text;
  if txtProxyPort.text <> '' then
    WSClient.Proxy.Port := StrToInt(txtProxyPort.text);

  WSClient.Extensions.DeflateFrame.Enabled := chkCompressed.Checked;

  // ... active
  WSClient.Active := True;
  if WSClient.Active then
    pnlClientOptions.Enabled := False;
end;

procedure TfrmClientPROTOCOL.btnStopClick(Sender: TObject);
begin
  WSClient.Active := False;

  if not WSClient.Active then
    pnlClientOptions.Enabled := True;
end;

procedure TfrmClientPROTOCOL.btnUnsubscribeClick(Sender: TObject);
begin
  MQTT.UnSubscribe(txtChannel.text);
end;

procedure TfrmClientPROTOCOL.btnPublishClick(Sender: TObject);
begin
  MQTT.Publish(txtPublishChannel.text, txtPublishMessage.text,
    TmqttQoS(cboQoS.ItemIndex), chkRetain.Checked);
end;

procedure TfrmClientPROTOCOL.cboServersChange(Sender: TObject);
begin
  case cboServers.ItemIndex of
    0: // esegece.com
      begin
        txtHost.text := 'www.esegece.com';
        txtDefaultPort.text := '15675';
        txtSSLPort.text := '0';
        WSClient.Options.Parameters := '/ws';
        MQTT.Authentication.Enabled := True;
        MQTT.Authentication.UserName := 'sgc';
        MQTT.Authentication.Password := 'sgc';
      end;
    1: // broker.hivemq.com
      begin
        txtHost.text := 'broker.hivemq.com';
        txtDefaultPort.text := '8000';
        txtSSLPort.text := '0';
        MQTT.Authentication.Enabled := False;
        WSClient.Options.Parameters := '/';
      end;
    2: // test.mosca.io
      begin
        txtHost.text := 'test.mosca.io';
        txtDefaultPort.text := '80';
        txtSSLPort.text := '0';
        MQTT.Authentication.Enabled := False;
        WSClient.Options.Parameters := '/';
      end;
    3: // iot.eclipse.org
      begin
        txtHost.text := 'iot.eclipse.org';
        txtDefaultPort.text := '80';
        txtSSLPort.text := '443';
        MQTT.Authentication.Enabled := False;
        WSClient.Options.Parameters := '/ws';
      end;
    4: // mqtt.simpleml.com
      begin
        txtHost.text := 'mqtt.dioty.co';
        txtDefaultPort.text := '8080';
        txtSSLPort.text := '0';
        WSClient.Options.Parameters := '/';
        MQTT.Authentication.Enabled := True;
        MQTT.Authentication.UserName := ''; // requires username
        MQTT.Authentication.Password := ''; // requires username
      end;
  end;
end;

procedure TfrmClientPROTOCOL.MQTTMQTTConnect(Connection: TsgcWSConnection;
    const Session: Boolean; const ReasonCode: Integer; const ReasonName:
    string; const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  memoLog.Lines.Add('#connected');
  chkTLS.Enabled := False;
  chkCompressed.Enabled := False;
end;

procedure TfrmClientPROTOCOL.MQTTMQTTDisconnect(Connection: TsgcWSConnection;
    ReasonCode: Integer; const ReasonName: string; DisconnectProperties:
    TsgcWSMQTTDISCONNECTProperties);
begin
  memoLog.Lines.Add('#disconnected');
  chkTLS.Enabled := True;
  chkCompressed.Enabled := True;
end;

procedure TfrmClientPROTOCOL.MQTTMQTTPing(Connection: TsgcWSConnection);
begin
  memoLog.Lines.Add('#ping');
end;

procedure TfrmClientPROTOCOL.MQTTMQTTPubAck(Connection: TsgcWSConnection;
    aPacketIdentifier: Word; ReasonCode: Integer; const ReasonName: string;
    PubAckProperties: TsgcWSMQTTPUBACKProperties);
begin
  memoLog.Lines.Add('#PubAck: ' + IntToStr(aPacketIdentifier));
end;

procedure TfrmClientPROTOCOL.MQTTMQTTPubComp(Connection: TsgcWSConnection;
    aPacketIdentifier: Word; ReasonCode: Integer; const ReasonName: string;
    PubCompProperties: TsgcWSMQTTPUBCOMPProperties);
begin
  memoLog.Lines.Add('#PubComp: ' + IntToStr(aPacketIdentifier));
end;

procedure TfrmClientPROTOCOL.MQTTMQTTPublish(Connection: TsgcWSConnection;
    aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  memoLog.Lines.Add(aTopic + ': ' + aText);
end;

procedure TfrmClientPROTOCOL.MQTTMQTTPubRec(Connection: TsgcWSConnection;
    aPacketIdentifier: Word; ReasonCode: Integer; const ReasonName: string;
    PubRecProperties: TsgcWSMQTTPUBRECProperties);
begin
  memoLog.Lines.Add('#PubRec: ' + IntToStr(aPacketIdentifier));
end;

procedure TfrmClientPROTOCOL.MQTTMQTTSubscribe(Connection: TsgcWSConnection;
    aPacketIdentifier: Word; aCodes: TsgcWSSUBACKS; SubscribeProperties:
    TsgcWSMQTTSUBACKProperties);
begin
  memoLog.Lines.Add('#Subscribe: ' + IntToStr(aPacketIdentifier));
end;

procedure TfrmClientPROTOCOL.MQTTMQTTUnSubscribe(Connection: TsgcWSConnection;
    aPacketIdentifier: Word; aCodes: TsgcWSUNSUBACKS; UnsubscribeProperties:
    TsgcWSMQTTUNSUBACKProperties);
begin
  memoLog.Lines.Add('#UnSubscribe: ' + IntToStr(aPacketIdentifier));
end;

procedure TfrmClientPROTOCOL.WSClientException(Connection: TsgcWSConnection;
  E: Exception);
begin
  memoLog.Lines.Add('#exception:' + E.Message);
end;

end.
