class CreateUsers < ActiveRecord::Migration[5.1]
  def up
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name
      t.timestamps
    end
  end

  def down
  	drop_table :users
  end
end
