class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  def new
  end

  def index
  end

  def create
    @user = User.new( makin_user )
    
    if @user.save 
      session[:user_id] = @user.id
    redirect_to '/groups'
    else 
      flash[:notice] = @user.errors.full_messages
      redirect_to "/main"
    end
  end
  def destroy
    session.clear
    redirect_to "/main"
  end
  private 
  def makin_user
    params.require(:user).permit(:first_name, :last_name, :email, :password ) 
  end 
end
