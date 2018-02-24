class PlaysController < ApplicationController
    def addSong
      song = Song.find(params[:id])
      user = User.find(session[:user_id])
      play = Play.new
      play.user_id = user.id
      play.song_id = song.id
      play.save
      redirect_to '/songs/show'
    end
  end