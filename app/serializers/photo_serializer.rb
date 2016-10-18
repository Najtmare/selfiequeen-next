class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :title, :images, :height, :width, :status, :created_at

  belongs_to :user
  has_many :ratings

  def images
    {
      original_url: object.image_url
    }
  end
end