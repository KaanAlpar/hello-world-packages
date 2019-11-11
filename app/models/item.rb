class Item < ApplicationRecord
  belongs_to :package
  validates :name, presence: true
end
