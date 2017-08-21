class CreateJoinTableTracksUsers < ActiveRecord::Migration[5.1]
  def change
     create_join_table :tracks, :users do |t|
      t.references :track, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
