VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "CoreEx"
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
'>### CoreEx �N���X
'>
'>**Remarks**
'>
'>CoreEx�N���X<br>
'>**���̃N���X�� Static�N���X(Attribute VB_PredeclaredId = True) �ł��B**
'>ArrayList/Dictionary���̃I�u�W�F�N�g�Ɉˑ�����֗����\�b�h��<br>
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
'>---
'>#### CastICompatibleProperty
'>
'>**Syntax**
'>
'>```
'>Set obj = Convert.CastICompatibleProperty(inObj)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>inObj|�K�{|ICompatibleProperty�ɑΉ������I�u�W�F�N�g|
'>
'>**Return Value**
'>
'>ICompatibleProperty�ɃL���X�g���ꂽ�I�u�W�F�N�g
'>
'>**Remarks**
'>
'>ICompatibleProperty�ϊ�<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* ICompatibleProperty
'>
Public Function CastICompatibleProperty(ByRef obj As Object) As ICompatibleProperty
    Set CastICompatibleProperty = obj
End Function
'-------------------------------------------------
' NewInstance
'-------------------------------------------------
Public Function GetNewInstance(obj As INewInstance) As Object
    Set GetNewInstance = obj.NewInstance
End Function
