class Apple < ActiveRecord::Base
  attr_accessible :color, :name

	def self.prepare_elastico_settings_and_mappings_json
	  json = { "apple" => {
	        "properties" => {
	            "name" => {"type" => "string"},
	            "color" => {"type" => "string"}
	        }
	    }}.to_json
  end
 	# prepare_elastico_settings_and_mappings_json must be defined before you include Elastico
 	include Elastico
end
