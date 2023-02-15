class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :card_num
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :role
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
