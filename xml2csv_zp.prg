If Adir(aFiles, '???????z.xml') > 0
	For i = 1 To Alen(aFiles, 1)
		Set Textmerge To
		oVfp = nfXMLRead(aFiles[i,1])
		Set Textmerge To (Juststem(aFiles[i,1])+'.csv')
		Set Textmerge On
*For Each сотр In oVfp.счетапк.зачислениезарплаты.сотрудник FoxObject
		If Val(oVfp.счетапк.контрольныесуммы.количествозаписей) > 1
			For Each сотр In oVfp.счетапк.зачислениезарплаты.сотрудник
				\\<<сотр.ЛицевойСчет>>;<<сотр.Фамилия>>;<<сотр.Имя>>;<<сотр.Отчество>>;<<Ltrim(Str(Round(Val(сотр.Сумма),2),15,2))>>
				\
			Next
		Else
			With oVfp.счетапк.зачислениезарплаты.сотрудник
				\\<<.ЛицевойСчет>>;<<.Фамилия>>;<<.Имя>>;<<.Отчество>>;<<Ltrim(Str(Round(Val(.Сумма),2),15,2))>>
				\
			Endwith
		Endif
		Set Textmerge To
	Next
Endif

