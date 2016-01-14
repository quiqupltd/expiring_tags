# ExpiringTags

A simple tagging extension for ActiveRecord that allows tags to expire.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'expiring_tags'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install expiring_tags

## Post installation

Run migrations:

    rake db:migrate

## Usage

Setup

```ruby
class Venue < ActiveRecord::Base
  has_many_tags
end

@venue = Venue.new
```

Add and remove a single tag

```ruby
no_takeaway = ExpiringTags::Tag.new(tag: 'no_takeaway')

@venue.tags << no_takeaway # Add a tag
@venue.tags.delete no_takeaway # Remove a tag
@venue.tags.map(&:tag) # []
```

Managing tags via their names

```ruby
@venue.tag_names = ['no_takeaway']
@venue.tags.map(&:tag) # ['no_takeaway']
```

Add and remove multiple tags in an array

```ruby
no_takeaway = ExpiringTags::Tag.new(tag: 'no_takeaway')
infected_with_ebola = ExpiringTags::Tag.new(tag: 'infected_with_ebola')

@venue.tags << [no_takeaway, infected_with_ebola]
@venue.tags.map(&:tag) # ['no_takeaway', 'infected_with_ebola']
```

Managing expired tags

```ruby
not_serving = ExpiringTags::Tag.new(tag: 'not_serving', expires_in: 1) # 1 hour

@venue.tags << not_serving
@venue.tags.count # 1

# 1 hour and 1 second later

@venue.tags.count # 0
```

## Testing

Setup the database using:

    $ bundle rake db:setup

And then run RSpec:

    $ bundle exec rspec


## Contributing

1. Fork it ( https://github.com/[my-github-username]/expiring_tags/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
