class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :merits do |t|
      # t.index [:user_id, :merit_id]
      # t.index [:merit_id, :user_id]
    end
  end
end
