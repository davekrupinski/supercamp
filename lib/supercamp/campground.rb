module Supercamp

  module Campground
    extend self

    def search(&block)
      Criteria::Campground.new &block
    end

    def endpoint
      "campgrounds"
    end

  end

end
