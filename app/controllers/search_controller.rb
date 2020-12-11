class SearchController < ApplicationController
  def search
    @recipes = Recipe.where("name LIKE ?", "%"+ params[:q] + "%")
    
  end  
end