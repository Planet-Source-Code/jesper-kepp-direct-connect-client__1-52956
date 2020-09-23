VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   4365
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9105
   LinkTopic       =   "Form1"
   ScaleHeight     =   4365
   ScaleWidth      =   9105
   StartUpPosition =   2  'CenterScreen
   Begin VB.CheckBox cEnableSearchReport 
      Caption         =   "Enable Search Report"
      Height          =   195
      Left            =   45
      TabIndex        =   17
      Top             =   2205
      Width           =   1920
   End
   Begin VB.CheckBox cEnableAutoTrigger 
      Caption         =   "Enable Triggers"
      Height          =   225
      Left            =   45
      TabIndex        =   16
      Top             =   1920
      Width           =   1410
   End
   Begin VB.TextBox txtShare 
      Height          =   285
      Left            =   1665
      TabIndex        =   15
      Top             =   1410
      Width           =   855
   End
   Begin VB.TextBox txtDesc 
      Height          =   285
      Left            =   45
      TabIndex        =   13
      Top             =   1410
      Width           =   1605
   End
   Begin VB.CommandButton cmdMode2 
      Height          =   390
      Left            =   45
      TabIndex        =   11
      Top             =   3930
      Width           =   2505
   End
   Begin MSWinsockLib.Winsock ws 
      Left            =   3120
      Top             =   2385
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton cmdMode 
      Height          =   360
      Left            =   45
      TabIndex        =   10
      Top             =   3585
      Width           =   2505
   End
   Begin VB.TextBox txtSend 
      Height          =   270
      Left            =   2640
      TabIndex        =   9
      Top             =   4065
      Width           =   6405
   End
   Begin RichTextLib.RichTextBox rtfIncome 
      Height          =   4020
      Left            =   2640
      TabIndex        =   8
      Top             =   15
      Width           =   6390
      _ExtentX        =   11271
      _ExtentY        =   7091
      _Version        =   393217
      ScrollBars      =   2
      TextRTF         =   $"Form1.frx":0000
   End
   Begin VB.TextBox txtPass 
      Height          =   285
      Left            =   1665
      TabIndex        =   6
      Top             =   855
      Width           =   855
   End
   Begin VB.TextBox txtName 
      Height          =   285
      Left            =   45
      TabIndex        =   4
      Top             =   855
      Width           =   1605
   End
   Begin VB.TextBox txtPort 
      Height          =   285
      Left            =   1905
      TabIndex        =   3
      Text            =   "411"
      Top             =   240
      Width           =   615
   End
   Begin VB.TextBox txtIP 
      Height          =   285
      Left            =   60
      TabIndex        =   0
      Top             =   240
      Width           =   1815
   End
   Begin VB.Label lblShare 
      Caption         =   "Share :"
      Height          =   195
      Left            =   1650
      TabIndex        =   14
      Top             =   1200
      Width           =   570
   End
   Begin VB.Label lblDescription 
      Caption         =   "Desc :"
      Height          =   195
      Left            =   45
      TabIndex        =   12
      Top             =   1200
      Width           =   525
   End
   Begin VB.Label lblPass 
      Caption         =   "Password :"
      Height          =   210
      Left            =   1665
      TabIndex        =   7
      Top             =   645
      Width           =   825
   End
   Begin VB.Label lblName 
      Caption         =   "Name :"
      Height          =   180
      Left            =   60
      TabIndex        =   5
      Top             =   645
      Width           =   585
   End
   Begin VB.Label lblPort 
      Caption         =   "Port :"
      Height          =   165
      Left            =   1920
      TabIndex        =   2
      Top             =   30
      Width           =   420
   End
   Begin VB.Label lblIP 
      Caption         =   "IP / DNS :"
      Height          =   195
      Left            =   60
      TabIndex        =   1
      Top             =   30
      Width           =   1080
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim HubName As String
Dim MainKeyW(12) As String


Private Sub cmdMode_Click()

    ws.Close
    ws.Connect txtIP.Text, txtPort.Text

End Sub

Private Sub cmdMode2_Click()
    
    ws.Close
    rtfIncome.Text = ""
    
End Sub

Private Sub Form_Load()

    cmdMode.Caption = "Connect"
    cmdMode2.Caption = "Disconnect"
    
    MainKeyW(0) = "PtokaX"
    MainKeyW(1) = "Y-Hub"
    MainKeyW(2) = "vbDC"
    MainKeyW(3) = "GoodMorning"
    MainKeyW(4) = "GoodEvning"
    MainKeyW(5) = "GoodNight"
    MainKeyW(6) = "Fuck"
    MainKeyW(7) = "Pussy"
    MainKeyW(8) = "lol"
    MainKeyW(9) = "wtf"
    MainKeyW(10) = "plop"
    MainKeyW(11) = "nightlitch"

