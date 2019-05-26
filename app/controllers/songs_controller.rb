class SongsController < ApplicationController
  
  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new
  end
  
  def create
    binding.pry
    @song = Song.create(song_params)
    binding.pry
    if @song.valid? 
      redirect_to song_path(@song)
    else
      render :new
    end
  end
  
  def show
    @song = find_song!
  end
  
  def edit
    @song = find_song!
  end
  
  def update
    @song = find_song!
    if @song.valid? 
      if @song.update(song_params) && @song.save
        redirect_to song_path(@song)
      else
        render :edit
      end
    end
  end
  
  def destroy
    @song=find_song!
    @song.destroy
    redirect_to songs_path
  end
  
  private
  
  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :gener)
  end
  
  def find_song!
    @song = Song.find(params[:id])
  end
end
