class Playlist < ActiveRecord::Base
    belongs_to :user
    has_many :song_playlists
    has_many :songs, through: :song_playlists
end