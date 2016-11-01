class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  enum status: [ :pending, :approved, :denied ]

  has_many :ratings, dependent: :destroy

  validates :title, presence: true
  validates :image, presence: true
  validates :user, presence: true
 
  def self.average_ratings
    joins(:ratings).
    where('ratings.stars IS NOT NULL').
    select('*').
    group('photos.id, ratings.id').
    order('avg(ratings.stars) DESC')
  end

  def self.pending_status
    where(status: :pending).order('created_at DESC')
  end

  def self.approved_status
    where(status: :approved).order('created_at DESC')
  end

  def self.denied_status
    where(status: :denied).order('created_at DESC')
  end

  def average_rating
    ratings.sum(:stars) / ratings.count
  end

  def self.statuses
    %w(pending approved denied)
  end
end
