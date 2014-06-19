# TRAVEL BLOG
An app for travelers to document and relive their trips by pinning blog posts to a map.

## QUICK START
Run `$ bundle install`

Run `$ rake db:setup` or `$ rake db:create:all`

## MVP

A user can create trips

For each trip, a user can
- add location markers to the map
- create blog posts
- pin blog posts to a location marker
- view a map with all location markers
- click a location marker to see all blog posts pinned to that location


## HOW TO CONTRIBUTE

- Fork the repo ( https://github.com/spring-peepers-2014/TravelBlog.git ) to your repo

- Clone your fork to your local repo

- Create new branch for each feature or bug fix on your fork

`$ git checkout -b feature_branch_name` (prepended by `chore/`, `feature/`, `bug/`)

- Add and commit changes to the feature branch on your local repo

```bash
$ git commit -m "Add user authentication (50 char)...
>
> - Implement Devise authentication gem
> - Create user login page
> - Create user session
> "
```

- Rebase from upstream TravelBlog master

`$git pull --rebase upstream master`

- Push your feature branch to your fork

`$git push origin feature_branch_name`

- Go to Github and submit a pull request from your forked repo (contributor/TravelBlog) to master build repo (SpringPeepers2014/TravelBlog)

Someone who did not write your code should review your code and approve or reject your pull request.

## TESTING

- Run `$ bundle exec rake db:test:prepare` to create Postgres test database

To use Chrome browser for testing with Capybara (default: Firefox):

- Download Chromedriver `http://chromedriver.storage.googleapis.com/index.html`

- Extract zip file and move extracted `chromedriver` to `/usr/bin/`

- Make chromedriver executable by running: `$ sudo chmod +x /usr/bin/chromedriver`

## DEVELOPERS

Please thank our well-respected developers:
- Christine Feaster
- Neal Fennimore
- Lawrence Manfredi
- Kenneth Uy
