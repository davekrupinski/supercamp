Supercamp [![Build Status](https://travis-ci.org/davekrupinski/supercamp.svg?branch=master)](https://travis-ci.org/davekrupinski/supercamp.svg?branch=master) [![Coverage Status](https://img.shields.io/coveralls/davekrupinski/supercamp.svg)](https://coveralls.io/r/davekrupinski/supercamp?branch=master)
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
    has     "water", :pets, "sewer"
end
```

Requests to the API are executed lazily when first accessed by either **count** or **results**.

```ruby
	@search.count 
    @search.results
```

## Campsite API

The campgrounds interface supports:
* **site_type** (rv, cabin, lodging, tent, trailer, group_site, day_use, horse_site, or boat_site)
* **arrival** (mm/dd/yyyy)
* **nights** (integer) *used with *arrival* to specify duration of stay*
* **min_equip_length** (feet)
* **people** (integer)
* **min_elec_amps** (15, 20, 30, or 50)

## Camground API
Supports all options from **Campsite API** with additional support for:
* **geo** (lat, long)
* **state** (string) *2 character abbreviation*
* **name** (string) *Name of Park*
* **amenity** (biking, boating, equipment_rentals, fishing, golf, hiking, horseback_riding, hunting, rec_activities, scenic_trails, sports, beach_or_water, or winter_activities)
* **has** (Multiple: water, sewer, pull, pets, waterfront)

## Details API
##### Note: Both Parameters are Required
* **contract_code** (string) *contract_id returned from Campground API Search*
* **id** (string) *facility_id returned from Campground API Search*

## TODO
* Configuration Validation
* Search Parameter Validation
* Search Lookup Caching
