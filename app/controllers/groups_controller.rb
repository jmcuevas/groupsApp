class GroupsController < ApplicationController
  before_action :require_login

  def index
  end

  def create
      group = Group.new( group_params )
      if group.valid?
          group.save
          membership = Member.new(group_id: group.id, user_id: group.user_id)
          if membership.valid?
              membership.save
          else
              redirect_to '/groups'
              return
          end
      else
          flash[:group_creation_error] = "Please check your group"
      end
      redirect_to '/groups'
  end

  def show
      @group = Group.find(params[:id])
  end

  def destroy
      group = Group.find(params[:id])
      group.destroy
      redirect_to '/groups'
  end

  private
  def group_params
      params.require(:group).permit(:name, :description, :user_id)
  end
end
