VERSION 5.00
Object = "{3B7C8863-D78F-101B-B9B5-04021C009402}#1.2#0"; "RICHTX32.OCX"
Begin VB.Form frmTimers 
   Caption         =   "Form2"
   ClientHeight    =   4365
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   9105
   LinkTopic       =   "Form2"
   ScaleHeight     =   4365
   ScaleWidth      =   9105
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdClose 
      Caption         =   "X"
      Height          =   255
      Left            =   8760
      TabIndex        =   21
      Top             =   0
      Width           =   315
   End
   Begin RichTextLib.RichTextBox rtfExplaination 
      Height          =   3525
      Left            =   3480
      TabIndex        =   20
      Top             =   255
      Width           =   5280
      _ExtentX        =   9313
      _ExtentY        =   6218
      _Version        =   393217
      Enabled         =   -1  'True
      ReadOnly        =   -1  'True
      TextRTF         =   $"frmTimers.frx":0000
   End
   Begin VB.Timer tmrTimers 
      Interval        =   1000
      Left            =   225
      Top             =   2355
   End
   Begin VB.CheckBox cEnableDates 
      Caption         =   "Enable Dates"
      Height          =   210
      Left            =   3285
      TabIndex        =   18
      Top             =   3975
      Width           =   1305
   End
   Begin VB.CheckBox cEnableTimers 
      Caption         =   "Enable Timers"
      Height          =   195
      Left            =   360
      TabIndex        =   17
      Top             =   3960
      Width           =   1350
   End
   Begin VB.TextBox txtDate4 
      Height          =   285
      Left            =   1680
      TabIndex        =   15
      Top             =   1875
      Width           =   1545
   End
   Begin VB.TextBox txtDate3 
      Height          =   285
      Left            =   1665
      TabIndex        =   6
      Top             =   1350
      Width           =   1545
   End
   Begin VB.TextBox txtDate2 
      Height          =   285
      Left            =   1665
      TabIndex        =   5
      Top             =   825
      Width           =   1545
   End
   Begin VB.TextBox txtDate1 
      Height          =   285
      Left            =   1650
      TabIndex        =   4
      Top             =   285
      Width           =   1545
   End
   Begin VB.TextBox txtTimer4 
      Height          =   285
      Left            =   90
      TabIndex        =   3
      Top             =   1860
      Width           =   1170
   End
   Begin VB.TextBox txtTimer3 
      Height          =   285
      Left            =   75
      TabIndex        =   2
      Top             =   1335
      Width           =   1170
   End
   Begin VB.TextBox txtTimer2 
      Height          =   285
      Left            =   75
      TabIndex        =   1
      Top             =   810
      Width           =   1170
   End
   Begin VB.TextBox txtTimer1 
      Height          =   285
      Left            =   60
      TabIndex        =   0
      Top             =   285
      Width           =   1170
   End
   Begin VB.Label lblWhatsTHis 
      Caption         =   "What's This ?"
      Height          =   180
      Left            =   3480
      TabIndex        =   19
      Top             =   60
      Width           =   1035
   End
   Begin VB.Label lblDownHeader 
      BorderStyle     =   1  'Fixed Single
      Height          =   420
      Left            =   240
      TabIndex        =   16
      Top             =   3840
      Width           =   8550
   End
   Begin VB.Label lblDate4 
      Caption         =   "Date 4 :"
      Height          =   195
      Left            =   1680
      TabIndex        =   14
      Top             =   1665
      Width           =   630
   End
   Begin VB.Label lblDate3 
      Caption         =   "Date 3 :"
      Height          =   180
      Left            =   1665
      TabIndex        =   13
      Top             =   1140
      Width           =   615
   End
   Begin VB.Label lblDate2 
      Caption         =   "Date 2 :"
      Height          =   180
      Left            =   1665
      TabIndex        =   12
      Top             =   615
      Width           =   660
   End
   Begin VB.Label lblDate1 
      Caption         =   "Date 1 :"
      Height          =   180
      Left            =   1650
      TabIndex        =   11
      Top             =   75
      Width           =   645
   End
   Begin VB.Label lblTimer4 
      Caption         =   "Timer 4 :"
      Height          =   180
      Left            =   60
      TabIndex        =   10
      Top             =   1650
      Width           =   675
   End
   Begin VB.Label lblTimer3 
      Caption         =   "Timer 3 :"
      Height          =   180
      Left            =   45
      TabIndex        =   9
      Top             =   1125
      Width           =   690
   End
   Begin VB.Label lblTimer2 
      Caption         =   "Timer 2 :"
      Height          =   180
      Left            =   45
      TabIndex        =   8
      Top             =   600
      Width           =   675
   End
   Begin VB.Label lblTimer1 
      Caption         =   "Timer 1 :"
      Height          =   195
      Left            =   30
      TabIndex        =   7
      Top             =   75
      Width           =   660
   End
End
Attribute VB_Name = "frmTimers"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

End Sub
