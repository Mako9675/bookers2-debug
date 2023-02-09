class Group < ApplicationRecord
  has_many :group_user
  has_many :users, through: :group_users
    
  validates :name, length: { minimum:2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  validates :group_image, presence: false
end
