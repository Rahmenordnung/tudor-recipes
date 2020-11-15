class SearchController < ApplicationController

  def search
    @recipes = Recipe.where("name LIKE ?", "%"+ params[:q] + "%")
    @recipes = Recipe.where("cooking_time LIKE ?", "%"+ params[:q] + "%")
  end  
end