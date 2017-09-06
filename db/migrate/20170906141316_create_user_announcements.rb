class CreateUserAnnouncements < ActiveRecord::Migration[5.1]
  def change
    create_table :user_announcements do |t|
      t.references :user, foreign_key: true
      t.references :cohort, foreign_key: true
      t.boolean :read, default: true
      t.timestamps
    end
  end
end
