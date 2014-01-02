class DashboardController < ApplicationController
  before_action :authenticate_user!

  expose(:post)

  def index
  end
end
