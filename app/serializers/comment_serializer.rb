class CommentSerializer < ActiveModel::Serializer
  attributes :replies, :replies_count

  has_many :replies

  def replies_count
    object.replies.count
  end
  
end
