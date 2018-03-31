# Rainbow

A library management system (LMS) / integrated library system (ILS)

## Setup


```
bundle install

# Install Postgres if not present
brew cask install postgres

# Set up .env file
# Create a free account on filestack and set FILEPICKER_API_KEY
cp .env.sample .env

# set up DB
bin/rails db:create db:migrate
```

### Solr


