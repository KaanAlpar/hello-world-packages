class Package < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :origin, presence: true
  mount_uploader :photo, PhotoUploader
end
