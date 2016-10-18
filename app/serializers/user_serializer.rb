class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :subscribed, :subscribed_until

  has_many :conversations, foreign_key: :sender_id
  has_many :messages
  has_many :photos
  has_many :ratings
end
