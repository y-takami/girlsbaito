require 'sidekiq/web'


Rails.application.routes.draw do
  config = Rails.application.config.girlsbaito

  constraints host: config[:shop][:host] do
    namespace :shop, path: config[:shop][:path] do
      root 'top#index'
      resource :session, only: [:new, :create, :destroy]
      get '/shop_shows/cities_select' => 'shop_shows#cities_select'
      get '/shop_shows/routes_select' => 'shop_shows#routes_select'
      get '/shop_shows/stations_select' => 'shop_shows#stations_select'

      resources :shop_shows, :path => 'recruit', :as => :recruit
      resource :account, except: [:destroy]
      resource :password, only: [:show, :edit, :update]
      resources :applies, only: [:index, :show, :edit, :update]
      get '/fee' => 'top#fee'
      get '/fee_last_month' => 'top#fee_last_month'
      get '/stop_flag_true' => 'top#stop_flag_true'
      get '/stop_flag_false' => 'top#stop_flag_false'
      get '/contact' => 'top#contact'
      get '/policy' => 'top#policy'
      get '/personal_info' => 'top#personal_info'

    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root 'top#index'
      resource :session, only: [:new, :create, :destroy]
      resources :shops
      resources :shop_shows
      resources :girls
      resources :applies, only: [:index]
      resources :congratulations, only: [:edit, :update]
      resources :invitations, only: [:index, :edit, :update]
      resources :contacts, only: [:index, :show ]

      get '/fee' => 'top#fee'
      get '/fee_last_month' => 'top#fee_last_month'
      get '/fee_shop' => 'top#fee_shop'

    end
  end

  constraints host: config[:girl][:host] do
    namespace :girl, path: config[:girl][:path] do
      root 'prefectures#index'
      resources :applies, only: [:index, :show] do
        resources :congratulations, only: [:new, :create]
      end
      resources :prefectures, only: [:index, :show, :new] do
        resources :cities, only: [:index, :show]
        resources :routes, only: [:index, :show] do
          resources :stations, only: [:index, :show]
        end
        resources :categories, only: [:index, :show]
        get '/payment_search' => 'top#payment_search'
        get '/shop_pref' => 'shops#shop_pref'

      end
      resource :session, only: [:new, :create, :destroy]
      resources :shops, only: [:index, :show] do
        resources :applies, only: [:new, :create]
      end

      resource :account, except: [:destroy] do
        resources :invitations, only: [:new, :create]
      end
      resource :password, only: [:show, :edit, :update]
      resources :questions, only: [:index, :show]
      resource :contact, only: [:new, :create]

      get '/job_category' => 'top#job_category'
      get '/advertisement' => 'top#advertisement'
      get '/contact' => 'top#contact'
      get '/policy' => 'top#policy'
      get '/personal_info' => 'top#personal_info'
      get '/favorite_add' => 'top#favorite_add'
      get '/favorite_delete' => 'top#favorite_delete'
      get '/favorite' => 'top#favorite'
      get '/history' => 'top#history'
      get '/intro' => 'top#intro'

    end
  end
  mount Sidekiq::Web => '/sidekiq'
  get '*anything' => 'errors#not_found'


end
