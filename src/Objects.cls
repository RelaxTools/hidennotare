VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "Objects"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'-----------------------------------------------------------------------------------------------------
'
' [Hidennotare] v2.5
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
'>### Objects �N���X
'>
'>**Remarks**
'>
'>Objects�N���X<br>
'>�I�u�W�F�N�g�̑���Ɋ֌W���鏈�����܂Ƃ߂��N���X�ł��B<br>
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
'>|2019-01-01|Ver.1.0.0|�V�K�쐬|
'>
'-----------------------------------------------------------------------------------------------------
Option Explicit
'>---
'>#### SetWith(Objects)
'>
'>**Syntax**
'>
'>```
'>Objects.SetWith(inObj) = obj
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>inObj|�K�{|Variant|�����̃I�u�W�F�N�g�܂��͕ϐ�|
'>obj|�K�{|Variant|������̃I�u�W�F�N�g�܂��͕ϐ�|
'>
'>**Return Value**
'>
'>VBA�ł̓v���~�e�B�u�^�ƃI�u�W�F�N�g�^�̕ϐ��̐ݒ���@���قȂ�B<br>
'>�v���~�e�B�u�^�ł� Let �I�u�W�F�N�g�^�Ȃ� Set �����Ȃ���΂Ȃ�Ȃ���<br>
'>�v���p�e�B���ŉB���\�B<br>
'>
'>**Remarks**
'>
'>Set/Let�v���p�e�B<br>
'>VBA �l�I�ėp���� https://qiita.com/nukie_53/items/bde16afd9a6ca789949d<br>
'>@nukie_53<br>
'>Set/Let���B������v���p�e�B<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* IValueObject
'>
Public Property Let SetWith(outVariable As Variant, inExpression As Variant)
    
    Select Case True
        Case VBA.IsObject(inExpression), VBA.VarType(inExpression) = vbDataObject
            Set outVariable = inExpression
        Case Else
            Let outVariable = inExpression
    End Select

End Property
'>---
'>#### AsIValueObject(Objects)
'>
'>**Syntax**
'>
'>```
'>Set obj = Objects.AsIValueObject(inObj)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>inObj|�K�{|IValueObject�ɑΉ������I�u�W�F�N�g|
'>
'>**Return Value**
'>
'>IValueObject�ɃL���X�g���ꂽ�I�u�W�F�N�g
'>
'>**Remarks**
'>
'>IValueObject�ϊ�<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* IValueObject
'>
Public Function AsIValueObject(ByVal obj As Object) As IValueObject
    Set AsIValueObject = obj
End Function
'>---
'>#### AsINewInstance(Objects)
'>
'>**Syntax**
'>
'>```
'>Set obj = Objects.AsINewInstance(inObj)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>inObj|�K�{|INewInstance�ɑΉ������I�u�W�F�N�g|
'>
'>**Return Value**
'>
'>INewInstance�ɃL���X�g���ꂽ�I�u�W�F�N�g
'>
'>**Remarks**
'>
'>INewInstance�ϊ�<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* INewInstance
'>
Public Function AsINewInstance(ByVal obj As Object) As INewInstance
    Set AsINewInstance = obj
End Function
'>---
'>#### AsIList(Objects)
'>
'>**Syntax**
'>
'>```
'>Set obj = Objects.AsIList(inObj)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>inObj|�K�{|IList�ɑΉ������I�u�W�F�N�g|
'>
'>**Return Value**
'>
'>IList�ɃL���X�g���ꂽ�I�u�W�F�N�g
'>
'>**Remarks**
'>
'>IList�ϊ�<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* IList
'>
Public Function AsIList(ByVal obj As Object) As IList
    Set AsIList = obj
End Function
'>---
'>#### AsIDictionary(Objects)
'>
'>**Syntax**
'>
'>```
'>Set obj = Objects.AsIDictionary(inObj)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>inObj|�K�{|IDictionary�ɑΉ������I�u�W�F�N�g|
'>
'>**Return Value**
'>
'>IDictionary�ɃL���X�g���ꂽ�I�u�W�F�N�g
'>
'>**Remarks**
'>
'>IDictionary�L���X�g<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* IDictionary
'>
Public Function AsIDictionary(ByVal obj As Object) As IDictionary
    Set AsIDictionary = obj
End Function
'>---
'>#### InstanceOfIDictionary(Objects)
'>
'>**Syntax**
'>
'>```
'>ret = Objects.InstanceOfIDictionary(inObj)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>inObj|�K�{|Boolean|��������I�u�W�F�N�g�g|
'>
'>**Return Value**
'>
'>True:�Ή�/False:���Ή�
'>
'>**Remarks**
'>
'>IDictionary I/F �ɑΉ�����N���X�����肷��<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* IDictionary
'>
Public Function InstanceOfIDictionary(v As Variant) As Boolean

    Dim obj As IDictionary
    
    On Error GoTo e
    
    Set obj = v
    
    InstanceOfIDictionary = True
    Exit Function
e:
    InstanceOfIDictionary = False
    
End Function
'>---
'>#### InstanceOfIList(Objects)
'>
'>**Syntax**
'>
'>```
'>ret = Objects.InstanceOfIList(inObj)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>inObj|�K�{|Boolean|��������I�u�W�F�N�g�g|
'>
'>**Return Value**
'>
'>True:�Ή�/False:���Ή�
'>
'>**Remarks**
'>
'>IList I/F �ɑΉ�����N���X�����肷��<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* IDictionary
'>
Public Function InstanceOfIList(v As Variant) As Boolean

    Dim obj As IList
    
    On Error GoTo e
    
    Set obj = v
    
    InstanceOfIList = True
    Exit Function
e:
    InstanceOfIList = False

End Function
'>---
'>#### InstanceOfIValueObject(Objects)
'>
'>**Syntax**
'>
'>```
'>ret = Objects.InstanceOfIValueObject(inObj)
'>```
'>
'>**Parameters**
'>
'>|Name|Required/Optional|Data type|Description|
'>---|---|---|---
'>inObj|�K�{|Boolean|��������I�u�W�F�N�g|
'>
'>**Return Value**
'>
'>True:�Ή�/False:���Ή�
'>
'>**Remarks**
'>
'>IValueObject I/F �ɑΉ�����N���X�����肷��<br>
'>
'>**Example**
'>
'>* None
'>
'>**See also**
'>
'>* IDictionary
'>
Public Function InstanceOfIValueObject(v As Variant) As Boolean

    Dim obj As IValueObject
    
    On Error GoTo e
    
    Set obj = v
    
    InstanceOfIValueObject = True
    Exit Function
e:
    InstanceOfIValueObject = False

End Function