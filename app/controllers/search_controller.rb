class SearchController < ApplicationController
  def search
     st = "%#{params[:q]}%"
     @recipes = Recipe.where("name like ?", st)
  end
  
#   def search
    # st = "%#{params[:q]}%"
    # @items = Item.where("title like ? or description like ? or category like ? or provenience like ? or price like ? " , st, st, st, st, st).paginate(page: params[:page], per_page: 10)
# end

end