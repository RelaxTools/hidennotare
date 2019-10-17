VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Graphics"
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
'>### Graphics �N���X
'>
'>**Remarks**
'>
'>PNG�`���̓ǂݍ��ݏ������݂��s����N���X<br>
'>**���̃N���X�� Static�N���X(Attribute VB_PredeclaredId = True) �ł��B**
'>
'>**Dependent**
'>
'>* None
'>
'>**History**
'>
'>|Date|Version|Note|
'>|---|---|---|
'>|2019-09-04|Ver.1.0.0|�V�K�쐬|
'>
'-----------------------------------------------------------------------------------------------------
Option Explicit
'>---
'>#### LoadPicture(Graphics)
'>
'>**Syntax**
'>
'>```
'>Set var = Graphics.LoadPicture(filename)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>|Graphics|�K�{|Graphics|Graphics�N���X���w�肵�܂��B|
'>|filename|�K�{|String|���[�h����摜�t�@�C�������w�肵�܂��B|
'>
'>**Return Value**
'>
'>|Name|Data type|Description|
'>---|---|---
'>|var|IPicture|VBA�Ŏg�p�\�ȃs�N�`���`��|
'>
'>**Remarks**
'>
'>�摜�t�@�C����VBA�ŕ\���ł���Picture�`���ɕϊ����܂��B<br>
'>�Ή��t�H�[�}�b�g:BMP, GIF, JPEG, PNG, TIFF, Exif, WMF, and EMF
'>
'>**See also**
'>
'>* SavePicture
'>
Public Function LoadPicture(ByVal FileName As String) As IPictureDisp

    '���݃`�F�b�N
    If Not FileIO.FileExists(FileName) Then
        Err.Raise 512 + 1, TypeName(Me) & "LoadPicture", "file not found"
    End If
    
    '�`���`�F�b�N
    Select Case UCase(FileIO.GetExtensionName(FileName))
        Case "BMP"
        Case "GIF"
        Case "PNG"
        Case "JPG", "JPEG"
        Case "WMF", "EMF"
        Case "EXIF"
        Case "TIF", "TIFF"
        Case Else
            Err.Raise 512 + 1, TypeName(Me) & "LoadPicture", "Not Support Type "
    End Select

    Set LoadPicture = GDIPlus.CreateObjectFromFile(FileName).ToPicture

End Function
'>---
'>#### SavePicture(Graphics)
'>
'>**Syntax**
'>
'>```
'>Graphics.SavePicture(picture, filename)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>|Graphics|�K�{|Graphics|Graphics�N���X���w�肵�܂��B|
'>|picture|�K�{|IPictureDisp|�ۑ�����摜��Picture�v���p�e�B���w�肵�܂��B|
'>|filename|�K�{|String|�ۑ�����摜�t�@�C�������w�肵�܂��B|
'>
'>**Return Value**
'>
'>* None
'>
'>**Remarks**
'>
'>�w�肳�ꂽPicture��PNG�`���ŕۑ����܂��B<br>
'>���A�ۑ��`�����g�p�������ꍇ�ɂ�GDIPlus�N���X�𗘗p���邱�ƁB<br>
'>
'>**See also**
'>
'>* LoadPicture
'>
Public Sub SavePicture(Picture As IPictureDisp, FileName As String)

    If FileIO.FileExists(FileName) Then
    
        If Message.Question("�t�@�C�������݂��܂��B�㏑�����܂����H") Then
            Exit Sub
        End If
    
        Call FileIO.DeleteFile(FileName)
    
    End If

    With GDIPlus.CreateObjectFromIPictureDisp(Picture)
        Call .SaveAsPNG(FileName)
    End With
    
End Sub



