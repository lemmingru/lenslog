class RenameDaysColumns < ActiveRecord::Migration[7.1]
  def change
    rename_column :lenses, :usage_days, :usage_hours
    rename_column :usages, :usage_days, :usage_hours
  end
end
