# June, 2017

### June, 1st, 2017

today was the cut off for staying in the dorms. i made it. woooo. okay now were working on a naive-bayes classifier for spam filtering.

one common rule of thumb for avoiding overfitting is to split labeled data 70/30 for training/testing. ensures that you test on different data than you trained on.

great spam filter corpus: http://spamassassin.apache.org/old/publiccorpus/
readme: http://spamassassin.apache.org/old/publiccorpus/readme.html

okay so i have a trainer and a classifier. i need to build a loading system and build a tagging system for all the data. except you know what i bet you that these other libraries and tutorials have things that do this already. i understand the flow and how it works even though i haven't run it. i can just probably move on to a different tutorial.

the python for engineers thing is sick. i think it's too much for this stage though. that should be the last one i do. 

these sorts of applications have 4 steps. preparing the text data, creating a word dictionary, feature extraction process, training the classifier.

* preparing the text data
	* removal of stop words
		* and, of, the ect are not useful in figuring out if something is spam or ham
	* lemmatization
		* taking all forms of a word and making them uniform
	* remove non-words
		* punctuation marks, ect...

that was really cool. and it fucking works. implemented a spam filter using both naive-bayes and SVM classifiers.

### June, 2nd, 2017

* things on radar
	* tech doc
	* joint calendar
	* contact email optimization
	* mail app

* events on the horizon
	* june, 7th SE bbq
	* june, 20th, speak and sell

### June, 5th, 2017

* things on radar
	* tech doc
	* joint calendar
	* contact email optimization
	* mail app
	* retreat planning
	* build initial cv
		* 42 -> getting there
		* regional -> 42
		* 8 years old, to regional

* events on the horizon
	* june, 7th SE bbq
	* june, 20th, speak and sell

okay before i start playing with the zimbra stuff i need to do the cv stuff since i've been to 42. then i can start pulling all the data from zimbra and see what's up.

so the first thing to do for the contact email is to start pulling emails and organizing them.

welp couldn't get access. So i guess i'll just write the email to file downloader tonight.

* how am i gonna build this downloader?
	* what does the get folder responce look like?		
	* what does the get mail responce look like?

holy shit this thing is a cluster fuck. i can't even. the zimbra soap api is actually the worse thing ever. 

* useful links on zimbra so far
	* https://stackoverflow.com/questions/24606871/how-to-accept-decline-appointments-by-using-zimbra-soap-api

fuck i'm pretty sure i'm going to need to just read stack overflow like a book....

### June, 8th, 2017

* things on radar
	* tech doc
	* joint calendar
	* contact email optimization
	* mail app
	* retreat planning
	* build initial cv
		* 42 -> getting there
		* regional -> 42
		* 8 years old, to regional
	* make slideshow for wednesday townhall
	* send the email to yolande friday 3pm

* events on the horizon
	* june, 20th, speak and sell

okay so gaetan recommended going straight ipop/whatever for the thing. the whatever thing is called imap. lol. okay. so first thing is to learn how pop3 and imap work and what they are.

wow imap is super cool.























