class AddNameToUsers < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.text :name, null: false
    end
  end
end
