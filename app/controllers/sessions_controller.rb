class SessionsController < ApplicationController
  def log
    @user = User.find_by_email(log_in[:email])
    session.clear
    if @user && @user.authenticate(log_in[:password])
      session[:user_id] = @user.id
      redirect_to "/groups"
    else 
      flash[:notice] = ["ooops"]
      redirect_to "/main"
    end
  end
  def verify


  end
  def destroy
    session.clear
  end
  private
  
  def log_in
    params.require(:user).permit(:email, :password)
  end 
end