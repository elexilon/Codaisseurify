class ArtistsController < ApplicationController
 before_action :set_artist

  def index
    @artists = Artist.all
  end

  def show
  end

  def create
    @artist = Artist.build(artist_params)

    if @artist.save
      redirect_to edit_artist_path(@artist), notice: "Artist created"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      redirect_to edit_artist_path(@artist), notice: "artist updated"
    else
      render :edit
    end
  end

  private

  def set_event
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params
    .require(:artist, :images)
    .permit(:name, :description, :photo)
  end

end
