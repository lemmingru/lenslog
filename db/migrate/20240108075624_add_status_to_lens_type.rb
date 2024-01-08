class AddStatusToLensType < ActiveRecord::Migration[7.1]
  def change
    add_column :lens_types, :status, :string
  end
end
