class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_one :profile, dependent: :destroy
  has_many :sns_credential, dependent: :destroy
  has_many :groups, through: :group_users
  has_many :group_users
  has_many :groups, dependent: :destroy
  has_many :messages, dependent: :destroy
  validates :nickname, presence: true
  def self.find_for_oauth(auth)
    user = User.find_by(email: auth.info.email)
    sns = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
    if sns.present?
      user = User.where(id: sns.user_id).first
    else
      if user.present?
        sns = SnsCredential.create(
          user_id: user.id,
          uid: auth.uid,
          provider: auth.provider
          )
      else
        user = User.create(
          nickname: auth.info.name,
          email:    auth.info.email,
          password: Devise.friendly_token[0,20]
          )
        sns = SnsCredential.create(
          user_id: user.id,
          uid: auth.uid,
          provider: auth.provider
          )
        NotificationMailer.send_mail(user).deliver_later
      end
    end
    user
  end

  def already_group?(group)
    self.group_users.exists?(group_id: group.id)
  end
end
