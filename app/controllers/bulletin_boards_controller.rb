class BulletinBoardsController < ApplicationController
  before_action :set_group
  before_action :authenticate_user!
  before_action :ensure_member

  def show
    @group = Group.find(params[:group_id])
  end

  def edit
    @bulletin_board = @group.bulletin_board
  end

  def update
    @bulletin_board = BulletinBoard.find_by(group_id: params[:group_id])
    if @bulletin_board.update(bulletin_board_params)
      redirect_to group_bulletin_board_path
    else
      render :bulletin_board
    end
  end

  private
  def bulletin_board_params
    params.require(:bulletin_board).permit(:text)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def ensure_member
    unless @group.user == current_user
      redirect_to group_path(@group) unless @group.group_users.find_by(user_id: current_user.id)
    end
  end
end
