require 'spec_helper'

describe DashboardController do
  describe 'routing' do
    it 'GET /dashboard' do
      expect(get '/dashboard').to route_to('dashboard#index')
    end
  end
end
