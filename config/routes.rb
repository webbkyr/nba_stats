Rails.application.routes.draw do
  scope path: '/nba_api' do
    resources :docs, only: [:index], path: '/swagger'

    scope path: '/v1' do
      resources :teams
      # your routes go here
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
