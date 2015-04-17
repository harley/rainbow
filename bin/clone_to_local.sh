heroku pg:backups capture
filename=db_dump_$RANDOM
curl `heroku pg:backups public-url` > ./tmp/$filename
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U $USER -d rainbow_development ./tmp/$filename
rake db:migrate
