module Video::Watchable
  extend ActiveSupport::Concern
  included do
    # Scopes
    scope :watched, -> { where(watched: true) }
    scope :not_watched, -> { where(watched: false) }
  end

  private
    def watched!
      update(watched: true)
    end
end
