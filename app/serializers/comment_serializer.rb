class CommentSerializer < ActiveModel::Serializer
  attributes :replies, :replies_count


  def replies_count
    object.replies.count
  end

  def replies
    object
  end

end
