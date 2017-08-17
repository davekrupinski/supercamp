require 'oga'
require 'hashr'

module Supercamp

  class Response

    attr_reader :count
    attr_reader :entries

    alias_method :results, :entries

    def initialize(response)
      p = parse_response(response.body)

      set_results_count(p)
      set_entries(p)
    end


    private

    def parse_response(xml)
      xml.gsub!("\n", "")
      parsed = Oga.parse_xml(xml)
      toplevel = parsed.children.first.name
      parsed.xpath(toplevel).first
    end

    def set_results_count(parsed)
      if parsed.attribute("count")
        @count = parsed.attribute("count").value.to_i
      else
        @count = 0
      end
    end

    def set_entries(parsed)
      @entries = parsed.children.map do |child|
        child.attributes.inject(Hashr.new) do |h, attr|
          key = attr.name.gsub(/(.)([A-Z])/,'\1_\2').downcase
          h[key] = attr.value; h
        end
      end
    end

  end

end
