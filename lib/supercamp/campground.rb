module Supercamp

  module Campground
    extend self

    def search(&block)
      Criteria::Campground.new &block
    end

  end

end
