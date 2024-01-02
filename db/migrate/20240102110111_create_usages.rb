class CreateUsages < ActiveRecord::Migration[7.1]
  def change
    create_table :usages do |t|
      t.references :lens, null: false, foreign_key: true
      t.integer :usage_days
      t.date :usage_date

      t.timestamps
    end
  end
end
