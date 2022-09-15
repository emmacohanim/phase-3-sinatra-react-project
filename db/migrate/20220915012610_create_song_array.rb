class CreateSongArray < ActiveRecord::Migration[6.1]
  def change
    create_table :song_arrays do |t|
      t.string :title
      t.string :artist
      t.string :album
      t.integer :duration
    end
  end
end
