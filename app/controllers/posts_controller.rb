class PostsController < ApplicationController
  expose(:posts) { Post.order('id DESC') }
  expose(:post)  { Post.where(slug: params[:id]).first }

  def index
  end

  def show
  end
end
