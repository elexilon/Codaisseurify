class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_artist_song, only: [:show, :update, :destroy]

  def index
    json_response(@artist.songs)
  end

  def show
    json_response(@song)
  end

  def create
    @artist.items.create!(song_params)
    json_response(@artist, :created)

    @song = Song.new(song_params)
    @song.artist_id = params[:artist_id]
    @song.save
    redirect_to artist_path(@artist), notice: "f"
  end

  def destroy
    @song.update(song_params)

    @artist = @song.artist
    if song.destroy
      redirect_to artist_path(@artist), notice: "Song removed"
    else
      redirect_to @artist, notice: "Cannot delete that Song"
    end
  end

  private

  def song_params
    params
    .require(:song)
    .permit(:name)
  end

  def set_artist
    @artist = Artist.find(params[:artist_id])
  end

  def set_artist_song
    @song = @artist.songs.find_by!(id: params[:id]) if @artist
  end

end
