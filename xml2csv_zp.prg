If Adir(aFiles, '???????z.xml') > 0
	For i = 1 To Alen(aFiles, 1)
		Set Textmerge To
		oVfp = nfXMLRead(aFiles[i,1])
		Set Textmerge To (Juststem(aFiles[i,1])+'.csv')
		Set Textmerge On
*For Each ���� In oVfp.�������.������������������.��������� FoxObject
		If Val(oVfp.�������.����������������.�����������������) > 1
			For Each ���� In oVfp.�������.������������������.��������� &&FoxObject
				\\<<����.�����������>>;<<����.�������>>;<<����.���>>;<<����.��������>>;<<Ltrim(Str(Round(Val(����.�����),2),15,2))>>
				\
			Next
		Else
			With oVfp.�������.������������������.���������
				\\<<.�����������>>;<<.�������>>;<<.���>>;<<.��������>>;<<Ltrim(Str(Round(Val(.�����),2),15,2))>>
				\
			Endwith
		Endif
		Set Textmerge To
	Next
Endif
