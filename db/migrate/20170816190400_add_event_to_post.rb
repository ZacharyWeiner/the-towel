class AddEventToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :event, foreign_key: true
  end
end
