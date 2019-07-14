class BulletinBoardsController < ApplicationController
  before_action :sign_in_user, only:[:show, :edit, :update]

  def show
    @group = Group.find(params[:group_id])
  end

  def edit
    @group = Group.find(params[:group_id])
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
end