End Sub

Private Sub txtSend_KeyPress(KeyAscii As Integer)

    If KeyAscii = vbKeyReturn Then
        Call SendChat
    End If

End Sub

Private Sub ws_DataArrival(ByVal bytesTotal As Long)

    Dim sData As String
    ws.GetData sData
    
    If (Left(sData, 6) = "$Lock ") Then
        SriptItOut (sData)
    ElseIf (Left(sData, 9) = "$HubName ") Then
        sData = Replace(sData, "$HubName ", "")
        iLEN = InStr(1, sData, "|")
        sData = Left(sData, iLEN)
        sData = Replace(sData, "|", "")
        frmMain.Caption = sData
    ElseIf (Left(sData, 1) = "<") Then
        ProcessMain (sData)
    End If

End Sub

Private Sub SriptItOut(sData)
Dim key As String
'This is how it works, The Server sends a $Lock and Pk=
'Pk= is unused and therefor we must remove that from that
'string.
'
'We can't convert $Lock so we replace that with the replace function.
'When that is done we go pass what's left of that string to another function that will
'Convert it for us.
'
'Now we send the $Key
'$ValidateNick <User>
'$Version 1.0091
'$MyINFO
'TADA, you're logged in!

    'NewLine (sData)
    key = Replace(sData, "$Lock ", "")
    key = Left(key, Len(sData) - 33)
    key = Lock2Key(key)
    'rtfIncome.Text = key
    
    ws.SendData "$Key " & key & "|"
    ws.SendData "$ValidateNick " & txtName.Text & "|"
    ws.SendData "$Version 1.0091" & "|"
    ws.SendData "$MyINFO $ALL " & txtName.Text & " " & txtDesc.Text & " <vbDC V:0.04a><++ V:0.307,M:A,H:1/0/0,S:3>$ $LAN(T1)$$" & txtShare.Text * 1024 * 1024 * 1024 & "$" & "|"

End Sub

Private Sub ProcessMain(sData)

    Dim Brack As String
    Dim Brack2 As String
    Dim StartingPos As Integer
    Dim cCheck As Integer
    
    sData = Replace(sData, "|", "")
    'NewLine (sData) Not so, It actually displays..
    
    'Remove the name within the string, <Nick>
    Brack = InStr(1, sData, "> ")
    Brack2 = Left(sData, Brack)
    StartingPos = Len(Brack2)
    
    If cEnableAutoTrigger.Value = 1 Then    'On / Off
        If InStr(StartingPos, sData, MainKeyW(0)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & UCase("PTOKAX") & ", YEA The best hubsoftware. http://board.univ-angers.fr/main.php" & "|"

        ElseIf InStr(StartingPos, sData, MainKeyW(1)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "Hey, Don't ever ever mention yhub again, Understood?" & "|"

        ElseIf InStr(StartingPos, sData, MainKeyW(2)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "Visual Basic Direct Connect made by Kepp" & "|"
        
        ElseIf InStr(StartingPos, sData, MainKeyW(3)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "goodnight.." & "|"
        
        ElseIf InStr(StartingPos, sData, MainKeyW(4)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "goodmorning" & "|"
        
        ElseIf InStr(StartingPos, sData, MainKeyW(5)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "Time for breakfast" & "|"
        
        ElseIf InStr(StartingPos, sData, MainKeyW(6)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "NO, I don't want to sleep with you, Stop asking me" & "|"
        
        ElseIf InStr(StartingPos, sData, MainKeyW(7)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "Where's the pussy? i can't see it, Mjau, Mjau" & "|"
        
        ElseIf InStr(StartingPos, sData, MainKeyW(8)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "Yea, that was really funny.... DOH" & "|"
        
        ElseIf InStr(StartingPos, sData, MainKeyW(9)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "Shat the fack ap???" & "|"
            
        ElseIf InStr(StartingPos, sData, MainKeyW(10)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "Plop for MODERATOR!!!!!!" & "|"
            
        ElseIf InStr(StartingPos, sData, MainKeyW(11)) > 0 Then
            ws.SendData "<" & txtName.Text & "> " & "The coder of NXS-3- :D" & "|"
        End If
        Else
    End If

End Sub

Private Sub SendChat()

    If Len(txtSend.Text) = 0 Then
        MsgBox "Please enter something to send.", vbExclamation, "Error"
    ElseIf txtSend.Text = "/clear" Then
        rtfIncome.Text = ""
    Else
        ws.SendData "<" & txtName.Text & "> " & txtSend.Text & "|"
        NewLine ("<" & txtName.Text & "> " & txtSend.Text)
        txtSend.Text = ""
    End If
    
End Sub
