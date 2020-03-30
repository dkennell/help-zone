class UserSessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to organizations_path
    end
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to(:organizations, notice: 'Login successful')
    else
      flash.now[:alert] = 'Username or password is incorrect'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_to('/login', notice: 'Logged out!')
  end
end
