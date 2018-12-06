class CreateInterpretations < ActiveRecord::Migration[4.2]
  def change
    create_table :interpretations do |t|
      t.string :keyword
      t.text :analysis
      t.timestamps
    end
  end
end
