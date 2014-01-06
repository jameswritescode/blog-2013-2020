require 'spec_helper'

describe PostsController do
  describe 'routing' do
    it 'GET /' do
      expect(get '/').to route_to('posts#index')
    end

    it 'GET /:id' do
      expect(get '/test').to route_to('posts#show', id: 'test')
    end

    it 'POST /posts' do
      expect(post '/posts').to route_to('posts#create')
    end

    it 'PATCH /posts/:id' do
      expect(patch '/posts/1234').to route_to('posts#update', id: '1234')
    end

    it 'PUT /posts/:id' do
      expect(put '/posts/1234').to route_to('posts#update', id: '1234')
    end

    it 'DELETE /posts/:id' do
      expect(delete '/posts/1234').to route_to('posts#destroy', id: '1234')
    end
  end
end
