Rails.application.routes.draw do

  namespace :admin do
    resources :orders, only:[:show, :update] do
      resources :order_details, only:[:update]
    end

    resources :customers, only:[:index, :show, :edit, :update]

    resources :genres, only:[:index, :edit, :create, :update]

    resources :items, except: [:destroy]

    get '/' =>'homes#top'
  end

  scope module: :public do
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]

    post 'orders/comfirm',as: 'comfirm'
    get 'orders/complete',as: 'complete'
    resources :orders, only:[:new, :index, :show, :create]

    delete 'cart_items/destroy_all'=>'cart_items#destroy_all',as: 'destroy_all'
    resources :cart_items, only:[:index, :create, :update, :destroy]

    patch 'customers/withdraw',as: 'withdraw'
    get 'customers/unsubscribe',as: 'unsubscribe'
    resource :customers, only:[:show, :edit, :update]

    resources :items, only:[:index, :show]

    root :to =>"homes#top"
    get '/about'=>'homes#about',as: 'about'
  end
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
