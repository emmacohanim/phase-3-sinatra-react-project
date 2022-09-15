class CreateSongPlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :song_playlists do |t|
      t.integer :song_id
      t.integer :playlist_id
    end
  end
end
