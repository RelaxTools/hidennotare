VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "SortedDictionary"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'-----------------------------------------------------------------------------------------------------
'
' [MLangBuilder] v1
'
' Copyright (c) 2019 Yasuhiro Watanabe
' https://github.com/RelaxTools/MFunctionCreater
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
' SortedDictionary �N���X
'-----------------------------------------------------------------------------------------------------
' �Ϗ� : Dictionary
'-----------------------------------------------------------------------------------------------------
' TODO : Key�̏��Ԃ��\�[�g�ł���Dictionary
'        �{�ƂƈقȂ�_�BFor Each ���g���ꍇ�ɂ� XX.Keys ���ȗ��ł��Ȃ��B
'        IDictionary I/F ���g�p����K�v������B
'
'        Dim dic As IDictionary
'        Set dic = New SortedDictionary
'
'        dic.Add Key, Value
'
'-----------------------------------------------------------------------------------------------------
' NOTE : ToString ����� JSON Object ���o�͂��܂��B
'        https://www.json.org/json-ja.html
'-----------------------------------------------------------------------------------------------------
Option Explicit
Implements ICursor
Implements IDictionary
Implements IConstructor
Implements INewInstance
Implements IDictionaryAccessor

'VBA�ł́u�p���v���ł��Ȃ����߁u�Ϗ��v����B
Private mDic As IDictionary
Private mCP As IComparer
Private mIndex As Long
Private Sub Class_Initialize()
    Set mDic = New Dictionary
    mIndex = 0
End Sub
Private Sub Class_Terminate()
    Set mDic = Nothing
End Sub
'--------------------------------------------------------------
' �R���X�g���N�^
'--------------------------------------------------------------
Private Function IConstructor_Instancing(Args As Collection) As Object
    
    '�R���p���[�^
    If Args.Count = 1 Then
        Set mCP = Args(1)
    Else
        Exit Function
    End If
    
    Set IConstructor_Instancing = Me

End Function
'--------------------------------------------------------------
'  IDictionary I/F �擾
'--------------------------------------------------------------
Public Function GetIDictionary() As IDictionary
    Set GetIDictionary = Me
End Function
Private Sub IDictionary_Add(KeyValue As Variant, obj As Variant)
    mDic.Add KeyValue, obj
End Sub
Private Function IDictionary_ContainsKey(KeyValue As Variant) As Boolean
    IDictionary_ContainsKey = mDic.ContainsKey(KeyValue)
End Function
'--------------------------------------------------------------
'  �\�[�g�ς݃L�[���X�g�擾
'--------------------------------------------------------------
Private Function IDictionary_Keys() As Variant
    IDictionary_Keys = Sort()
End Function
Private Property Get IDictionary_Count() As Long
    IDictionary_Count = mDic.Count
End Property
Private Property Get IDictionary_Item(KeyValue As Variant) As Variant
    If VBA.IsObject(mDic.Item(KeyValue)) Then
        Set IDictionary_Item = mDic.Item(KeyValue)
    Else
        IDictionary_Item = mDic.Item(KeyValue)
    End If
End Property
Private Property Let IDictionary_Item(KeyValue As Variant, NewItem As Variant)
    mDic.Item(KeyValue) = NewItem
End Property
Private Property Set IDictionary_Item(KeyValue As Variant, NewItem As Variant)
    Set mDic.Item(KeyValue) = NewItem
End Property
Private Property Let IDictionary_Key(OldKey As Variant, NewKey As Variant)
    mDic.Key(OldKey) = NewKey
End Property
Private Sub IDictionary_Remove(KeyValue As Variant)
    mDic.Remove KeyValue
End Sub
Private Sub IDictionary_Clear()
    mDic.Clear
End Sub
Private Function IDictionary_ToString() As String
    IDictionary_ToString = mDic.ToString
End Function
Private Property Get IDictionary_GetCursor() As ICursor
    Set IDictionary_GetCursor = Me
End Property
'--------------------------------------------------------------
'  ICursor �� Eof �v���p�e�B���擾
'--------------------------------------------------------------
Private Property Get ICursor_Eof() As Boolean
    ICursor_Eof = mIndex > mDic.Count - 1
End Property
'--------------------------------------------------------------
'  ICursor �� Item �v���p�e�B���擾
'--------------------------------------------------------------
Private Property Get ICursor_Item(Optional ByVal opt As Variant) As Variant
    
    Dim v As Variant
    
    v = Sort()
    
    If mIndex > mDic.Count - 1 Then
        ICursor_Item = v(mDic.Count - 1)
    Else
        ICursor_Item = v(mIndex)
    End If

End Property
'--------------------------------------------------------------
'  ICursor �� �J�[�\���ʒu��������
'--------------------------------------------------------------
Private Sub ICursor_MoveFirst()
    mIndex = 0
End Sub
'--------------------------------------------------------------
'  ICursor �� �J�[�\���ʒu�����Ɉړ�
'--------------------------------------------------------------
Private Sub ICursor_MoveNext()

    mIndex = mIndex + 1
    If mIndex > mDic.Count Then
        mIndex = mDic.Count
    End If

End Sub
'--------------------------------------------------------------
'  �L�[�̃\�[�g
'--------------------------------------------------------------
Private Function Sort() As Variant

    Dim i As Long
    Dim j As Long
    Dim n As Long
    Dim wk As String
    Dim strKey As Variant
    
    If mCP Is Nothing Then
        Set mCP = New IComparer
    End If
    
    strKey = mDic.Keys

    '�v�f��
    n = UBound(strKey) - LBound(strKey) + 1
    
    '�\�[�g�s�v
    If n <= 1 Then
        GoTo e
    End If

    '�}���\�[�g
    For i = 1 To n - 1

        wk = strKey(i)
        
        Dim lngCmp As Long
        
        lngCmp = mCP.Compare(strKey(i - 1), wk)

        If lngCmp > 0 Then

            j = i

            Do

                strKey(j) = strKey(j - 1)

                j = j - 1

                If j = 0 Then
                    Exit Do
                End If

                lngCmp = mCP.Compare(strKey(j - 1), wk)
            
            Loop While lngCmp > 0
            
            strKey(j) = wk

        End If
    Next

e:
    Sort = strKey

End Function
'--------------------------------------------------------------
' �C���X�^���X���� I/F
'--------------------------------------------------------------
Private Function INewInstance_NewInstance() As Object

    Dim d As IDictionary
    
    Set d = New SortedDictionary
    
    Set INewInstance_NewInstance = d

End Function
'--------------------------------------------------------------
' IDictionaryAccessor I/F
'--------------------------------------------------------------
Private Sub IDictionaryAccessor_SetProperty(prop As Variant, Val As Variant)
    
    Me.GetIDictionary.Add prop, Val
    
End Sub
Private Function IDictionaryAccessor_GetProperty(prop As Variant) As Variant
    If IsObject(Me.GetIDictionary.Item(prop)) Then
        Set IDictionaryAccessor_GetProperty = Me.GetIDictionary.Item(prop)
    Else
        Let IDictionaryAccessor_GetProperty = Me.GetIDictionary.Item(prop)
    End If
End Function
