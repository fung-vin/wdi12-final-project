class RenameColumnUser < ActiveRecord::Migration
  def change
    rename_column :users, :name,  :first_name
    rename_column :users, :nickname,  :last_name
    rename_column :users, :image,  :profile_picture
  end
end
