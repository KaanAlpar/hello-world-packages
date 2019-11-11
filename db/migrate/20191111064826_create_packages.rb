class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.references :user, foreign_key: true
      t.string :origin

      t.timestamps
    end
  end
end
