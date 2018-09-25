class Chat < ApplicationRecord

  belongs_to :student,
             foreign_key: :student_id,
             inverse_of: :chats

  belongs_to :teacher,
             foreign_key: :teacher_id,
             inverse_of: :chats

  validates :name,
            presence: true,
            length: {maximum: 128}

  validate :should_have_an_owner
  validate :should_have_start_time
  validate :should_consistent_for_duration_and_stop_time

  def should_have_an_owner
    student_id || teacher_id
  end

  def should_have_start_time
    return false if student_id && !student_started_at
    !(teacher_id && !teacher_started_at)
  end

  def should_consistent_for_duration_and_stop_time
    return false if student_leaved_at && teacher_leaved_at && !duration_minutes
    !(duration_minutes && (!teacher_leaved_at || !student_leaved_at))
  end

  def stopped_at
    return nil unless student_leaved_at && teacher_leaved_at
    student_leaved_at < teacher_leaved_at ?
        student_leaved_at : teacher_leaved_at
  end

end
