class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :link
      t.string :name
      t.integer :playlist_id

      t.timestamps
    end
  end
end
