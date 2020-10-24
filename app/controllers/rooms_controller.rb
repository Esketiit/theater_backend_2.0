class RoomsController < ApplicationController
    def index
        rooms = Room.all.map {|room| {id: room.id, name: room.name, playlist: room.playlists, description: room.description}}
        render json: rooms, except: [:created_at, :updated_at]
    end

    def show
        room = Room.find(params[:id])
        videos = room.playlists.map{|playlist| playlist.videos}.flatten
        render json: {
            id: room.id, 
            name: room.name, 
            playlist: room.playlists,
            videos: videos,
            description: room.description,
            comments: room.comments
            }, except: [:created_at, :updated_at]
    end

    def create
        # byebug
        room = Room.new(room_params)
        if room.save
            # render json: room, except: [:created_at, :updated_at]
            ActionCable.server.broadcast 'rooms_channel', room
            head :ok
        else
            render json: room.errors.full_messages, except: [:created_at, :updated_at]
        end
    end

    def delete
        room = Room.find(params[:id])

        render json: room

        room.delete
    end

    private
    def room_params
        params.require(:room).permit!
    end
end
