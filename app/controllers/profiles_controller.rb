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

  private
  def profile_params
    params.permit(:icon, :gender, :birth_info, :residence, :hobby, :job, :text).merge(user_id: current_user.id)
  end
end
