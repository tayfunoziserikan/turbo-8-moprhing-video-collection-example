class CreateCollections < ActiveRecord::Migration[7.2]
  def change
    create_table :collections do |t|
      t.string :title
      t.string :creator_name

      t.timestamps
    end
  end
end
