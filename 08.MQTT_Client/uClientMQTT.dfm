object frmClientPROTOCOL: TfrmClientPROTOCOL
  Left = 0
  Top = 0
  Caption = 'MQTT Client'
  ClientHeight = 400
  ClientWidth = 646
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
    Width = 646
    Height = 400
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 401
    object Label1: TLabel
      Left = 374
      Top = 63
      Width = 95
      Height = 13
      Caption = 'Message to Publish:'
    end
    object Label2: TLabel
      Left = 501
      Top = 61
      Width = 89
      Height = 13
      Caption = 'Quality of Service:'
    end
    object memoLog: TMemo
      Left = 8
      Top = 108
      Width = 614
      Height = 258
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object btnSubscribe: TButton
      Left = 120
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Subscribe To'
      TabOrder = 1
      OnClick = btnSubscribeClick
    end
    object btnUnsubscribe: TButton
      Left = 201
      Top = 9
      Width = 75
      Height = 25
      Caption = 'UnSubscribe'
      TabOrder = 2
      OnClick = btnUnsubscribeClick
    end
    object txtTopicToSubscribe: TEdit
      Left = 120
      Top = 40
      Width = 156
      Height = 21
      Hint = 'Channel name'
      TabOrder = 3
      Text = 'sgc:topic1'
    end
    object btnPublish: TButton
      Left = 120
      Top = 77
      Width = 121
      Height = 25
      Caption = 'Publish Message To'
      TabOrder = 4
      OnClick = btnPublishClick
    end
    object txtTopicToPublish: TEdit
      Left = 247
      Top = 79
      Width = 121
      Height = 21
      Hint = 'Channel Name'
      TabOrder = 5
      Text = 'sgc:topic1'
    end
    object txtMessageToPublish: TEdit
      Left = 374
      Top = 79
      Width = 121
      Height = 21
      Hint = 'Text to Broadcast to all clients subscribed'
      TabOrder = 6
      Text = 'Message 1'
    end
    object cboQoS: TComboBox
      Left = 501
      Top = 80
      Width = 121
      Height = 21
      Style = csDropDownList
      ItemIndex = 1
      TabOrder = 7
      Text = 'mtqsAtLeastOnce'
      OnChange = cboServersChange
      Items.Strings = (
        'mtqsAtMostOnce'
        'mtqsAtLeastOnce'
        'mtqsExactlyOnce')
    end
  end
  object pnlClientActive: TPanel
    Left = 8
    Top = 8
    Width = 106
    Height = 94
    TabOrder = 1
    object btnStart: TButton
      Left = 16
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 0
      OnClick = btnStartClick
    end
    object btnStop: TButton
      Left = 16
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Disconnect'
      TabOrder = 1
      OnClick = btnStopClick
    end
  end
  object WSClient: TsgcWebSocketClient
    Host = 'www.esegece.com'
    Port = 15675
    ConnectTimeout = 0
    ReadTimeout = -1
    WriteTimeout = 0
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
    Options.CleanDisconnect = False
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
    TLSOptions.VerifyDepth = 0
    TLSOptions.Version = tlsUndefined
    TLSOptions.IOHandler = iohOpenSSL
    TLSOptions.OpenSSL_Options.APIVersion = oslAPI_1_0
    TLSOptions.OpenSSL_Options.LibPath = oslpNone
    TLSOptions.SChannel_Options.CertStoreName = scsnMY
    TLSOptions.SChannel_Options.CertStorePath = scspStoreCurrentUser
    Left = 416
    Top = 8
  end
  object MQTT: TsgcWSPClient_MQTT
    OnMQTTConnect = MQTTMQTTConnect
    OnMQTTPublish = MQTTMQTTPublish
    OnMQTTSubscribe = MQTTMQTTSubscribe
    OnMQTTUnSubscribe = MQTTMQTTUnSubscribe
    OnMQTTDisconnect = MQTTMQTTDisconnect
    Client = WSClient
    Authentication.Enabled = True
    Authentication.Password = 'sgc'
    Authentication.UserName = 'sgc'
    HeartBeat.Enabled = True
    HeartBeat.Interval = 5
    HeartBeat.Timeout = 0
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
    Left = 464
    Top = 8
  end
end
