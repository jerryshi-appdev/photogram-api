Rails.application.routes.draw do

  match("/users", { :controller => "application", :action => "return_user_array", :via => "get"})

  match("/users/:username", { :controller => "application", :action => "return_user", :via => "get"})

  match("/users/:username/own_photos", { :controller => "application", :action => "return_photos", :via => "get"})

  match("/users/:username/liked_photos", { :controller => "application", :action => "return_likes", :via => "get"})

  match("/users/:username/feed", { :controller => "application", :action => "return_feed", :via => "get"})

  match("/users/:username/discover", { :controller => "application", :action => "return_discover", :via => "get"})

  match("/photos/:id", { :controller => "application", :action => "return_photo", :via => "get"})

  match("/photos/:id/likes", { :controller => "application", :action => "return_photo_likes", :via => "get"})

  match("/photos/:id/fans", { :controller => "application", :action => "return_photo_fans", :via => "get"})

  match("/insert_like_record", { :controller => "application", :action => "insert_like_record", :via => "get"})

  match("/delete_like/:id", { :controller => "application", :action => "delete_like", :via => "get"})

  match("/photos/:id/comments", { :controller => "application", :action => "return_photo_comments", :via => "get"})

  match("/insert_comment_record", { :controller => "application", :action => "insert_comment_record", :via => "get"})

  match("/update_comment_record/:id", { :controller => "application", :action => "update_comment_record", :via => "get"})

  # =================================================
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
