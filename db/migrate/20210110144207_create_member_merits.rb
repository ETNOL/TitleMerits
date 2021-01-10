class CreateMemberMerits < ActiveRecord::Migration[5.2]
  def change
    create_table :member_merits do |t|
      t.integer :number
      t.references :merit, foreign_key: true
      t.references :member, foreign_key: true

      t.timestamps
    end
  end
end
