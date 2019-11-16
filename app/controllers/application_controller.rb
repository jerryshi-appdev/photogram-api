class ApplicationController < ActionController::Base
  def return_user_array
    u = User.all
    render({ :plain => u.to_json})
  end

  def return_user
    u = User.where({ :username => params.fetch(:username)})
    render({ :plain => u.to_json})
  end

  def return_photos
    u = User.where({ :username => params.fetch(:username)}).first
    u_photos = Photo.where({ :owner_id => u.id})
    render({ :plain => u_photos.to_json})
  end
end
