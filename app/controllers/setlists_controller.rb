class SetlistsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def new
    @setlist = Setlist.new
    @song = @setlist.songs.build
    @encore = @setlist.encores.build
  end

  def create
    @setlist = Setlist.new(setlist_params)
    @setlist.save
    redirect_to setlists_path
  end

  def show
    @setlist = Setlist.find(params[:id])
    @setlists = Setlist.all
  end

  def index
    @setlists = Setlist.order("created_at DESC").page(params[:page]).per(6)
  end

  def edit
    @setlist = Setlist.find(params[:id])
  end

  def update
    @setlist = Setlist.find(params[:id])
    @setlist.update(setlist_params)
    redirect_to setlist_path(@setlist)
  end

  private

  def setlist_params
    params.require(:setlist).permit(:artist, :date, :event, :venue, songs_attributes: [:id, :title, :_destroy], encores_attributes: [:id, :title, :_destroy])
  end
end
