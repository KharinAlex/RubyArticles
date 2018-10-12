class ArticlesController < ApplicationController
  def index
  	@articles = Article.all
  end

  def show
  	@article = Article.find(params[:id])
  	@user = User.find(@article.user_id)
  	@comments = Comment.where(article_id: @article.id)
  end

  def new
  	@article = Article.new
  end

  def edit
  	@article = Article.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_path
      flash[:success] = "Edit successfull"
    else
      render 'edit'
      flash[:error] = "Edit failed"
    end
  end

  def create
  	@article = Article.new(article_params)

  	if @article.save
      redirect_to articles_path
  	  flash[:success] = "Article created successfully"
    else
      redirect_to new_article_path
      flash[:error] = "Form is invalid"
  	end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :user_id)
  end

end

