module CollectionsHelper
  def collection_progress_bar_for(collection, height: 20)
    tag.progress "#{collection.watched_ratio * 100}%", id: dom_id(collection, :progress_bar),
                 value: collection.videos.watched.count, max: collection.videos_count, class: "w-full h-#{height}"
  end
end
