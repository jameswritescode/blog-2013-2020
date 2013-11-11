Blog::Application.routes.draw do
  get '/:id', to: 'posts#show', as: :post

  root to: 'posts#index'
end
