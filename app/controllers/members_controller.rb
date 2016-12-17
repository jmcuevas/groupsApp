class MembersController < ApplicationController
  def create
      membership = Member.new ( membership_params )
      if membership.valid?
          membership.save
          redirect_to :back
      else
          flash[:membership_reg_error] = "Ooops something went wrong. Try joining again"
          redirect_to :back
      end
  end

  def destroy
      membership = Member.find_by( membership_params )
      membership.destroy
      redirect_to :back
  end

  private
  def membership_params
      params.require(:member).permit(:user_id, :group_id)
  end
end
