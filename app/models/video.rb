class Video < ApplicationRecord
  include Video::Watchable

  # Associations
  belongs_to :collection, counter_cache: true

  # Validations
  validates :title, presence: true
  validates :tags, presence: true
  validates :embed_code, presence: true
end
