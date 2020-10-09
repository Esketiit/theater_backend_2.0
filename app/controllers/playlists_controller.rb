class PlaylistsController < ApplicationController
    def index
        playlists = Playlist.all.map {|playlist| {
            id: playlist.id, 
            name: playlist.name, 
            videos: playlist.videos
            }}

            render json: playlists, except: [:created_at, :updated_at]
    end

    def show
        playlist = Playlist.find(params[:id])

        render json: {
            id: playlist.id, 
            name: playlist.name, 
            videos: playlist.videos
            }, except: [:created_at, :updated_at]
    end

    def create
        # byebug
        playlist = Playlist.new(playlist_params)

        if playlist.save
            render json: {
                id: playlist.id, 
                name: playlist.name}, except: [:created_at, :updated_at]
        else
            render json: {errors: playlist.errors.full_messages}
        end
    end

    def update
        playlist = Playlist.find(params[:id])

        if playlist.update
            render json: playlist
        else
            render json: {errors: playlist.errors.full_messages}
        end
    end

    def delete
        playlist = Playlist.find(params[:id])

        render json: playlist

        playlist.delete
    end

    private 
    def playlist_params
        params.require(:playlist).permit!
    end
end
