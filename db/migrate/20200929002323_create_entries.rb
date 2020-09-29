class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :item1
      t.string :item2
      t.string :item3
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
