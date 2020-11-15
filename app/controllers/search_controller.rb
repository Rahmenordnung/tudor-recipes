class SearchController < ApplicationController
  # def search
  #   st = "%#{params[:q]}%"

  #   @recipes = Recipe.where("name like ? or description like ? or cooking_time like ? " , st, st, st ).paginate(page: params[:page], per_page: 10) 
  # end
  
  def search
    @recipes = Recipe.where("name LIKE ?", "%"+ params[:q] + "%")
  end  
end