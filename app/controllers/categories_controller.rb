class CategoriesController < ApplicationController
  before_action :require_admin, except:[:index, :show]
	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
	end
	
	def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Categoria criada com sucesso"
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Nome de categoria atualizado com sucesso"
      redirect_to category_path(@category)
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:success] = "Categoria apagada com sucesso."
      redirect_to categories_path
    else
      flash[:danger] = "Impossível, pois existem artigos vinculados."
      redirect_to category_path(@category)
    end
  end

  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.paginate(page: params[:page], per_page: 5)
  end

  private 
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "Apenas admins podem executar essa ação"
      redirect_to categories_path
    end
  end
end