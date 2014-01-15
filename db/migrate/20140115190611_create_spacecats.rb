class CreateSpacecats < ActiveRecord::Migration
  def change
    create_table :spacecats do |t|
      t.string :name
      t.text :home_planet
      t.text :tagline
      t.text :superpower
    end
  end
end
