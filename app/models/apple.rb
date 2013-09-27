class Apple < ActiveRecord::Base

  attr_accessible :color, :name
	
	def self.prepare_elastico_settings_and_mappings_json
	  json = { "settings" => 
	  					{
	  						"number_of_shards" => 3
	  					},
	  					"mappings" =>
	  					{
	  							"apple" => 
	  							{
	  								"properties" => 
	  								{
											"name" => {"type" => "string"},
									    "color" => {"type" => "string"}
									  }
	  							}
	  					}
						}.to_json
  end

  # include elastico only after you declared your settings and mappings json in the method prepare_elastico_settings_and_mappings_json
  include Elastico
end
