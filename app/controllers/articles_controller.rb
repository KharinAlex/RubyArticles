class ArticlesController < ApplicationController

  before_action :require_login, except: [:index, :show]
  before_action :get_instance, except: [:index, :new, :create]
  before_action :check_rights, only: [:edit, :destroy, :update]

  def index
  	@articles = Article.all
  end

  def show
  	@comments = Comment.where(article_id: @article.id)
  end

  def new
  	@article = Article.new
  end

  def edit
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
      flash[:success] = "Edit successfull"
    else
      render 'edit'
      flash[:danger] = "Edit failed"
    end
  end

  def create
  	@article = Article.new(article_params)
    @article.user_id = current_user.id
  	if @article.save
      redirect_to articles_path
  	  flash[:success] = "Article created successfully"
    else
      redirect_to new_article_path
      flash[:danger] = "Form is invalid"
  	end
  end

private

  def require_login
    if !current_user
      redirect_to login_path
    end
  end

  def get_instance
    @article = Article.find(params[:id])
  end

  def check_rights
    if @article.user_id != current_user.id && !current_user.is_staff
      redirect_to forbidden_path
    end
  end
  
  def article_params
    params.require(:article).permit(:title, :content)
  end
end

