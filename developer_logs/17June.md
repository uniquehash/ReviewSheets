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

### June, 9th, 2017

* things on radar
	* tech doc
	* joint calendar
	* contact email optimization
	* mail app
	* retreat planning
	* ~build initial cv~
		* ~42 -> getting there~
		* ~regional -> 42~
		* ~8 years old, to regional~
	* make slideshow for wednesday townhall
	* ~send the email to yolande friday 3pm~

* events on the horizon
	* june, 20th, speak and sell

okay my first step is to look into imap. straight from the docs. no tutorials. straight docs yo.

cool i found an [imap python client](https://github.com/mjs/imapclient) that should work. looks pretty complete, hopefully it's not a piece of shit.

### June, 10th, 2017

* things on radar
	* tech doc
	* joint calendar
	* contact email optimization
	* mail app
	* retreat planning
	* make slideshow for wednesday townhall
	* send email to sebastion on Monday

* events on the horizon
	* june, 20th, speak and sell



okay successfully connected to imap server for 42.


### June, 12th, 2017

* things on radar
	* make slideshow for wednesday townhall
		* need more data
	* make cv better
	* ~send email to sebastion on Monday~
	* tech doc
	* joint calendar
	* contact email optimization
	* mail app
	* retreat planning

* events on the horizon
	* june, 20th, speak and sell

  
i need to focus on the non-technical stuff until it's finished. i only have a few days. this is going to really, really blow. fuck marketing.

### June, 13th, 2017

* things on radar
	* ~make slideshow for wednesday townhall~
		* ~need more data~
	* make cv better
	* tech doc
	* joint calendar
	* contact email optimization
	* mail app
	* retreat planning

* events on the horizon
	* june, 20th, speak and sell


fuck resumes. fuck cvs.

### June, 14th, 2017

* things on radar
	* make cv better
	* tech doc
	* joint calendar
	* contact email optimization
	* mail app
	* retreat planning

* events on the horizon
	* june, 20th, speak and sell

fuck resumes. fuck cvs. <-- this is still true.

### June, 15th, 2017

* things on radar
	* ~~make cv better~~
	* tech doc
	* joint calendar
	* contact email optimization
	* mail app
	* retreat planning

* events on the horizon
	* june, 20th, speak and sell

finished the resume shit!!! woo.

### June, 24th, 2017

* things on radar
	* tech doc
	* joint calendar
	* contact email optimization
	* mail app

it's been a while since i written in this log. kinda silly it's a useful thing that enjoy. since the last time i've written here i've pretty much completed the mvp of the mail notification app. it is pretty simple. for the initial version i used rails. it contains two models, two controllers, two views, and one mailer. i forgot how much fun it was to build something in a short amount of time and see results.

i have 2 models, cadets and lists. the lists only exist to organize the cadets. though this could have been done simply with a boolean in the cadets model called is_selected or something. but oh well.

i have 2 views, the selection page and the add page. selection is to find and select cadets whom have received mail, and the add page is to add new cadets to the database.

i have 2 controllers, the snail_controller and the cadets controller. the cadet controller deals with everything related to cadets, creating destroying ect..., the snail_mail controller handles everything else.

there is currently one mailer used to alert people that they have mail. 

right now what i'm working on is adding a ajax search to the selection page, allowing people to quick search people. i'm trying to use 2 gems filterific and pg_search. still trying to understand how they work together. props to Matias for being the hacker that he is and hacking together a possible version and finding these gems.

wow pg_search is super easy. i love that postgres has a functional text_search built into it. pretty amazing. the pg_search gem just makes doing the actual postgres search on the models extremely easy and painless. this means that filterific probably is going to handle the js and ajax aspect, transporting the information between the client and backend.

























