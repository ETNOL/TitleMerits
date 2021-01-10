class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :photo_url
      t.string :display_name
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
