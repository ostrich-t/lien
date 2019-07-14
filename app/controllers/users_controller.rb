class UsersController < ApplicationController
  before_action :set_user, except:[:index]
  def index
    @users = User.page(params[:page])
  end

  def show
  end

  def groups
    @groups = Group.where(user_id: @user)
  end

  def join_groups
  end

  def chat
    @groups = @user.groups
    @join_groups = current_user.group_users
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
end
