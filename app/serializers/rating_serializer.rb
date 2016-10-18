class RatingSerializer < ActiveModel::Serializer
  attributes :id, :stars
  has_one :photo
  has_one :user
end
