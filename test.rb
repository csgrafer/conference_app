require 'http'

p response = HTTP.get("http://example.com/resource", :params => {:foo => "bar"})

