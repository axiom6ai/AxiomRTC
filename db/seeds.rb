# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DB_PASSWORD = '12345678'

Admin.create! mobile: '10000000001',
              name: 'Xing',
              level: Admin::ROOT,
              password: DB_PASSWORD,
              password_confirmation: DB_PASSWORD

0.upto 5 do |i|
  Admin.create! mobile: "#{20000000000 + i}",
                name: "Admin #{i}",
                password: DB_PASSWORD,
                password_confirmation: DB_PASSWORD
end

index = 0
2.times do
  Teacher.degrees.each do |degree|
    Teacher.create! mobile: "#{30000000000 + index}",
                    name: "Teacher #{index}",
                    degree: degree,
                    password: DB_PASSWORD,
                    password_confirmation: DB_PASSWORD
    index += 1
  end
end

teachers = Teacher.all
index = 0
10.times do
  Student.grades.each do |grade|
    Student.create! mobile: "#{40000000000 + index}",
                    name: "Student #{index}",
                    teacher_id: teachers[index % teachers.length].id,
                    grade: grade,
                    password: DB_PASSWORD,
                    password_confirmation: DB_PASSWORD
    index += 1
  end
end
