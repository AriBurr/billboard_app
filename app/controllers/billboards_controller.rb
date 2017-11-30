class BillboardsController < ApplicationController
    before_action :find_billboard, only: [:show, :edit, :update, :destroy, :find_song, :add_song, :remove_song]

  def index
    @billboards = Billboard.all
  end

  def show
  end

  def new
    @billboard = Billboard.new
    render partial: 'form'
  end

  def edit
    render partial: 'form'
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to billboards_path
    else
      render partial: 'form'
    end
  end

  def update
    if @billboard.update
      redirect_to billboard_path(@billboard)
    else
      render partial: 'form'
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  def find_song
    @songs = Song.find_song_not_on_billboard
  end

  def add_song
    @song = Song.find(params[:format])
    @song.update(billboard_id: params[:id])
    redirect_to billboard_path(@billboard)
  end

  def remove_song
    @billboard = Billboard.find(params[:id])
    @song = Song.find(params[:song_id])
    @song.update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end

  private

    def billboard_params
      params.require(:billboard).permit(:name, :id)
    end

    def find_billboard
      @billboard = Billboard.find(params[:id])
    end

end
