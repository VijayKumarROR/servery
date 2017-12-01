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
 resources :questions
 post 'questions/create'
 resources :answers
 post 'answers/create'
 #root 'questions#new'
  #root "api/v1/questions#index"
  # namespace :api, defaults: { format: :json } do
  # 	namespace :v1 do
  # 		resources :questions, :only => [:create, :show, :update, :index]
  # 		resources :answers, :only => [:create, :show, :update, :index]
  # 	end
  # end

end
