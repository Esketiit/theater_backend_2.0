class Playlist < ApplicationRecord
    has_many :videos
    has_many :roomPlaylists
    has_many :rooms, through: :roomPlaylists
end
