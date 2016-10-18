class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  belongs_to :recipient, foreign_key: :recipient_id, class_name: 'User'

  has_many :messages

  validates :sender, presence: true
  validates :recipient, presence: true

  def self.latest
    order(created_at: :desc)
  end
end
