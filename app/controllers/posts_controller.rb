class PostsController < ApplicationController
  expose(:posts)
  expose(:post) { Post.where(slug: params[:id]).first }

  def index
  end

  def show
  end
end
