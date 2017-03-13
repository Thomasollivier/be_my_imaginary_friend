class CreatePersonnalities < ActiveRecord::Migration[5.0]
  def change
    create_table :personnalities do |t|
      t.string :name
      t.integer :age
      t.string :job
      t.string :friends
      t.string :main_emotion
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
