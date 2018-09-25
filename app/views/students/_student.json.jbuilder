json.extract! student, :id, :mobile, :name, :grade, :teacher_id, :chat_count, :chat_minutes, :created_at, :updated_at
json.url student_url(student, format: :json)
