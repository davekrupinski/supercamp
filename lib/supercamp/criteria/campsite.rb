module Supercamp
  module Criteria

    class Campsite < Abstract

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


      # siteType
      # 
      # If unspecified, all site types are returned.
      #
      def site_type(name)
        code = TYPES.fetch(name.to_s)
        merge_option("siteType", code)
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
      # When combined with arvdate, this parameter determines how long 
      # the camper would like to reserve the campground. 
      #
      def nights(amt)
        merge_option("lengthOfStay", amt)
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


    end

  end
end
