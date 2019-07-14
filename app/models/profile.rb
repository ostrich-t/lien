class Profile < ApplicationRecord
  has_one_attached :icon, dependent: :destroy
  belongs_to :user
end
