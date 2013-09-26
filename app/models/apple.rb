class Apple < ActiveRecord::Base
	def self.elastico_settings_and_mappings_json
	  json = { "apple" => {
	        "properties" => {
	            "name" => {"type" => "string"},
	            "color" => {"type" => "string"}
	        }
	    }}.to_json
  end
  
	include Elastico

  settings_and_mappings_json = elastico_settings_and_mappings_json
  send_settings_mappings_to_elasticsearch_server
  
  attr_accessible :color, :name

  
end
