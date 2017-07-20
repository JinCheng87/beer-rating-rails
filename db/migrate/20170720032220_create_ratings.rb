class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :stars, null:false
      t.text :comment, null:false
      t.timestamps
      
    end
  end
end
