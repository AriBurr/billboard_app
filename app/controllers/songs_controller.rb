class SongsController < ApplicationController
  before_action :find_artist

  def new
    @song = Song.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if song.update(song_params)
      redirect_to artist_path(@artist)
    else
      render :edit
    end
  end

  def destroy
  end

  private

    def find_artist
      @artist = Artist.find(params[:artist_id])
    end

    def song_params
      params.require(:song).permit(:title)
    end

end
