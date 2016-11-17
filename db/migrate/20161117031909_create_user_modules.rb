class CreateUserModules < ActiveRecord::Migration
  def change
    create_table :user_modules do |t|
      t.integer :user_id
      t.integer :web_module_id

      t.timestamps null: false
    end
  end
end
