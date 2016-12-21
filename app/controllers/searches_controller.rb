class SearchesController < ApplicationController
  def create
  	params.permit!
  	@search = Search.create(user_id: current_user.id)
  	@search.update(query: params[:query])
  	redirect_to search_path(@search, query: params[:query])
  end

  def show
    @cookbooks = []
    @recipes = []
  	@searches = PgSearch.multisearch(params[:query])
    @searches.each do |x|
      case x.searchable_type
        when "Cookbook"
          if Cookbook.find(x.searchable_id).public == true
            @cookbooks << Cookbook.public_entry.find(x.searchable_id)
          end
        when "Recipe"
          if Recipe.find(x.searchable_id).cookbook.public == true
            @recipes << Recipe.public_entry.find(x.searchable_id)
          end
      end
    end
  end
end