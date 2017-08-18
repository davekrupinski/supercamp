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
        @count = 1
      end
    end

    def get_attributes(xml_array)
      xml_array.map do |xml_item|
        xml_item.attributes.inject(Hashr.new) do |h, attr|
          key = attr.name.gsub(/(.)([A-Z])/,'\1_\2').downcase
          h[key] = attr.value; h
        end
      end
    end

    def set_entries(parsed)
      entry_parent = get_attributes(parsed.root_node.children)
      @entries = get_attributes(parsed.children)
      make_family(entry_parent)
    end

    def make_family(entry_parent)
      @entries.push({ parent: entry_parent.first })
    end

  end

end
