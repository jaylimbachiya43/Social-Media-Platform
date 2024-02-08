class CommentsController < ApplicationController
  
  
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  def new
    @comment = Comment.new
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
  def update
    # You can leave it empty or redirect to another page
  end
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

     @comment.save
      
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
