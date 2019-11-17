class ApplicationController < ActionController::Base
  def return_user_array
    u = User.all
    render({ :plain => u.to_json})
  end

  def return_user
    u = User.where({ :username => params.fetch(:username)}).first
    render({ :plain => u.to_json})
  end

  def return_photos
    u = User.where({ :username => params.fetch(:username)}).first
    render({ :plain => u.own_photos.to_json             })
  end

  def return_likes
    u = User.where({ :username => params.fetch(:username)}).first
    render({ :plain => u.liked_photos.to_json})
  end

  def return_feed
    u = User.where({ :username => params.fetch(:username)}).first
    render({ :plain => u.feed.to_json})
  end
  
  def return_discover
    u = User.where({ :username => params.fetch(:username)}).first
    render({ :plain => u.discover.to_json})
  end
  
  def return_photo
    photo = Photo.where({ :id => params.fetch(:id)}).first
    render({ :plain => photo.to_json})
  end

  def return_photo_likes
    photo = Photo.where({ :id => params.fetch(:id)}).first
    render({ :plain => photo.likes.to_json})
  end

  def return_photo_fans
    photo = Photo.where({ :id => params.fetch(:id)}).first
    render({ :plain => photo.fans.to_json})
  end

  def insert_like_record
    l = Like.new
    l.fan_id = params.fetch(:input_user_id).to_i
    l.photo_id = params.fetch(:input_photo_id).to_i
    l.created_at = Time.now
    l.updated_at = Time.now
    l.save
    render({ :plain => l.to_json})
  end

  def delete_like
    l = Like.where({ :id => params.fetch(:id)}).first
    l.destroy
    render({ :plain => l.to_json}) #returns deleted like entry
  end

  def return_photo_comments
    photo = Photo.where({ :id => params.fetch(:id)}).first
    render({ :plain => photo.comments.to_json})
  end

  def insert_comment_record
    c = Comment.new
    c.body = params.fetch(:input_body)
    c.author_id = params.fetch(:input_user_id)
    c.photo_id = params.fetch(:input_photo_id)
    c.created_at = Time.now
    c.updated_at = Time.now
    c.save
    render({ :plain => c.to_json})
  end

  def update_comment_record
    c = Comment.where({ :id => params.fetch(:id)}).first
    c.body = params.fetch(:input_body)
    c.updated_at = Time.now
    c.save
    render({ :plain => c.to_json})
  end
end
