class AddFieldsToRating < ActiveRecord::Migration[5.1]
  def change
    add_column :ratings, :object_id, :bigint
    add_column :ratings, :object_type, :string
  end
end
