class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :sender, :recipient

  has_many :messages

  belongs_to :sender
  belongs_to :recipient
end