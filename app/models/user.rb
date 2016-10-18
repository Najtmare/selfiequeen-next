class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  has_many :photos, dependent: :destroy
  has_many :conversations, foreign_key: 'sender_id'
  has_many :messages, dependent: :destroy
  has_many :ratings, dependent: :destroy


  def is_admin?
    admin
  end
end
