

**for punc asset precompilation errors**
-------------------------------------------------------------

[StackOverflow](http://stackoverflow.com/questions/12574977/rake-assetsprecompile-gives-punc-error)

```
    JS_PATH = "app/assets/javascripts/**/*.js"; 
    Dir[JS_PATH].each do |file_name|
      puts "\n#{file_name}"
      puts Uglifier.compile(File.read(file_name))
    end
```


**reseting the indexs**
-------------------------------------------------------------

[StackOverflow](http://stackoverflow.com/questions/11068800/rails-auto-assigning-id-that-already-exists)

```
    ActiveRecord::Base.connection.tables.each do |t|
      ActiveRecord::Base.connection.reset_pk_sequence!(t)
    end
```


**launch delayed job workers on local dev machine** 
-------------------------------------------------------------

[StackOverflow](http://stackoverflow.com/questions/6946041/how-do-you-tell-a-specific-delayedjob-to-run-in-console)

use `rails c` to run rails console

```
    Delayed::Worker.new.run(Delayed::Job.last) 
```


**asset migration, renaming files**
-------------------------------------------------------------

[StackOverflow](http://stackoverflow.com/questions/2708115/paperclip-renaming-files-after-theyre-saved)



**figure out what version of browsers is installed on phone**
-------------------------------------------------------------

[StackOverflow](http://apple.stackexchange.com/questions/30721/on-the-ipad-how-do-i-tell-what-version-of-mobile-safari-i-have)

```
    javascript:alert(navigator.userAgent)
```


**disable hover effect on mobile browser**
-------------------------------------------------------------

[StackOverflow](http://stackoverflow.com/questions/8291517/disable-hover-effects-on-mobile-browsers)


**finding all crontabs on server**
-------------------------------------------------------------
[StackOverflow](http://unix.stackexchange.com/questions/7053/how-can-get-a-list-of-all-scheduled-cron-jobs-on-my-machine)

```
    vim /etc/crontab
```


**unitialized constant in rake task**
-------------------------------------------------------------
[StackOverflow](http://stackoverflow.com/questions/27431532/why-am-i-getting-uninitialized-constant-for-a-rake-task-rails-4-1-8)

```
    task :get_roles => [ :environment ] do
```

**setting up rails with postgres**
-------------------------------------------------------------
[digital ocean](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres)


**rails-composer, like rails new on steriods**
-------------------------------------------------------------
[rails-composer](https://github.com/RailsApps/rails-composer)




