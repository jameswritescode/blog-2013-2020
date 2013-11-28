require 'spec_helper'

describe PostsController do
  describe 'routing' do
    it 'GET /' do
      expect(get '/').to route_to('posts#index')
    end

    it 'GET /:id' do
      expect(get '/test').to route_to('posts#show', id: 'test')
    end
  end
end
