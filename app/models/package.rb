class Package < ApplicationRecord
  include AlgoliaSearch

  algoliasearch do
    attribute :name, :origin

    searchableAttributes ['origin', 'name']
  end

  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :price, presence: true
  validates :origin, presence: true
  validates :description, presence: true
  mount_uploader :photo, PhotoUploader
  before_save :capitalize_name

  private

  def capitalize_name
    words = name.split(' ')
    new_name = words.map do |name|
      name.capitalize
    end.join(' ')
    self.name = new_name
  end
end
