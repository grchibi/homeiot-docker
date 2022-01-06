Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  namespace :api, format: 'json' do
    namespace :v1 do
      namespace :tph_register do
        post "/", :action => "create"
      end
      namespace :tph_refer do
        get "/latest", :action => "latest"
        get "/latest_iel", :action => "latest_in_each_location"
      end
      namespace :dev_locs do
        get "/", :action => "index"
      end
      namespace :ck_data do
        get "/get_t_by_h", :action => "get_temp_by_h"
        get "/get_h_by_h", :action => "get_humid_by_h"
      end
    end
  end

  post 'tph_register', controller: 'tph_register', action: 'create'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
end
