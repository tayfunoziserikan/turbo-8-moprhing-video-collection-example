class Video < ApplicationRecord
  include Video::Watchable

  # Associations
  belongs_to :collection, touch: true, counter_cache: true

  # Validations
  validates :title, presence: true
  validates :tags, presence: true
  validates :embed_code, presence: true

  # Broadcasts
  broadcasts_refreshes_to ->(stream) { stream.class.broadcast_target_default }
end
