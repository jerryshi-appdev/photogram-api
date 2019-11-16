Rails.application.routes.draw do

  match("/users", { :controller => "application", :action => "return_user_array", :via => "get"})

  match("/users/:username", { :controller => "application", :action => "return_user", :via => "get"})

  match("/users/:username/own_photos", { :controller => "application", :action => "return_photos", :via => "get"})


  # =================================================
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
