class CreateContinueTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :continue_times do |t|

      t.integer :user_id, null: false
      t.integer :continue_id, null: false
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
