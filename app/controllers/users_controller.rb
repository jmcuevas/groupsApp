class UsersController < ApplicationController
  def create
      user = User.new( user_params )
      if user.valid?
          user.save
          session[:first_name] = user.first_name
          session[:user_id] = user.id
          redirect_to '/groups'
      else
          flash[:reg_errors] = user.errors.full_messages
          redirect_to '/'
      end
  end

  private
  def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
