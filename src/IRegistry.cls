VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "IRegistry"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
'--------------------------------------------------------------
' ���W�X�g���ǂݍ���
'--------------------------------------------------------------
Public Function GetSetting(ByVal Section As String, ByVal key As String, Optional ByVal Default As String = "") As String
End Function
'--------------------------------------------------------------
' ���W�X�g����������
'--------------------------------------------------------------
Public Sub SaveSetting(ByVal Section As String, ByVal key As String, ByVal Value As String)
End Sub
'--------------------------------------------------------------
'���W�X�g���폜
'--------------------------------------------------------------
Public Sub DeleteSetting(ByVal Section As String, Optional ByVal key As String = "")
End Sub
'--------------------------------------------------------------
' ���W�X�g����Export
' UTF-16 LE �ɂă��W�X�g���̓��e���o�͂���B
'--------------------------------------------------------------
Public Sub Export()
End Sub

