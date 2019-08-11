require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe "GET #index" do
    before do
      takashi = create :takashi
      create :profile, user: takashi
      satoshi = create :satoshi
      create :profile, user: satoshi
    end

    it 'リクエストが成功すること' do
      get users_path
      expect(response.status).to eq 200
    end

    it 'ユーザー名が表示されていること' do
      get users_path
      expect(response.body).to include "Takashi"
      expect(response.body).to include "Satoshi"
    end
  end

  describe 'GET #show' do
    context 'ユーザーが存在する場合' do
      before do
        @takashi = create :takashi
        create :profile, user: @takashi
      end

      it 'リクエストが成功すること' do
        get user_path(@takashi)
        expect(response.status).to eq 200
      end

      it 'ユーザー名が表示されていること' do
        get user_path(@takashi)
        expect(response.body).to include 'Takashi'
      end
    end

    context 'ユーザーが存在しない場合' do
      subject { -> { get user_path 1 } }

      it { is_expected.to raise_error ActiveRecord::RecordNotFound }
    end
  end

  describe 'GET #group' do
    before do
      @takashi = create :takashi
      create :profile, user: @takashi
    end
    it 'リクエストが成功すること' do
      get groups_user_path(@takashi)
      expect(response.status).to eq 200
    end
  end
end
