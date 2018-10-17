class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :county, :string
    add_column :users, :about, :text
    add_column :users, :birthday, :date
  end
end
