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
  Apple.elastico_url = "http://vokdxbxi:dhkxpsqfg8fy2bnr@banyan-6062486.us-east-1.bonsai.io:9200" if Rails.env == "production"
  send_settings_mappings_to_elasticsearch_server

end
