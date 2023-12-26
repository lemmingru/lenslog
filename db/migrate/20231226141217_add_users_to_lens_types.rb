class AddUsersToLensTypes < ActiveRecord::Migration[7.1]
  def change
    add_reference :lens_types, :user, null: false, foreign_key: true
  end
end
