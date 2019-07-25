class UsersController < ApplicationController
  before_action :set_user, except:[:index]
  before_action :ensure_user, only:[:chat]
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

  def ensure_user
    redirect_to chat_user_path(current_user) unless @user == current_user
  end
end
