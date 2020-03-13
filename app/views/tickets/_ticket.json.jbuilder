json.extract! ticket, :id, :title, :body, :help_desk_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
