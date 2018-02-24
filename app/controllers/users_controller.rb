class UsersController < ApplicationController
  def main
  end

  def register
  end

  def create
    user = User.create(user_params)
    if user.valid? == true
      flash[:notice] = ['User successfully created! Please Login']
      redirect_to '/users/main'
    else
      flash[:errors] = ["Invalid Registration information, please fill out all forms"]
      redirect_to '/users/main'
    end
  end


  def login
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:user_id] = user.id
      redirect_to '/songs/show'
    else
      flash[:errors] = ['Invalid Login Information']
      redirect_to '/users/main'
    end
  end

  def view
    @user = User.find(session[:user_id])
    @songs = @user.songs.uniq
    @plays = Play.where(["user_id = ?", @user.id ])


  end

  def logout
    reset_session
    redirect_to '/users/main'
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
