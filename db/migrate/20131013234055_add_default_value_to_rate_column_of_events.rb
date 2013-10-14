class AddDefaultValueToRateColumnOfEvents < ActiveRecord::Migration
  def change
    change_column :events, :rate, :integer, default: 0
  end
end
