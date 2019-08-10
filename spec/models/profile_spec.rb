require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "#create" do
    it "is valid with a icon gender birth_info residence hobby job text" do
      user = create(:user)
      icon = fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'icon_defo.jpg'), 'image/jpeg')
      profile = build(:profile, icon: icon, user_id: user.id)
      expect(profile).to be_valid
    end

    it "is valid without a icon gender birth_info residence hobby job text" do
      user = create(:user)
      profile = build(:profile, gender: nil, birth_info: nil, residence: nil, hobby: nil, job: nil, text: nil, user_id: user.id)
      expect(profile).to be_valid
    end
  end
end
