class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  expose(:post, attributes: :post_params)

  def index
  end

  def show
    self.post = Post.where(slug: params[:id]).first

    respond_to do |format|
      format.html
      format.json { render json: post } if current_user
    end
  end

  def create
    save_post
  end

  def update
    save_post
  end

  private

  def generate_slug(title)
    title.parameterize[0...30]
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
