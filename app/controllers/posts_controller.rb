class PostsController < ApplicationController
  before_action :set_post, only: [:show, :like]

  require_relative '../models/post'

  def index
    @posts = Post.all.sample(10)
    # @posts = current_user.posts.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end


  # def initialize
  #   @post = Post.new(content: "Default Post Content")
  #   end

  def like
    @post = Post.find(params[:id])
    @like = current_user.likes.build(post: @post)

    if @post.likes.where(user: current_user).exists?
      respond_to do |format|
        format.js { render :already_liked }
      end
    else
      @like = @post.likes.build(user: current_user)

      if @like.save
        respond_to do |format|
          format.js
        end
      end
      end
  end

  def like_post(user)
    @post.like(user)
  end

  def display_likes
    puts "Total likes: #{@post.likes}"
  end


  def comment
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to user_post_path(@post.user, @post), notice: 'Comment created successfully.'
    else
      redirect_to user_post_path(@post.user, @post), alert: 'Failed to create comment.'
    end
  end

  private

   def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:title)
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
