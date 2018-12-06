class CreateDreamInterpretations < ActiveRecord::Migration
  def change
    create_table :dream_interpretations do |t|
      t.integer :dream_id
      t.integer :interpretation_id
      t.timestamps
    end
  end
end
