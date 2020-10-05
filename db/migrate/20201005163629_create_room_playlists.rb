class CreateRoomPlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :room_playlists do |t|
      t.integer :room_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
