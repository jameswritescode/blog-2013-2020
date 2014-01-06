class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  def after_sign_in_path_for(resource)
    dashboard_path
  end
end
