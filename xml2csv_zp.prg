If Adir(aFiles, '???????z.xml') > 0
	For i = 1 To Alen(aFiles, 1)
		Set Textmerge To
		oVfp = nfXMLRead(aFiles[i,1])
		Set Textmerge To (Juststem(aFiles[i,1])+'.csv')
		Set Textmerge On
*For Each сотр In oVfp.счетапк.зачислениезарплаты.сотрудник FoxObject
		If Val(oVfp.счетапк.контрольныесуммы.количествозаписей) > 1
			For Each сотр In oVfp.счетапк.зачислениезарплаты.сотрудник &&FoxObject
				\\<<сотр.Ћицевой—чет>>;<<сотр.‘амили€>>;<<сотр.»м€>>;<<сотр.ќтчество>>;<<Ltrim(Str(Round(Val(сотр.—умма),2),15,2))>>
				\
			Next
		Else
			With oVfp.счетапк.зачислениезарплаты.сотрудник
				\\<<.Ћицевой—чет>>;<<.‘амили€>>;<<.»м€>>;<<.ќтчество>>;<<Ltrim(Str(Round(Val(.—умма),2),15,2))>>
				\
			Endwith
		Endif
		Set Textmerge To
	Next
Endif
