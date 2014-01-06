class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :post_exist_or_can_be_viewed?, only: [:show]

  expose(:post, attributes: :post_params)

  def index
  end

  def show
    self.post = Post.where(slug: params[:id]).first

    respond_to do |format|
      format.html
      format.json { render json: post } if current_user
    end
  rescue
    redirect_to root_path
  end

  def create
    save_post
  end

  def update
    save_post
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    respond_to do |format|
      format.json { render json: post }
    end
  end

  private

  def post_exist_or_can_be_viewed?
    post = Post.where(slug: params[:id]).first

    if post.nil? || post.idea? && !current_user
      redirect_to root_path
    end
  end

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
    params.require(:post).permit(:title, :content, :published)
  end
end
