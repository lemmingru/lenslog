class CreateLensTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :lens_types do |t|
      t.string :manufacturer
      t.string :prescription
      t.integer :wearing_period

      t.timestamps
    end
  end
end
