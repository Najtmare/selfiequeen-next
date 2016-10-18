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

  def self.average_rating
    joins(:ratings).
    where('ratings.stars IS NOT NULL').
    select('*').
    group('users.id, ratings.id').
    order('avg(ratings.stars) DESC')
  end

  def self.find_or_create_from_facebook(auth_hash)
    user = where(facebook_id: auth_hash.fetch('facebook_id')).first_or_create
    user.update(
      name: auth_hash.fetch('name'),
      email: auth_hash.fetch('email'),
      bio: auth_hash.fetch('bio'),
      password: SecureRandom.base64(10)
    )
    user
  end

  def is_admin?
    admin
  end
end
