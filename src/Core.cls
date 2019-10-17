VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Core"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'-----------------------------------------------------------------------------------------------------
'
' [Hidennotare] v2
'
' Copyright (c) 2019 Yasuhiro Watanabe
' https://github.com/RelaxTools/Hidennotare
' author:relaxtools@opensquare.net
'
' The MIT License (MIT)
'
' Permission is hereby granted, free of charge, to any person obtaining a copy
' of this software and associated documentation files (the "Software"), to deal
' in the Software without restriction, including without limitation the rights
' to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
' copies of the Software, and to permit persons to whom the Software is
' furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all
' copies or substantial portions of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
' IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
' FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
' AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
' LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
' SOFTWARE.
'
'-----------------------------------------------------------------------------------------------------
'>### Core �N���X
'>
'>**Remarks**
'>
'>Core�N���X<br>
'>**���̃N���X�� Static�N���X(Attribute VB_PredeclaredId = True) �ł��B**
'>��{�I�ȋ@�\��ۗL����B<br>
'>
'>**Dependent**
'>
'>* None
'>
'>**History**
'>
'>|Date|Version|Note|
'>|---|---|---|
'>|2019-01-01|Ver.1.0.0|�V�K�쐬|
'>
'-----------------------------------------------------------------------------------------------------
Option Explicit

Public Enum NewLineCodeConstants
    NewLineCodeCRLF
    NewLineCodeLF
    NewLineCodeNone
End Enum

Public Enum EncodeConstants
    EncodeCP932
    EncodeUTF8
    EncodeUTF16LE
End Enum

Public Enum OpenModeConstants
    OpenModeOutput
    OpenModeAppend
End Enum

Public Enum CsvReaderHeaderConstants
    UseFirstRow
    AddHedder
    HeaderNone
End Enum
'-----------------------------------------------------------------------------------------------------
' �z��܂���ParamArray��Collection�ɕϊ�
'-----------------------------------------------------------------------------------------------------
Public Function ArrayToCollection(Args As Variant) As Collection
        
    Dim col As Collection
    Dim v As Variant
    
    Set col = New Collection
        
    If UBound(Args) = 0 And IsArray(Args) Then
        For Each v In Args(0)
            col.Add v
        Next
    Else
        For Each v In Args
            col.Add v
        Next
    End If

    Set ArrayToCollection = col

End Function
'-----------------------------------------------------------------------------------------------------
' VBA �l�I�ėp���� https://qiita.com/nukie_53/items/bde16afd9a6ca789949d
' @nukie_53
' Set/Let���B������v���p�e�B
'-----------------------------------------------------------------------------------------------------
Public Property Let SetVar(outVariable As Variant, inExpression As Variant)
    
    Select Case True
        Case VBA.IsObject(inExpression), VBA.VarType(inExpression) = vbDataObject
            
            Set outVariable = inExpression
        
        Case Else
            
            Let outVariable = inExpression
    
    End Select

End Property
'---------------------------------------------------------------------------------------------------
' Dictionary����
'---------------------------------------------------------------------------------------------------
Public Function IsDictionary(v As Variant) As Boolean

    IsDictionary = True
    
    Select Case TypeName(v)
        Case "Dictionary"
        Case "OrderedDictionary"
        Case "SortedDictionary"
        Case Else
            IsDictionary = False
    End Select

End Function
'---------------------------------------------------------------------------------------------------
' List����
'---------------------------------------------------------------------------------------------------
Public Function IsList(v As Variant) As Boolean

    IsList = True
    
    Select Case TypeName(v)
        Case "ArrayList"
        Case "LinkedList"
        Case "Collection"
        Case Else
            IsList = False
    End Select

