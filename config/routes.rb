Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
    root to: 'homes#top'
    get "users/favorite/:id" => "users#favorite", as: 'favorite'
    get '/users/:id/leave' => 'users#leave', as: 'leave'
    get "continues/search" => "continues#search", as: 'search'
    resources :users do
      member do
        patch 'withdrawal'
      end
    end
    resources :continues, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
    end
  end




  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root to: "homes#top"
    get "continues/search" => "continues#search", as: 'search'
    get "continues/f_detail" => "continues#f_detail", as: 'f_detail'
    get "users/favorite/:id" => "users#favorite", as: 'favorite'
    get '/users/:id/leave' => 'users#leave', as: 'leave'
     patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
     post '/users/start_continue' => 'continue_times#start_continue' , as: 'start'
     post '/users/end_continue' => 'continue_times#end_continue' , as: 'end'


    resources :users, only: [:show, :edit, :update, :destroy]
    resources :continues, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
