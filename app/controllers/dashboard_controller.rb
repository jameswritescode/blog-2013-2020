class DashboardController < ApplicationController
  before_action :authenticate_user!

  expose(:post)
  expose(:posts)

  def index
  end
end
