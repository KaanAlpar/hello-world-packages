class Item < ApplicationRecord
  belongs_to :package
  validates :name, presence: true
  validates :photo, presence: true
  mount_uploader :photo, PhotoUploader
end
