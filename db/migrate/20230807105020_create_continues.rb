class CreateContinues < ActiveRecord::Migration[6.1]
  def change
    create_table :continues do |t|
      t.string :post, null: false
      t.string :title, null: false
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :period
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
