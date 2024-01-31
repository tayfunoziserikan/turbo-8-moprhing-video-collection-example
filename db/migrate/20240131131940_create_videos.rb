class CreateVideos < ActiveRecord::Migration[7.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :tags
      t.text :embed_code
      t.boolean :watched, default: false
      t.belongs_to :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
