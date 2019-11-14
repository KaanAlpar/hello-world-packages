class RemovePhotoFromPackages < ActiveRecord::Migration[5.2]
  def change
    remove_column :packages, :photo, :string
  end
end
