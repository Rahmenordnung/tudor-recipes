class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:show, :index]

  # GET /categories
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end
  
  # GET /categories/1
  
  def show
      @category_recipes = @category.recipes.paginate(page: params[:page], per_page: 5)

  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  
  def create
    @category = Category.new(category_params)
      if @category.save
        flash[:success] = "Category was created successfully!"
        redirect_to category_path(@category)
      else
        render 'new'
      end
  end


  # PATCH/PUT /categories/1

  def update
    if @category.update(category_params)
      flash[:success] = "Category was updated successfully!"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end
  
    # DELETE /categories/1

  def destroy
    @category.destroy
      flash[:success] = "Category deleted successfully"
    redirect_to categories_path
  end
  
  def initial
      self[0,1]
    end

  private
  
  # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title, :description)
    end
    
  def require_admin
    if !logged_in? || (logged_in? and !current_chef.admin?)
      flash[:danger] = "Only admin users can perform that action"
      redirect_to categories_path
    end
  end
end
