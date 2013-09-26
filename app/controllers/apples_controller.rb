class ApplesController < ApplicationController
  def index
  	logger.info "======== in index========="
  	if params[:query]
  		Apple.search_query = prepare_search_json_for params[:query]
  		@apples = Apple.elastico_search
  	else
  		@apples = Apple.all
  	end
  end

  private
	  def prepare_search_json_for query
	  	json = { "query" => 
					  		{
					        "term" => { "color" => query.to_s }
					    	}
					  	}.to_json
	  end
end
