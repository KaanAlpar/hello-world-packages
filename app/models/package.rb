class Package < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :origin, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
end
