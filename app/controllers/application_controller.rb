class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :load_all_collections

  private
    def load_all_collections
      @collections = Collection.most_collected
    end
end
