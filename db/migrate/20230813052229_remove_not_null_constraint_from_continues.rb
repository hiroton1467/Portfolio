class RemoveNotNullConstraintFromContinues < ActiveRecord::Migration[6.1]
  def change
    change_column :continues, :start_at, :datetime, null: true
    change_column :continues, :end_at, :datetime, null: true
    change_column :continues, :period, :datetime, null: true
 
  end
end
