# devlog for fillet 

## october 25

Building a makefile from scratch is a pain in the ass, but i should really do it everytime until it's ingrained.
3 parts to this project basically theres input, processing and output. Pretty much the three parts of every project.

* things to fix with current code base
	* should display usage if parametter is not equal to one
		* example usage: 
			```
				usage: 	cp [-R [-H | -L | -P]] [-fi | -n] [-apvX] source_file target_file
       					cp [-R [-H | -L | -P]] [-fi | -n] [-apvX] source_file ... target_directory
       		```


#### questions 

* what does the [@ sign in a makefile mean}(http://stackoverflow.com/questions/8610799/what-does-at-symbol-colon-mean-in-a-makefile)?
	* means stay silent

* why does the makefile create a header with a .gch appended to it?
	* called a [precompiled header](https://en.wikipedia.org/wiki/Precompiled_header)

* fillit results
	* neutral_7
		```
			ss			matt 		us
			AAABB. -->	AAABB. --->	AAABB.
			..ABB. -->	..ABB. ---> ..ABB.
			CCCCEE -->	CCCCEE ---> CCCCEE
			DDFFFE -->	DDFFFE ---> DDFFFE
			DDFGGE -->	DDFGGE ---> DDFGGE
			....GG -->	....GG ---> ....GG
		```
	* neutral_8
		```
			ss			matt 		us
			AAABCF --> AAABCF ---> AAABCF
			.HABCF --> .HABCF ---> .HABCF
			HH.BCF --> HH.BCF ---> HH.BCF
			H..BCF --> H..BCF ---> H..BCF
			DDDDGG --> DDDDGG ---> DDDDGG
			EEEEGG --> EEEEGG ---> EEEEGG
		```
	* neutral_9
		```
			ss			matt 		us
			.ABBBB. --> .ABBBB. --> .ABBBB.
			.AC.DD. --> .AC.DD. --> .AC.DD.
			AACCDD. --> AACCDD. --> AACCDD.
			.EECFFF --> .EECFFF --> .EECFFF
			EE.HFI. --> EE.HFI. --> EE.HFI.
			GGGHHII --> GGGHHII --> GGGHHII
			G...H.I --> G...H.I --> G...H.I
		```
	* neutral_10
		```
			ss			matt 		us
			AAABCC. --> AAABCC. --> AAABCC.
			IDAB.CC --> D.AB.CC --> D.AB.CC
			IDDBBEE --> DD.BBEE --> DD.BBEE
			IIDFFEE --> GDFF.EE --> GDFF.EE
			G..FFHH --> GGFFIHH --> GGFFIHH
			GG...HH --> .G..IHH --> .G..IHH
			.GJJJJ. --> JJJJII. --> JJJJII.
		```
	* neutral_11
		```
			ss			matt 		us
			A..BBEE --> A..BB.C --> A..BB.C
			AAABBEE --> AAABBCC --> AAABBCC
			JJDDD.C --> EEDDDC. --> EEDDDC.
			JJI.DCC --> EEI.DJJ --> EEI.DJJ
			HIIFFC. --> HIIFFJJ --> HIIFFJJ
			HIFFGGG --> HIFFGGG --> HIFFGGG
			HHKKKKG --> HHKKKKG --> HHKKKKG
		```
	* neutral_12
		```
			ss			matt 		us
			AAA.B..C --> AAA.B..C --> AAA.B..C
			..ABBCCC --> ..ABBCCC --> ..ABBCCC
			.DD.BEE. --> .DD.BEE. --> .DD.BEE.
			DDFF.EE. --> DDFF.EE. --> DDFF.EE.
			.FFGGHHH --> .FFGGHHH --> .FFGGHHH
			IIIIGGKH --> IIIIGGKH --> IIIIGGKH
			.JJLL.KK --> .JJLL.KK --> .JJLL.KK
			JJ.LL..K --> JJ.LL..K --> JJ.LL..K
		```
