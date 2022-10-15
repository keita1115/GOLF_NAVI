Rails.application.routes.draw do

# 管理者用
# URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

#ゲストログイン
 devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
 end

# user用
# URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

 namespace :admin do
    root to: 'homes#top'
    resources :courses
    resources :users do
     resources :comments, only: [:destroy]
    end
    resources :genres

  end


 scope module: :public do
   root to: 'homes#top'
   get '/about' => 'homes#about'
   get 'searches' => 'courses#search'
   patch 'users/withdrawal' => 'users#withdrawal', as: 'withdrawal'
   resources :users
  # get 'users/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
    resources :courses do
    resource :favorites, only: [ :create, :destroy]
    resources :comments, only: [ :create, :destroy]
    end
    resources :favorites, only: [:index]
    resources :searches
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
