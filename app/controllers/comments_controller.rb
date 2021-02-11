class CommentsController < ApplicationController
  
  before_action :require_login
  before_action :get_instance, :check_rights, only: [:edit, :destroy, :update]
  
  def new
  	@comment = Comment.new
  end

  def edit
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@comment.article_id)
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_path(@comment.article_id)
      flash[:success] = "Edit successfull"
    else
      render 'edit'
      flash[:danger] = "Edit failed"
    end
  end

  def create
    @comment = Comment.new(comment_params)
  	@comment.user_id = current_user.id

  	if @comment.save
      redirect_to article_path(@comment.article_id)
  	  flash[:success] = "Сomment created successfully"
    else
      redirect_to new_comment_path
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
      @comment = Comment.find(params[:id])
    end

    def check_rights
      if @comment.user_id != current_user.id && !current_user.is_staff
        redirect_to forbidden_path
      end
    end
      
    def comment_params
      params.require(:comment).permit(:content, :article_id)
    end
end
