class CreateWebModules < ActiveRecord::Migration
  def change
    create_table :web_modules do |t|
      t.string :module_name

      t.timestamps null: false
    end
  end
end
