Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
      authenticated :user do
      root :to => 'questions#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  #root "api/v1/questions#index"
  namespace :api do
  	namespace :v1 do
  		resources :questions
  		root 'questions#index'
  	end
  end

end