End Function
'>---
'>#### TryUbound
'>
'>**Syntax**
'>
'>```
'>flg = Core.TryUBound(ary, idx, [dimension = 1])
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>|ary|�K�{|Variant|�`�F�b�N������z����w��|
'>|idx|�K�{|Long|�z��̏����ԋp����ϐ����w��|
'>|dimension|�ȗ���|Long|�ȗ����P�i�����j�B�e�X�g���鎟�������w��|
'>
'>**Return Value**
'>
'>|Name|Data type|Description|
'>---|---|---
'>|flg|Boolean|����:True / �G���[:False|
'>
'>**Remarks**
'>
'>�G���[���m�t��UBound<br>
'>�e�X�g����z�񂪂P�����̏ꍇ�ɂQ�����̏�������߂悤�Ƃ���Ǝ��s���G���[�ɂȂ�B<br>
'>���̂��߃G���[���m�\��Ubound�Ƃ��č쐬�B�G���[�̏ꍇ�ɂ� False ���ԋp�����B
'>
'>**Example**
'>
'>**See also**
'>
'>* Core.TryLBound
'>
Public Function TryUBound(ary As Variant, idx As Long, Optional ByVal dimension As Long = 1) As Boolean
 
    On Error GoTo e
    
    idx = UBound(ary, dimension)

    TryUBound = True
    
    Exit Function
e:
    TryUBound = False

End Function
'>---
'>#### TryLBound
'>
'>**Syntax**
'>
'>```
'>flg = Core.TryLBound(ary, idx, [dimension = 1])
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>|ary|�K�{|Variant|�`�F�b�N������z����w��|
'>|idx|�K�{|Long|�z��̉�����ԋp����ϐ����w��|
'>|dimension|�ȗ���|Long|�ȗ����P�i�����j�B�e�X�g���鎟�������w��|
'>
'>**Return Value**
'>
'>|Name|Data type|Description|
'>---|---|---
'>|flg|Boolean|����:True / �G���[:False|
'>
'>**Remarks**
'>
'>�G���[���m�t��UBound<br>
'>�e�X�g����z�񂪂P�����̏ꍇ�ɂQ�����̉��������߂悤�Ƃ���Ǝ��s���G���[�ɂȂ�B<br>
'>���̂��߃G���[���m�\��Ubound�Ƃ��č쐬�B�G���[�̏ꍇ�ɂ� False ���ԋp�����B
'>
'>**Example**
'>
'>**See also**
'>
'>* Core.TryUBound
'>
Public Function TryLBound(ary As Variant, lngIdx As Long, Optional ByVal dimension As Long = 1) As Boolean
 
    On Error GoTo e
    
    lngIdx = LBound(ary, dimension)

    TryLBound = True
    
    Exit Function
e:
    TryLBound = False

End Function
'------------------------------------------------------------------------------------------------------------------------
' ��ʃo�C�g�擾
'------------------------------------------------------------------------------------------------------------------------
Public Function UByte(ByVal lngValue As Long) As Long
    UByte = RShift((lngValue And &HFF00&), 8)
End Function
'------------------------------------------------------------------------------------------------------------------------
' ���ʃo�C�g�擾
'------------------------------------------------------------------------------------------------------------------------
Public Function LByte(ByVal lngValue As Long) As Long
    LByte = lngValue And &HFF&
End Function
'------------------------------------------------------------------------------------------------------------------------
' ���V�t�g
'------------------------------------------------------------------------------------------------------------------------
Public Function LShift(ByVal lngValue As Long, ByVal lngKeta As Long) As Long
    LShift = lngValue * (2 ^ lngKeta)
End Function
'------------------------------------------------------------------------------------------------------------------------
' �E�V�t�g
'------------------------------------------------------------------------------------------------------------------------
Public Function RShift(ByVal lngValue As Long, ByVal lngKeta As Long) As Long
    RShift = lngValue \ (2 ^ lngKeta)
End Function
'--------------------------------------------------------------
'  �T���Q�[�g�y�A�Ή�Len
'--------------------------------------------------------------
Public Function LenEx(ByVal strBuf As String) As Long

    Dim bytBuf() As Byte
    Dim lngBuf As Long
    Dim i As Long
    Dim lngLen As Long
    
    lngLen = 0
    
    If Len(strBuf) = 0 Then
        LenEx = 0
        Exit Function
    End If
    
    bytBuf = strBuf
    
    For i = LBound(bytBuf) To UBound(bytBuf) Step 2
    
        lngBuf = Core.LShift(bytBuf(i + 1), 8) + bytBuf(i)
    
        Select Case lngBuf
            '��ʃT���Q�[�g
            Case &HD800& To &HDBFF&
                lngLen = lngLen + 1
            '���ʃT���Q�[�g
            Case &HDC00& To &HDFFF&
                '�J�E���g���Ȃ�
            Case Else
                lngLen = lngLen + 1
        End Select
    
    Next
    
    LenEx = lngLen

End Function
'--------------------------------------------------------------
'  �S�p�Ή��g����
'--------------------------------------------------------------
Public Function TrimEx(ByVal strBuf As String) As String
 
    Dim lngLen As Long
    Dim lngStart As Long
    Dim lngEnd As Long
    
    lngLen = Len(strBuf)
    
    lngStart = 1
    Do Until lngStart > lngLen
        Select Case Mid$(strBuf, lngStart, 1)
            Case Is <= " "
            Case Is = "�@"
            Case Else
                Exit Do
        End Select
        lngStart = lngStart + 1
    Loop
    
    lngEnd = lngLen
    Do Until lngEnd < 1
        Select Case Mid$(strBuf, lngEnd, 1)
            Case Is <= " "
            Case Is = "�@"
            Case Else
                Exit Do
        End Select
        lngEnd = lngEnd - 1
    Loop
    
    If lngEnd > 0 Or lngStart <= lngLen Then
        TrimEx = Mid$(strBuf, lngStart, (lngEnd - lngStart) + 1)
    Else
        TrimEx = ""
    End If

End Function
'--------------------------------------------------------------
'�@������̃o�C�g�������߂�B�����Q�o�C�g�A���p�P�o�C�g�B
'--------------------------------------------------------------
Public Function AscLen(ByVal var As Variant) As Long

    Dim ascVar As Variant
    
    ascVar = VBA.StrConv(var, vbFromUnicode)

    AscLen = LenB(ascVar)

End Function
'----------------------------------------------------------------------------------
'�@������̍��[����w�肵�����������̕������Ԃ��B�����Q�o�C�g�A���p�P�o�C�g�B
'----------------------------------------------------------------------------------
Public Function AscLeft(ByVal var As Variant, ByVal lngSize As Long) As String

    Dim lngLen As Long
    Dim i As Long
    
    Dim strChr As String
    Dim strResult As String
    
    lngLen = Len(var)
    strResult = ""

    For i = 1 To lngLen
    
        strChr = Mid$(var, i, 1)
        If AscLen(strResult & strChr) > lngSize Then
            Exit For
        End If
        strResult = strResult & strChr
    
    Next

    AscLeft = strResult

End Function
'--------------------------------------------------------------
'�@�J�n������̔���
'--------------------------------------------------------------
Public Function StartsWith(ByVal strBuf As String, ByVal strWith As String) As Boolean

    StartsWith = (strWith = Left$(strBuf, Len(strWith)))

End Function
'--------------------------------------------------------------
'�@�I��������̔���
'--------------------------------------------------------------
Public Function EndsWith(ByVal strBuf As String, ByVal strWith As String) As Boolean

    EndsWith = (strWith = Right$(strBuf, Len(strWith)))

End Function
'>---
'>#### Escape(Core)
'>
'>**Syntax**
'>
'>```
'>ret = Core.Escape(strBuf)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>strBuf|�K�{|String|���䕶�����G�X�P�[�v���镶������w��|
'>
'>**Return Value**
'>
'>|Name|Data type|Description|
'>---|---|---
'>|ret|String|�G�X�P�[�v��̕�����|
'>
'>**Remarks**
'>
'>������̃G�X�P�[�v�i���K�\���j<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* Core.Unescape
'>
Public Function Escape(ByVal v As String) As String

    Dim strChr As String
    Dim SB As StringBuilder
    Dim i As Long
    
    Set SB = New StringBuilder
    
    For i = 1 To Len(v)
        
        strChr = Mid$(v, i, 1)
        
        Select Case AscW(strChr)
            Case &H0 To &H7, &HB, &HE To &H1F, &H7F
                SB.Append "\u" & Hex$(AscW(strChr))
            Case &H8
                SB.Append "\b"
            Case &H9
                SB.Append "\t"
            Case &HA
                SB.Append "\n"
            Case &HC
                SB.Append "\f"
            Case &HD
                SB.Append "\r"
            Case &H22
                SB.Append "\"""
            Case &H2F
                SB.Append "\/"
            Case &H5C
                SB.Append "\\"
            Case Else
                SB.Append strChr
        End Select

    Next
    
    Escape = SB.ToString

End Function
'>---
'>#### Unescape(Core)
'>
'>**Syntax**
'>
'>```
'>ret = Core.Unescape(strBuf)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>strBuf|�K�{|String|�A���G�X�P�[�v���镶������w��|
'>
'>**Return Value**
'>
'>|Name|Data type|Description|
'>---|---|---
'>|ret|String|�A���G�X�P�[�v��̕�����|
'>
'>**Remarks**
'>
'>������̃A���G�X�P�[�v�i���K�\���j<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* Core.Escape
'>
Public Function Unescape(ByVal v As String) As String

    Dim strChr As String
    Dim strBuf As String
    Dim SB As StringBuilder
    Dim i As Long
    
    Set SB = New StringBuilder
    i = 1
    Do Until i > Len(v)

        strChr = Mid$(v, i, 2)
        
        Select Case strChr
            Case "\u"
            
                If i + 6 - 1 > Len(v) Then
                    Err.Raise 512 + 1, TypeName(Me) & ".Unescape", "format error"
                End If
            
                SB.Append ChrW$(Val("&H" & Mid$(v, i + 2, 4)))
                i = i + 6
            Case "\b"
                SB.Append Chr$(&H8)
                i = i + 2
            Case "\t"
                SB.Append vbTab
                i = i + 2
            Case "\n"
                SB.Append vbLf
                i = i + 2
            Case "\f"
                SB.Append Chr$(&HC)
                i = i + 2
            Case "\r"
                SB.Append vbCr
                i = i + 2
            Case "\"""
                SB.Append """"
                i = i + 2
            Case "\/"
                SB.Append "/"
                i = i + 2
            Case "\\"
                SB.Append "\"
                i = i + 2
            Case Else
                SB.Append Left$(strChr, 1)
                i = i + 1
        End Select

    Loop

    Unescape = SB.ToString

End Function