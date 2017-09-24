class AddCohortToTicket < ActiveRecord::Migration[5.1]
  def change
    add_reference :tickets, :cohort, foreign_key: true
  end
end
