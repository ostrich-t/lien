class Group < ApplicationRecord
  has_many :users, through: :group_users
  has_many :group_users
  belongs_to :user
  has_one_attached :group_image, dependent: :destroy
  has_one :bulletin_board, dependent: :destroy
  has_many :messages
  validates :title, :description, presence: true

  def self.search(search)
    return Group.all unless search
    Group.where(['title LIKE ?', "%#{search}%"])
  end
end
