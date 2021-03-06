class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params['title']
    @post.image_url = params['image_url']
    @post.contents = params['contents']

    if @post.save
      redirect_to "/posts/#{@post.id}"
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params['id'])
  end

  def edit
    @post = Post.find(params['id'])
  end

  def update
    @post = Post.find(params['id'])
    @post.title = params['title']
    @post.image_url = params['image_url']
    @post.contents = params['contents']
    if @post.save
      redirect_to "/posts/#{@post.id}"
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params['id'])
    @post.destroy

    redirect_to '/posts'
  end

  def index
    @posts = Post.all
  end

  def search
    @post = Post.find_by(:title => params['title'])
    @search = params['title']

    if @post
      render 'show'
    else
      render 'no_results'
    end
  end
end





