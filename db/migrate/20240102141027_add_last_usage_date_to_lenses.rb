class AddLastUsageDateToLenses < ActiveRecord::Migration[7.1]
  def change
    add_column :lenses, :last_usage_date, :date
  end
end
