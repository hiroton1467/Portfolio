class CreateContinues < ActiveRecord::Migration[6.1]
  def change
    create_table :continues do |t|
      t.string :post, null: false
      t.string :title, null: false
      t.datetime :start_at, null: false
      t.datetime :end_at, null: false
      t.datetime :period, null: false
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
