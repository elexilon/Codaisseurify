class SongsController < ApplicationController

  def create
    @artist = Artist.find(params[:artist_id])
    @song = Song.new(song_params)
    @song.artist_id = params[:artist_id]
    @song.save
    redirect_to artist_path(@artist), notice: "f"
  end

  def destroy
    song = Song.find(params[:id])
    @artist = song.artist
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

end
