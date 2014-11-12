module Supercamp

  class Criteria

    TYPES = {
      "rv"          => 2001,
      "cabin"       => 10001,
      "lodging"     => 10001,
      "tent"        => 2003,
      "trailer"     => 2002,
      "group_site"  => 9002,
      "day_use"     => 9001,
      "horse_site"  => 3001,
      "boat_site"   => 2004
    }

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

    PERKS = {
      "water"       => 3007,
      "sewer"       => 3007, 
      "pull"        => 3008,
      "pets"        => 3010,
      "waterfront"  => 3011
    }

    ELECTRIC_HOOKUPS = {
      "15" => 3002,
      "20" => 3003,
      "30" => 3004,
      "50" => 3005
    }

    attr_accessor :options

    def initialize
      @options = {}
    end


    # landmarkLat, landmarkLong (latitude/longitude)
    # 
    # These two parameters allow for campground searches around a fixed geo-point.
    #
    def geo(lat, lng)
      merge_option("landmarkLat", lat)
      merge_option("landmarkLong", lng)
      self
    end


    # siteType
    # 
    # If unspecified, all site types are returned.
    #
    def site_type(name)
      code = TYPES.fetch(name.to_s)
      merge_option("siteType", code)
      self
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


    # arvdate: Arrival Date
    #
    # The date in which the camper wants to start camping in mm/dd/yyyy format.
    #
    def arrival(date)
      merge_option(:arvdate, date)
      self
    end


    # lengthOfStay: Length of Stay
    #
    # When combined with arvdate, this parameter determines how long the camper would like to reserve the campground. 
    #
    def nights(amt)
      merge_option("lengthOfStay", amt)
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


    # eqplen: Equipment Length
    #
    # If the camper wants to find campgrounds where his 50 foot RV will fit, 
    # issue a query where eqplen=50
    #
    def min_equip_length(val)
      merge_option("eqplen", val)
      self
    end
    

    
    # Maxpeople: Number of campers
    #
    #
    def people(amt)
      merge_option("Maxpeople", amt)
      self
    end


    # hookup: Electric Hookup
    #
    #
    def min_elec_amps(val)
      code = ELECTRIC_HOOKUPS.fetch(val.to_s)
      merge_option(:hookup, code)
      self
    end


    # has: Campture Features
    #
    # Specify 1 or more optional perks:
    # # water     
    # # sewer     
    # # pull      
    # # pets      
    # # waterfront
    #
    def has(*perks)
      perks.each do |perk|
        next unless PERKS.has_key?(perk.to_s)
        merge_option(perk, PERKS[perk.to_s])
      end
      self
    end


  private

    def merge_option(key, value)
      @options[key.to_s] = value
    end

  end

end
