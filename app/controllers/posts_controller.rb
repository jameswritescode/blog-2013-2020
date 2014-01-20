class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :post_exist_or_can_be_viewed?, only: [:show]

  # TODO find a better way to handle this
  skip_before_filter :verify_authenticity_token

  expose(:post, attributes: :post_params)
  expose(:posts)

  def index
    respond_to do |format|
      format.json if current_user
      request.path == root_path ? format.html : format.html { redirect_to root_path }
    end
  end

  def show
    self.post = Post.where(slug: params[:id]).first

    respond_to do |format|
      if !post.nil?
        format.html
        format.json { render json: post } if current_user
      else
        format.html { redirect_to root_path }
        format.json { render json: post, status: :unprocessable_entity }
      end
    end
  end

  def create
    save_post
  end

  def update
    save_post(update: true)
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    respond_to do |format|
      format.json { render json: post }
    end
  end

  private

  def save_post(opts = {})
    post.slug = generate_slug(post.title)

    respond_to do |format|
      if post.save
        format.json { render json: post }
        format.html { redirect_to(read_post_path(post)) } if opts[:update]
      else
        format.json { render json: post.errors, status: :unprocessable_entity }
      end
    end
  end

  def post_exist_or_can_be_viewed?
    post = Post.where(slug: params[:id]).first

    if post.nil? || post.idea? && !current_user
      redirect_to root_path
    end
  end

  def generate_slug(title)
    title.parameterize
  end

  def post_params
    params.require(:post).permit(:title, :content, :published)
  end
end
