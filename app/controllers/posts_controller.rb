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
    @post.like(current_user)
    respond_to do |format|
      format.js { render :like }
    end
  end

  def like_post(user)
    @post.like(user)
  end

  def display_likes
    puts "Total likes: #{@post.likes}"
  end


  private

   def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title)
  end


end
