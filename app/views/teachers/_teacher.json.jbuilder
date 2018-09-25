json.extract! teacher, :id, :mobile, :name, :degree, :student_count, :chat_count, :chat_minutes, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
