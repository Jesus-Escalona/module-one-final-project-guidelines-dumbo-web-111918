class CreateDreams < ActiveRecord::Migration
  def change
    create_table :dreams do |t|
      t.text :content
      t.integer :user_id
      t.integer :emotion_id
      t.timestamps
    end
  end
end
