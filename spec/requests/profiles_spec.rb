require 'rails_helper'

RSpec.describe ProfilesController, type: :request do
  describe 'GET #new' do
    it 'リクエストが成功すること' do
      get new_profiles_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET #edit' do
    before do
      @user = create :user
      create :profile, user: @user
      login_user @user
    end

    it 'リクエストが成功すること' do
      get edit_profiles_path
      expect(response.status).to eq 200
    end

    it 'textが表示されていること' do
      get edit_profiles_path
      expect(response.body).to include 'aaaa'
    end
  end

  describe 'POST #create' do
    before do
      user = create :user
      login_user user
    end
    context 'パラメータが妥当な場合' do
      it 'リクエストが成功すること' do
        post profiles_url, params: { profile: FactoryBot.attributes_for(:profile) }
        expect(response.status).to eq 302
      end

      it 'プロフィールが登録されること' do
        expect do
          post profiles_url, params: { profile: FactoryBot.attributes_for(:profile) }
        end.to change(Profile, :count).by(1)
      end

      it 'ルートにリダイレクトすること' do
        post profiles_url, params: { profile: FactoryBot.attributes_for(:profile) }
        expect(response).to redirect_to root_path
      end
    end
  end

  # describe 'PUT #update' do
  #   before do
  #     @user = create :user
  #     create :profile, user: @user
  #     login_user @user
  #   end

  #   context 'パラメータが妥当な場合' do
  #     it 'リクエストが成功すること' do
  #       put profiles_url, params: { profile: FactoryBot.attributes_for(:profile, :user) }
  #       expect(response.status).to eq 302
  #     end

  #     it 'ユーザー名が更新されること' do
  #       expect do
  #         put profiles_url, params: { profile: FactoryBot.attributes_for(:profileb, :user) }
  #       end.to change { Profile.find(profile.id).text }.from('aaaa').to('bbbb')
  #     end

  #     it 'リダイレクトすること' do
  #       put profiles_url, params: { profile: FactoryBot.attributes_for(:profileb, :user) }
  #       expect(response).to redirect_to user_path
  #     end
  #   end
  # end
end