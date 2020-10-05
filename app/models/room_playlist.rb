class RoomPlaylist < ApplicationRecord
    belongs_to :playlist
    belongs_to :room
end
