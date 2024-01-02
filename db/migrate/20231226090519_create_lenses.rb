class CreateLenses < ActiveRecord::Migration[7.1]
  def change
    create_table :lenses do |t|
      t.string :status
      t.integer :usage_days
      t.references :lens_type, foreign_key: true

      t.timestamps
    end
  end
end
