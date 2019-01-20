---haal de csv op, de delimiter moet een puntkomma zijn
set uitputregels to {}
set alleregels to paragraphs of (read POSIX file "/Users/tonzijlstra/Downloads/inkooptest.csv")
set uit_file to (POSIX file "/Users/tonzijlstra/Downloads/inkooptestuit.csv")
set lossregeluit to ""
---lees elke regel in en stop velden in lijstje
---datum, periode, omschrijving, D, C, Aan, btw
set {tids, AppleScript's text item delimiters} to {AppleScript's text item delimiters, ";"}
repeat with i from 2 to count of alleregels
	set dezeregel to item i of alleregels
	set veldenlijst to text items of dezeregel
	set kwartaal to "1"
	if word 1 of (item 2 of veldenlijst) is "4" then set kwartaal to "2"
	if word 1 of (item 2 of veldenlijst) is "5" then set kwartaal to "2"
	if word 1 of (item 2 of veldenlijst) is "6" then set kwartaal to "2"
	if word 1 of (item 2 of veldenlijst) is "7" then set kwartaal to "3"
	if word 1 of (item 2 of veldenlijst) is "8" then set kwartaal to "3"
	if word 1 of (item 2 of veldenlijst) is "9" then set kwartaal to "3"
	if word 1 of (item 2 of veldenlijst) is "10" then set kwartaal to "4"
	if word 1 of (item 2 of veldenlijst) is "11" then set kwartaal to "4"
	if word 1 of (item 2 of veldenlijst) is "12" then set kwartaal to "4"
	set lijn to item 1 of veldenlijst & ";" & item 2 of veldenlijst & ";" & kwartaal & ";" & item 3 of veldenlijst & ";"
	
	---voor elke regel waar 141
	if word 1 of (item 6 of veldenlijst) is "141" then
		if word 1 of (item 7 of veldenlijst) is "1" then
			---output btw hoog
			---lijn1 is lijn en D, 1, 100/121 van bedrag, 21/121 van bedrag, '141, C
			---lijn2 is lijn en 100/121 van bedrag, , , , ,D
			---lijn3 is lijn en 21/121 van bedrag, , , ,'181, C
			---output is lijn1 \n lijn2 \n lijn3 \n
			set bedrag to item 4 of veldenlijst as number
			set btwbedrag to (bedrag * 21) / 121
			set btwbedrag to round (btwbedrag * 100)
			set btwbedrag to btwbedrag / 100
			set nettobedrag to (bedrag * 100) / 121
			set nettobedrag to round (nettobedrag * 100)
			set nettobedrag to nettobedrag / 100
			set lijn1 to lijn & bedrag & ";1;" & nettobedrag & ";" & btwbedrag & ";141;C"
			set lijn2 to lijn & nettobedrag & "; ; ; ; ;D"
			set lijn3 to lijn & btwbedrag & "; ; ; ;181;C"
			copy lijn1 to the end of uitputregels
			copy lijn2 to the end of uitputregels
			copy lijn3 to the end of uitputregels
		end if
		if word 1 of (item 7 of veldenlijst) is "2" then
			---output btw laag
			---lijn1 is lijn en D, 1, 6/106 van bedrag, 100/106 van bedrag, 141, C
			---per 2019 9/109
			---lijn2 is lijn en 100/106 van bedrag, , , , ,D
			---lijn3 is lijn en 6/106 van bedrag, , , ,'182, C
			---output is lijn1 \n lijn2 \n lijn3 \n
			set bedrag to item 4 of veldenlijst as number
			set btwbedrag to (bedrag * 6) / 106
			set btwbedrag to round (btwbedrag * 100)
			set btwbedrag to btwbedrag / 100
			set nettobedrag to (bedrag * 100) / 106
			set nettobedrag to round (nettobedrag * 100)
			set nettobedrag to nettobedrag / 100
			set lijn1 to lijn & bedrag & ";1;" & nettobedrag & ";" & btwbedrag & ";141;C"
			set lijn2 to lijn & nettobedrag & "; ; ; ; ;D"
			set lijn3 to lijn & btwbedrag & "; ; ; ;181;C"
			copy lijn1 to the end of uitputregels
			copy lijn2 to the end of uitputregels
			copy lijn3 to the end of uitputregels
			
		end if
		if word 1 of (item 7 of veldenlijst) is "0" then
			---output btw nul
			---lijn1 is lijn en D, 0, , ,'141,C
			---lijn2 is lijn en D, , , , ,D
			---output is lijn1 \n lijn2 \n
			set lijn1 to lijn & item 4 of veldenlijst & ";0; ; ;141;C"
			set lijn2 to lijn & item 4 of veldenlijst & ";; ; ; ;D"
			copy lijn1 to the end of uitputregels
			copy lijn2 to the end of uitputregels
			
		end if
	end if
	
	--voor elke regel waar 142
	if word 1 of (item 6 of veldenlijst) is "142" then
		if word 1 of (item 7 of veldenlijst) is "4" then
			---output btw hoog
			---lijn1 is lijn en D, 4, D, ,'142,C
			---lijn2 is lijn en D, , , , ,D
			---lijn3 is lijn en 21/100 van D, , , ,'184, C
			---lijn4 is lijn en 21/100 van D, , , ,'185, D 
			---output is lijn1 \n lijn2 \n lijn3 \n lijn4 \n
			set bedrag to item 4 of veldenlijst as number
			set btwbedrag to (bedrag * 21) / 100
			set btwbedrag to round (btwbedrag * 100)
			set btwbedrag to btwbedrag / 100
			set lijn1 to lijn & bedrag & ";4;" & bedrag & ";;141;C"
			set lijn2 to lijn & bedrag & "; ; ; ; ;D"
			set lijn3 to lijn & btwbedrag & "; ; ; ;184 ;C"
			set lijn4 to lijn & btwbedrag & "; ; ; ;185 ;D"
			copy lijn1 to the end of uitputregels
			copy lijn2 to the end of uitputregels
			copy lijn3 to the end of uitputregels
			copy lijn4 to the end of uitputregels
			
		end if
		if word 1 of (item 7 of veldenlijst) is "0" then
			---output btw nul
			---lijn1 is lijn en D, 0, , ,'142,C
			---lijn2 is lijn en D, , , , ,D
			---output is lijn1 \n lijn2 \n
			set lijn1 to lijn & item 4 of veldenlijst & ";0; ; ;'142;C"
			set lijn2 to lijn & item 4 of veldenlijst & ";; ; ; ;D"
			copy lijn1 to the end of uitputregels
			copy lijn2 to the end of uitputregels
		end if
	end if
	
	--als niet 141 of 142 regel negeren voor inkoopdagboek
	
end repeat
set AppleScript's text item delimiters to tids

---alle output weer als csv wegschrijven
set the target_file to the uit_file as text
set the open_target_file to ¬
	open for access file target_file with write permission
repeat with regel in uitputregels
	set regel to regel & "
"
	write regel to the open_target_file starting at eof
end repeat
close access the open_target_file
