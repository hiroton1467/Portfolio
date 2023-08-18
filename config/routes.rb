Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
   namespace :admin do
   root to: 'homes#top'
  end




  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root to: "homes#top"
    get "continues/search" => "continues#search", as: 'search'
    get "continues/favorite" => "continues#favorite", as: 'favorite'
    get "continues/f_detail" => "continues#f_detail", as: 'f_detail'
    get '/users/:id/leave' => 'users#leave', as: 'leave'
     patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'


    resources :users, only: [:show, :edit, :update, :leave, :withdrawl, :destroy]
    resources :continues, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
      resources :comments, only: [:create, :destroy]
      resource :likes, only: [:create, :destroy]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
