json.(item, :id, :title, :status, :description, :rating, :reporter_id, :assigned_to, :assigned_by, :created_at, :updated_at)

json.implementer_email item.implementer.present? ? item.implementer.email : nil
json.reporter_email item.reporter.present? ? item.reporter.email : nil
json.employer_email item.employer.present? ? item.employer.email : nil