module Supercamp
  module Criteria

    class Detail < Abstract

      # contractCode: STATE, FEDERAL or PRIVATE

      # "contractCode" is a syonym for contractID, which is what is returned by 
      # the Campground Search API.  It specifies the jurisdiction for the campground.  
      # This parameter must be used in conjuction with parkId
      #
      def contract_code(type)
        merge_option("contractCode", type)
        self
      end


      # parkId: Facility ID

      # "parkId" is a synonym for "facilityID", which is returned by the Campground Search API.  
      # It is a unique identifier for the campground.
      #
      def id(val)
        merge_option("parkId", val)
        self
      end

    end

  end
end
