# README For Movie Test

# Setup
```ruby
bundle
rails db:setup
rails s
```

# Run the import
```ruby
copy recent_movies.csv to RAILS_ROOT/tmp
rails import:movies
```

