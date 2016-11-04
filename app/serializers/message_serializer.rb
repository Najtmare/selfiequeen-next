class MessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :sender

  def sender
    ActiveModelSerializers::SerializableResource.new(object.user)
  end
end
