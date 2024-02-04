class AddVideosCountToCollections < ActiveRecord::Migration[7.2]
  def change
    add_column :collections, :videos_count, :integer, default: 0
  end
end
