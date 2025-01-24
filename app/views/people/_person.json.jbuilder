json.extract! person, :id, :name, :last_name, :gender, :birth_date, :cell_phone, :created_at, :updated_at
json.url person_url(person, format: :json)
