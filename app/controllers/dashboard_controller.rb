class DashboardController < ApplicationController
  before_action :authenticate_user!

  expose(:post)
  expose(:posts)

  def index
  end

  def post_listing
    if request.xhr?
      render partial: 'posts'
    else
      redirect_to dashboard_path
    end
  end
end
