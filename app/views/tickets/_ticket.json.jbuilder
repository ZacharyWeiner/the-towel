json.extract! ticket, :id, :created_by, :assigned_to, :status, :details, :resolution, :resolved_on, :title, :resolved_by, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
