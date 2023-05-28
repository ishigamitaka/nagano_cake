Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}
  # 会員側のルーティング設定
  get 'items' => 'public/items#index'
  # 管理者側のルーティング設定
  namespace :admin do
    resources :items
    resources :customers, only: [:index, :show, :edit, :update]
    resources :registrations
    resources :orders, only: [:index, :show,]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope module: :public do
    get 'customers/confirmation' => "customers#confirmation"
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    resource :customers, only: [:show]
    delete "/cart_items/destory_all" => "cart_items#destory_all"
    resources :cart_items
    resources :homes
    resources :items, only: [:index, :show]
    post '/orders/confirmation'
    get '/orders/complete'
    resources :orders, only: [:new, :index, :show, :create]
  end
  
  root to: "public/homes#top"
  get 'about' => 'public/homes#about'
end
