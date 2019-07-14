class GroupsController < ApplicationController
  before_action :set_group, except:[:index, :search, :new, :create]
  before_action :sign_in_user, except:[:index, :search, :show, :users]
  before_action :ensure_edit , only:[:edit, :udate]

  def index
    # @groups = Group.joins(:group_users).group(:group_id).order('count(group_users.user_id) desc').page(params[:page])
    @groups = Group.page(params[:page])
  end

  def search
    @groups = Group.search(params[:search]).page(params[:page])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @bulletin_board = @group.build_bulletin_board
    if @group.save && @bulletin_board.save
      redirect_to group_path(@group)
    else
      render :group
    end
  end

  def show
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      render :group
    end
  end

  def users
  end

  def join
    @group_user = @group.group_users.build(user_id: current_user.id)
    if @group_user.save
      redirect_to group_path(@group)
    end
  end

  def leave
    @group_user = @group.group_users.find_by(user_id: current_user.id)
    if @group_user.destroy
      redirect_to group_path(@group)
    end
  end

  def chat
    @groups = current_user.groups
    @join_groups = current_user.group_users
    @messages = @group.messages.last(500)
  end

  private
  def group_params
    params.require(:group).permit(:title, :group_image, :description).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:id])
  end

  def ensure_edit
    redirect_to group_path unless @group.user == current_user
  end
end
