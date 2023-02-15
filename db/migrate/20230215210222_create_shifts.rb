class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
