class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :create, :update, :destroy]

  expose(:post, attributes: :post_params)

  def index
    self.post = Post.where(slug: params[:id]).first
  end

  def show
    self.post = Post.where(slug: params[:id]).first
  end

  def create
    save_post
  end

  def edit
  end

  def update
    save_post
  end

  private

  def generate_slug(title)
    title.parameterize
  end

  def save_post
    post.slug = generate_slug(post.title)

    if post.save
      redirect_to(read_post_path(post))
    else
      redirect_to dashboard_path
    end
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
