class CreateBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :boards do |t|
      t.string :color
      t.integer :row
      t.integer :column
       t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
