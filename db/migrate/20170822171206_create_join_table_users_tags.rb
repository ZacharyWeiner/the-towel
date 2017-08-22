class CreateJoinTableUsersTags < ActiveRecord::Migration[5.1]
  def change
    create_join_table :users, :tags do |t|
      t.references :users, foreign_key: true
      t.references :tags, foreign_key: true
    end
  end
end
