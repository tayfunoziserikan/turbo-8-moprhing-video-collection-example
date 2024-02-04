class Collection < ApplicationRecord
  # Associations
  has_many :videos, dependent: :destroy

  # Validations
  validates :title, presence: true
  validates :creator_name, presence: true

  # Attachments
  has_one_attached :cover_picture do |attachable|
    attachable.variant :small, resize: "100x160"
    attachable.variant :thumb, resize: "280x175"
    attachable.variant :large, resize: "400x250"
  end

  # Broadcasts
  broadcasts_refreshes_to ->(stream) { stream.class.broadcast_target_default }

  # Scopes
  scope :most_collected, -> { order(videos_count: :desc) }

  def watched_ratio
    videos.any? ? videos.watched.count.to_f / videos_count : 0
  end
end
