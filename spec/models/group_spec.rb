require 'rails_helper'

RSpec.describe Group, type: :model do
  describe "#create" do
    it "is valid with a title group_image description" do
      user = create(:user)
      group_image = fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'kobe.jpg'), 'image/jpeg')
      group = build(:group, group_image: group_image, user_id: user.id)
      expect(group).to be_valid
    end

    it "is invalid without a title" do
      user = create(:user)
      group = build(:group, title: nil, user_id: user.id)
      expect(group).not_to be_valid
    end

    it "is invalid without a description" do
      user = create(:user)
      group = build(:group, description: nil, user_id: user.id)
      expect(group).not_to be_valid
    end
  end
end
