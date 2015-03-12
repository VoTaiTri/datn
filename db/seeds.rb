Lecturer.create!(name:  "Admin",
               email: "vtt@gmail.com",
               password:              "123456",
               password_confirmation: "123456",
               admin: true)
Lecturer.create!(name:  "User1",
               email: "u1@gmail.com",
               password:              "123456",
               password_confirmation: "123456")
Lecturer.create!(name:  "User2",
               email: "u2@gmail.com",
               password:              "123456",
               password_confirmation: "123456")

Subject.create!(name: "Co so du lieu")
Subject.create!(name: "Co so tri thuc")
Subject.create!(name: "Tri tue nhan tao")
Subject.create!(name: "An toan bao mat")
Subject.create!(name: "Tro giup quyet dinh")

Teaching.create!(lecturer_id: 2,
                subject_id: 1)
Teaching.create!(lecturer_id: 2,
                subject_id: 2)
Teaching.create!(lecturer_id: 2,
                subject_id: 3)
Teaching.create!(lecturer_id: 2,
                subject_id: 5)
Teaching.create!(lecturer_id: 3,
                subject_id: 1)
Teaching.create!(lecturer_id: 3,
                subject_id: 3)
Teaching.create!(lecturer_id: 3,
                subject_id: 5)