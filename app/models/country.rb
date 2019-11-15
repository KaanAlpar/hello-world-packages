class Country < ApplicationRecord
  include AlgoliaSearch
  algoliasearch do
    attribute :name

    searchableAttributes ['name']
  end

  validates :name, presence: true
end
