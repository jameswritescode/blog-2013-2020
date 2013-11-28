require 'spec_helper'

describe Admin::DashboardController do
  describe 'routing' do
    it 'GET /admin' do
      expect(get '/admin').to route_to('admin/dashboard#index')
    end
  end
end
