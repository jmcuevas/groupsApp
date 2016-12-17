class SessionsController < ApplicationController
  def index
  end

  def create
      user = User.find_by_email(params[:user][:email])
      if !user # Does not exists
          flash[:login_error] = "Your user name or password is invalid"
          redirect_to '/'
      else # If user exists
          if user.authenticate(params[:user][:password]) # And password is correct
              session[:first_name] = user.first_name
              session[:user_id] = user.id
              redirect_to '/groups'
          else # Password is incorrect
              flash[:login_error] = "Your username or password is invalid"
          end
      end
  end

  def destroy
      reset_session
      redirect_to '/'
  end

end
