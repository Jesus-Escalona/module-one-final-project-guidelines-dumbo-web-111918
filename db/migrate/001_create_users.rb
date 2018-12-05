class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :month
      t.string :sign
      t.timestamps
    end
  end
end
