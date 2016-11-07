class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :sender

  def sender
    object.user
  end
end
