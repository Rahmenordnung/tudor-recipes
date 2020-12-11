class RecipePdf < Prawn::Document
    def initialize(recipe)
        super(top_margin: 70)
        @recipe = recipe
        recipe_name
        recipe_description
        recipe_cooking_time
    end
    
    def recipe_name
        text "Recipe #{@recipe.name}", size: 30, style: :bold
    end
    
    def recipe_description
        move_down 20
        text "Description #{@recipe.description}", size: 20
    end
    
    def recipe_cooking_time
        move_down 20
        text "Cooking Time #{@recipe.cooking_time} minutes", size: 20
    end
    
    

end