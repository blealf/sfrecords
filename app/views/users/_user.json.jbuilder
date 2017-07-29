json.extract! user, :id, :firstname, :lastname, :othernames, :occupation, :date_of_birth, :username, :password_digest, :created_at, :updated_at
json.url user_url(user, format: :json)
