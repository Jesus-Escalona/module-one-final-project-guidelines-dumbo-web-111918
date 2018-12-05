class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.string :name
      t.integer :score
      t.integer :magnitude
      t.text :cause
      t.timestamps
    end
  end
end
