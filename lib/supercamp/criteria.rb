module Supercamp

  class Criteria

    AMENITIES = {
      "biking"    => 4001,
      "boating"   => 4002,
      "equipment_rentals" => 4003,
      "fishing"   => 4004,
      "golf"      => 4005,
      "hiking"    => 4006,
      "horseback_riding" => 4007,
      "hunting"   => 4008,
      "rec_activities" => 4009,
      "scenic_trails" => 4010,
      "sports"    => 4011,
      "beach_or_water" => 4012,
      "winter_activities" => 4013
    }

    attr_accessor :options

    def initialize
      @options = {}
    end

    # pstate: State or Province
    #
    # The two character abbreviation for US state 
    #
    def state(abbr)
      merge_option(:pstate, abbr)
      self
    end


    # pname: Park Name
    #
    # The name of the park.  When this parameter is specified, 
    # the API performs a string-match query for parks containing 
    # the character string specified. 
    #
    def name(city)
      merge_option(:pname, city)
      self
    end


    # amenity: Campground Feature
    #
    # There are all sorts of things to do at campgrounds.
    # Only one amenity can be specified per query.
    #
    def amenity(key)
      code = AMENITIES.fetch(key.to_s)
      merge_option(:amenity, code)
      self
    end


    # pets: Pets Allowed
    #
    def pets
      merge_option(:pets, 3010)
      self
    end


    # waterfront: Waterfront Sites
    #
    def waterfront
      merge_option(:waterfront, 3011)
      self
    end


  private

    def merge_option(key, value)
      @options[key.to_s] = value
    end

  end

end
