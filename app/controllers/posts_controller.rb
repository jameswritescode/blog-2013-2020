class PostsController < ApplicationController
  expose(:post)  { Post.where(slug: params[:id]).first }

  def index
  end

  def show
  end
end
