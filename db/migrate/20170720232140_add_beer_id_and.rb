class AddBeerIdAnd < ActiveRecord::Migration[5.0]
  def change
    change_table :ratings do |t|
      t.integer :beer_id
      t.integer :user_id
    end
  end
end
