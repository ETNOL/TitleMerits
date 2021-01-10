class AddOrganizationRefToMerit < ActiveRecord::Migration[5.2]
  def change
    add_reference :merits, :organization, foreign_key: true
  end
end
