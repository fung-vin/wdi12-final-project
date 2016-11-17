class AddPreferences < ActiveRecord::Migration
  def change
    add_column :users, :preferences, :string, array: true, default: []
  end
end
