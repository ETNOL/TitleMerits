json.extract! member, :id, :first_name, :last_name, :job_title, :photo_url, :display_name, :organization_id, :created_at, :updated_at
json.url member_url(member, format: :json)
