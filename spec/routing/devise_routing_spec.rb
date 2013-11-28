require 'spec_helper'

describe Devise::SessionsController do
  describe 'routing' do
    it 'GET /users/sign_in' do
      expect(get '/users/sign_in').to route_to('devise/sessions#new')
    end

    it 'POST /users/sign_in' do
      expect(post '/users/sign_in').to route_to('devise/sessions#create')
    end

    it 'GET /users/sign_out' do
      expect(get '/users/sign_out').to route_to('devise/sessions#destroy')
    end

    it 'DELETE /users/sign_out' do
      expect(delete '/users/sign_out').to route_to('devise/sessions#destroy')
    end
  end
end
