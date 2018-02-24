class SongsController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @songs = Song.all
  end

  def view
    @song = Song.find(params[:id])
    @users = @song.users.uniq
    render 'view'
  end
  def create
    song = Song.create(song_params)
    if song.valid? == true
      flash[:notice] = ['Song Added!']
      redirect_to '/songs/show'
    else
      flash[:errors] = ['All forms must be filled out and be at least two characters']
      redirect_to '/songs/show'
    end
  end
  private
  def song_params
    params.require(:song).permit(:title, :artist)
  end
end
