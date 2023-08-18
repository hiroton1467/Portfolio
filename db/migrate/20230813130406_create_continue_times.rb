class CreateContinueTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :continue_times do |t|
      
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.datetime :period, null: false

      t.timestamps
    end
  end
end
