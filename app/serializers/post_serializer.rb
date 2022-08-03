class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :status, :created_at, :content, :email, :likes, :comments


  def likes
    object.likes.count
  end

  def liked_by
    object.likes
  end
  
  def comments
    object.comments.count
  end

  def email
    object.user.email
  end
end
