0.  I could not start your app.  You hurt me, deeply
  1.  the `bin` directory that was added to your .gitignore (why?) prevented rails from determining that it was a 4.1 versus 3.x version and thus I was unable to start the app.  Do you know why you did that?  Or were you just doing random shit?
  1.  When i try to start the app i get some noise about Internal Server Error
Missing `secret_key_base` for 'development' environment, set this value in
`config/secrets.yml`.  Is this another important thing that was conveniently
gitignored out or something?  Can you explain this to me?
1.  Why is users_controller executable?
2.  084470c9
  1.  This is a good commit in concept, but not in execution.  It DRYed up a
lot of code, but the commit is doing too much.  Why the `#destroy` in this
particular commit.  Why clean up the views in the same commit?  Smaller
commits.
  1.  Also, I don't understand why you put stuff in ApplicationController and
then load up other controllers with exceptions to turn off that global thing.
I'd rather see some less-DRY but more intelligible coding.
3.  `/users` routes.  You have conjoined the concern of 'log in and log out' as
well as 'sign up and sign in' into the `UsersController`.  That's why you have
two sets of routing definitions for `User`, one RESTful and two that are not
RESTful. I might suggest a better name would be `SessionsController` which
manages the `login` and `logout` route.
4. Do not commit half-baked features to master, specifically the Photo noise.
5.  `chmod` do you understand how to use it?  You have executable views and
controllers?  Why did you do this?  This behavior makes me think someone(s) in
the team do not understand Unix.  At. All.  This is bounce-worthy.
6.  What's the difference between a location and a location pin?  A trip has
many locations i get and a trip is owned by a user?  So what is a location Pin
doing?  Huh?  These models are whack-a-doo crazy.  Try to make models model
reailty.
