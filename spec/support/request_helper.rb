include Warden::Test::Helpers
module RequestHelpers
  def login_user(user)
    login_as user, scope: :user
  end
end