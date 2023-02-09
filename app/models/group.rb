class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  accepts_nested_attributes_for :group_users
    
  validates :name, length: { minimum:2, maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }
  validates :group_image, presence: false
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'no_image.jpg', content_type: 'image/jpg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
