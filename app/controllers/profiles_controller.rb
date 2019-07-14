class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to root_path
    else
      render :profile
    end
  end

  def edit
    @profile = Profile.find(current_user.profile.id)
    @user = User.find(current_user.id)
  end

  def update
    @profile = Profile.find(current_user.profile.id)
    @user = User.find(current_user.id)
    if @profile.update(profile_params) && @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :profile
    end
  end

  private
  def profile_params
    params.require(:profile).permit(:icon, :gender, :birth_info, :residence, :hobby, :job, :text).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:profile).require(:user).permit(:nickname)
  end
end
