class RoomPlaylistsController < ApplicationController
    def create
        rp = RoomPlaylist.new(room_playlist_params)
        if rp.save
            render json: rp
        else
            render json: rp.errors.full_messages
        end
    end

    def delete
        rp = RoomPlaylist.find(params[:id])

        render json: rp

        rp.delete
    end

    private
    def room_playlist_params
        params.require(:room_playlist).permit!
    end
end
