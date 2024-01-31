class Video < ApplicationRecord
  include Video::Watchable

  # Associations
  belongs_to :collection, touch: true, counter_cache: true

  # Validations
  validates :title, presence: true
  validates :tags, presence: true
  validates :embed_code, presence: true

  # Callbacks
  after_update_commit :broadcast_update_later

  private

    def broadcast_update_later
      broadcast_render_later_to collection, partial: "videos/update", locals: { video: self, collection: collection }
    end
end
