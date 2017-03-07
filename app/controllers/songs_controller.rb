class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :destroy]
  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def show
  end

  def edit
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to @song
    else
      render :new
    end
  end

  def update
    @song = Song.update(params[:id], song_params)
    if @song.valid?
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end


  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
  end
end
