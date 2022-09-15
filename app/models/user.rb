class User < ActiveRecord::Base
    has_many :playlists
    validates_uniqueness_of :username
end