object frmClientPROTOCOL: TfrmClientPROTOCOL
  Left = 0
  Top = 0
  Caption = 'WebSocket Client MQTT PROTOCOL'
  ClientHeight = 591
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object pnlClient: TPanel
    Left = 0
    Top = 0
    Width = 770
    Height = 591
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 304
      Top = 158
      Width = 326
      Height = 13
      Caption = 
        'Subscribe / UnSubscribe to custom channel to receive data OnEven' +
        't'
    end
    object Label12: TLabel
      Left = 521
      Top = 191
      Width = 200
      Height = 26
      Caption = 'Broadcast text to all clients subscribed to custom channel.'
      WordWrap = True
    end
    object Label2: TLabel
      Left = 89
      Top = 222
      Width = 103
      Height = 13
      Caption = 'Send a ping to server'
    end
    object memoLog: TMemo
      Left = 8
      Top = 248
      Width = 754
      Height = 337
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btnSubscribe: TButton
      Left = 8
      Top = 154
      Width = 75
      Height = 25
      Caption = 'Subscribe'
      TabOrder = 1
      OnClick = btnSubscribeClick
    end
    object btnUnsubscribe: TButton
      Left = 89
      Top = 154
      Width = 75
      Height = 25
      Caption = 'UnSubscribe'
      TabOrder = 2
      OnClick = btnUnsubscribeClick
    end
    object txtChannel: TEdit
      Left = 170
      Top = 156
      Width = 121
      Height = 21
      Hint = 'Channel name'
      TabOrder = 3
      Text = 'sgc:test'
    end
    object btnPublish: TButton
      Left = 8
      Top = 186
      Width = 75
      Height = 25
      Caption = 'Publish'
      TabOrder = 4
      OnClick = btnPublishClick
    end
    object txtPublishChannel: TEdit
      Left = 89
      Top = 188
      Width = 121
      Height = 21
      Hint = 'Channel Name'
      TabOrder = 5
      Text = 'sgc:test'
    end
    object txtPublishMessage: TEdit
      Left = 216
      Top = 188
      Width = 121
      Height = 21
      Hint = 'Text to Broadcast to all clients subscribed'
      TabOrder = 6
      Text = 'Hello World!'
    end
    object btnPing: TButton
      Left = 8
      Top = 217
      Width = 75
      Height = 25
      Caption = 'Ping'
      TabOrder = 7
    end
    object cboQoS: TComboBox
      Left = 343
      Top = 188
      Width = 106
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 8
      Text = 'mtqsAtMostOnce'
      OnChange = cboServersChange
      Items.Strings = (
        'mtqsAtMostOnce'
        'mtqsAtLeastOnce'
        'mtqsExactlyOnce')
    end
    object chkRetain: TCheckBox
      Left = 455
      Top = 190
      Width = 50
      Height = 17
      Caption = 'Retain'
      TabOrder = 9
    end
  end
  object pnlClientActive: TPanel
    Left = 8
    Top = 8
    Width = 106
    Height = 129
    TabOrder = 1
    object btnStart: TButton
      Left = 16
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = btnStartClick
    end
    object btnStop: TButton
      Left = 16
      Top = 93
      Width = 75
      Height = 25
      Caption = 'Stop'
      TabOrder = 1
      OnClick = btnStopClick
    end
  end
  object pnlClientOptions: TPanel
    Left = 120
    Top = 8
    Width = 642
    Height = 129
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 11
      Width = 43
      Height = 13
      Caption = 'Options'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 16
      Top = 30
      Width = 26
      Height = 13
      Caption = 'Host:'
    end
    object Label7: TLabel
      Left = 511
      Top = 26
      Width = 52
      Height = 13
      Caption = 'Username:'
    end
    object Label5: TLabel
      Left = 171
      Top = 26
      Width = 24
      Height = 13
      Caption = 'Port:'
    end
    object Label6: TLabel
      Left = 178
      Top = 75
      Width = 17
      Height = 13
      Caption = 'SSL'
    end
    object Default: TLabel
      Left = 160
      Top = 48
      Width = 35
      Height = 13
      Caption = 'Default'
    end
    object Label8: TLabel
      Left = 511
      Top = 72
      Width = 50
      Height = 13
      Caption = 'Password:'
    end
    object Label10: TLabel
      Left = 376
      Top = 72
      Width = 24
      Height = 13
      Caption = 'Port:'
    end
    object Label9: TLabel
      Left = 376
      Top = 26
      Width = 26
      Height = 13
      Caption = 'Host:'
    end
    object Label15: TLabel
      Left = 16
      Top = 75
      Width = 41
      Height = 13
      Caption = 'Servers:'
    end
    object chkCompressed: TCheckBox
      Left = 272
      Top = 76
      Width = 81
      Height = 17
      Caption = 'Compressed'
      TabOrder = 0
    end
    object chkTLS: TCheckBox
      Left = 272
      Top = 47
      Width = 105
      Height = 17
      Caption = 'TLS'
      TabOrder = 1
    end
    object txtHost: TEdit
      Left = 16
      Top = 45
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'www.esegece.com'
    end
    object txtSSLPort: TEdit
      Left = 201
      Top = 72
      Width = 57
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object txtDefaultPort: TEdit
      Left = 201
      Top = 45
      Width = 57
      Height = 21
      TabOrder = 4
      Text = '15675'
    end
    object chkProxy: TCheckBox
      Left = 359
      Top = 7
      Width = 58
      Height = 17
      Caption = 'Proxy'
      TabOrder = 5
    end
    object txtProxyUsername: TEdit
      Left = 511
      Top = 45
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object txtProxyPassword: TEdit
      Left = 511
      Top = 91
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object txtProxyHost: TEdit
      Left = 376
      Top = 45
      Width = 121
      Height = 21
      TabOrder = 8
    end
    object txtProxyPort: TEdit
      Left = 376
      Top = 91
      Width = 121
      Height = 21
      TabOrder = 9
    end
    object cboServers: TComboBox
      Left = 16
      Top = 94
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 10
      Text = 'www.esegece.com'
      OnChange = cboServersChange
      Items.Strings = (
        'www.esegece.com'
        'broker.hivemq.com'
        'test.mosca.io'
        'iot.eclipse.org'
        'mqtt.simpleml.com')
    end
  end
  object WSClient: TsgcWebSocketClient
    Host = 'www.esegece.com'
    Port = 15675
    ConnectTimeout = 0
    ReadTimeout = -1
    TLS = False
    Proxy.Enabled = False
    Proxy.Port = 8080
    Proxy.ProxyType = pxyHTTP
    HeartBeat.Enabled = False
    HeartBeat.Interval = 300
    HeartBeat.Timeout = 0
    IPVersion = Id_IPv4
    OnException = WSClientException
    Authentication.Enabled = False
    Authentication.URL.Enabled = True
    Authentication.Session.Enabled = True
    Authentication.Basic.Enabled = False
    Authentication.Token.Enabled = False
    Authentication.Token.AuthName = 'Bearer'
    Extensions.DeflateFrame.Enabled = False
    Extensions.DeflateFrame.WindowBits = 15
    Extensions.PerMessage_Deflate.Enabled = False
    Extensions.PerMessage_Deflate.ClientMaxWindowBits = 15
    Extensions.PerMessage_Deflate.ClientNoContextTakeOver = False
    Extensions.PerMessage_Deflate.MemLevel = 1
    Extensions.PerMessage_Deflate.ServerMaxWindowBits = 15
    Extensions.PerMessage_Deflate.ServerNoContextTakeOver = False
    Options.FragmentedMessages = frgOnlyBuffer
    Options.Parameters = '/ws'
    Options.RaiseDisconnectExceptions = True
    Options.ValidateUTF8 = False
    Specifications.Drafts.Hixie76 = False
    Specifications.RFC6455 = True
    NotifyEvents = neAsynchronous
    LogFile.Enabled = False
    QueueOptions.Binary.Level = qmNone
    QueueOptions.Ping.Level = qmNone
    QueueOptions.Text.Level = qmNone
    WatchDog.Attempts = 0
    WatchDog.Enabled = False
    WatchDog.Interval = 10
    Throttle.BitsPerSec = 0
    Throttle.Enabled = False
    LoadBalancer.Enabled = False
    LoadBalancer.Port = 0
    TLSOptions.VerifyCertificate = False
    TLSOptions.Version = tlsUndefined
    TLSOptions.IOHandler = iohOpenSSL
    Left = 32
    Top = 56
  end
  object MQTT: TsgcWSPClient_MQTT
    OnMQTTConnect = MQTTMQTTConnect
    OnMQTTPing = MQTTMQTTPing
    OnMQTTPublish = MQTTMQTTPublish
    OnMQTTPubAck = MQTTMQTTPubAck
    OnMQTTPubRec = MQTTMQTTPubRec
    OnMQTTPubComp = MQTTMQTTPubComp
    OnMQTTSubscribe = MQTTMQTTSubscribe
    OnMQTTUnSubscribe = MQTTMQTTUnSubscribe
    OnMQTTDisconnect = MQTTMQTTDisconnect
    Client = WSClient
    Authentication.Enabled = True
    Authentication.Password = 'sgc'
    Authentication.UserName = 'sgc'
    HeartBeat.Enabled = True
    HeartBeat.Interval = 5
    LastWillTestament.Enabled = False
    LastWillTestament.QoS = mtqsAtMostOnce
    LastWillTestament.Retain = False
    LastWillTestament.WillProperties.MessageExpiryInterval = 0
    LastWillTestament.WillProperties.PayloadFormat = mqpfUnspecified
    LastWillTestament.WillProperties.WillDelayInterval = 0
    QoS.Level = mtqsAtMostOnce
    QoS.Interval = 60
    QoS.Timeout = 300
    ConnectProperties.Enabled = False
    ConnectProperties.MaximumPacketSize = 2147483647
    ConnectProperties.ReceiveMaximum = 65535
    ConnectProperties.RequestProblemInformation = True
    ConnectProperties.RequestResponseInformation = False
    ConnectProperties.SessionExpiryInterval = 0
    ConnectProperties.TopicAliasMaximum = 0
    MQTTVersion = mqtt311
    Left = 80
    Top = 56
  end
end
