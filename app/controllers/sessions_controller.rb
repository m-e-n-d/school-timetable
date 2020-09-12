class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: login_params[:name])

    if user && user.authenticate(login_params[:password_digest])
      login user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
    def login_params
      params.require(:session).permit(:name, :password_digest)
    end

end
