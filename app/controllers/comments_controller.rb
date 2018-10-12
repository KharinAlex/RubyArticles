class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def edit
  	@comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to article_path(@comment.article_id)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to article_path(@comment.article_id)
      flash[:success] = "Edit successfull"
    else
      render 'edit'
      flash[:error] = "Edit failed"
    end
  end

  def create
  	@comment = Comment.new(comment_params)

  	if @comment.save
      redirect_to article_path(@comment.article_id)
  	  flash[:success] = "comment created successfully"
    else
      redirect_to new_comment_path
      flash[:error] = "Form is invalid"
  	end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :article_id)
  end
end
