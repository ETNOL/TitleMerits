class CreateMerits < ActiveRecord::Migration[5.2]
  def change
    create_table :merits do |t|
      t.string :name

      t.timestamps
    end
    add_index :merits, :name, unique: true
  end
end
