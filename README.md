
### Ruby version
Install `rbenv` and `ruby-build` to manage your ruby version. You should use ruby `2.3.1` when doing development on selfiequeen

```
rbenv install 2.3.1
rbenv global 2.3.1
```
Do not use system installed ruby!

### Database creation
You will need to use `postgersql` as your primary database. Neither sqlite or mysql are recommended due to bad locks. Edit the database.yml file with your `username` & `password` and run 
```
rails db:create db:migrate
```
### Server
To start the server, use: `rails s`

### Deployment instructions
To deploy the application on heroku you will need to: 
- Get access key and secret key from aws for the use of S3 buckets and put them in the config vars: S3_KEY & S3_SECRET
- Add git remote for heroku `heroku git:remote -a selfiequeen-next`
- Add postgres as database on heroku `heroku addons:create heroku-postgresql`
- Push the repo to heroku `git push heroku master`
- Scale workers optionally: heroku ps:scale worker=1 (recommended)
- Tada!