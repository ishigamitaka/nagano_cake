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
  sessions: "admin/sessions"
}
  # 会員側のルーティング設定
  get 'items' => 'public/items#index'
  # 管理者側のルーティング設定
  namespace :admin do
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope :public do
    get 'customers/confirmation'
    patch '/customers/:id/withdrawal' => 'customers#withdrawal', as: 'withdrawal'
    resources :customers, only: [:show, :edit, :update, :confirmation]
    resources :cart_items
    resources :homes
    resources :items
    resources :orders
  end
  
  root to: "public/homes#top"
  get 'about' => 'public/homes#about'
end
