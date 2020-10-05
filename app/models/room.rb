class Room < ApplicationRecord
    has_many :roomPlaylists
    has_many :playlists, through: :roomPlaylists
    has_many :comments
end
