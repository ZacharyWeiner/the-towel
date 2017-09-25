class Ticket < ApplicationRecord
  belongs_to :cohort
  belongs_to :creator, :class_name => 'User', :foreign_key => "created_by"
  belongs_to :assignee, :class_name => 'User', :foreign_key => "assigned_to", optional: true
  belongs_to :resolver, :class_name => 'User', :foreign_key => "resolved_by", optional: true

  def set_asignee(user)
    self.assigned_to = user.id
    self.status = "Assigned To #{user.safe_name}"
    self.save
  end

  def mark_resolved(user)
    self.resolved_on = Time.now
    self.resolved_by = user.id
    self.status = 'Resolved'
    self.save
  end
end
