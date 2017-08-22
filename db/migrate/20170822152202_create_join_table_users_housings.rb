class CreateJoinTableUsersHousings < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :housings do |t|
      t.references :users, foreign_key: true
      t.references :housings, foreign_key: true
    end
  end
end
