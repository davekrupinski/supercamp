Supercamp
============

Wrapper for the Active Network Campground API, and probably a bad Supertramp joke at the same time.

Installation
------------

Add to your Gemfile:

```ruby
gem 'supercamp'
```

Configuration
------------
The only required configuration setting is a valid API KEY for Active Network's Campground API.  These can be obtained by registering at http://developer.active.com/docs/read/Campground_APIs

```ruby
Supercamp.configure do |config|
    config.api_key = "YOUR-API-KEY"
end
```
Additionally, a custom timeout span can be given.  The default is 5 seconds.
```ruby
Supercamp.configure do |config|
    config.api_key = "YOUR-API-KEY"
    config.timeout = 10
end
```

General Usage
------------

The wrapper supports all 3 of the API endpoints:
* Campgrounds
* Campsites
* Details

Each service implements a search interface that can be used as chainable methods or a block search.
```ruby
Supercamp.campgrounds.state("CA").amenity(:biking)
```
-- or --
```ruby
Supercamp.campgrounds.search do
    state   "CA"
    amenity "biking"
end
```
