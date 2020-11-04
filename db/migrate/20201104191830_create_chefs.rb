class CreateChefs < ActiveRecord::Migration[5.0]
  def change
    create_table :chefs do |t|
      t.string :chefname
      t.string :email
      t.integer :chef_stars
      t.timestamps
    end
  end
end
