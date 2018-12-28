# User.create!(name:  "Minh Thuan",
#              email: "doanminhthuan274@gmail.com",
#              password:              "thuan274",
#              password_confirmation: "thuan274",
#              admin:     true,
#              activated: true,
#              activated_at: Time.zone.now)

# 10.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end

user1 = User.find_by(email: "example-1@railstutorial.org")
librian = User.find_by(email: "doanminhthuan274@gmail.org")
Borrowing.create!(
  user_id: user1.id, 
  book_id: 2,
  due_date: 1.month.ago,
)

# 100.times do |n|
#   title        = Faker::Book.title
#   author       = Faker::Book.author
#   publisher    = Faker::Book.publisher
#   quantity     = Faker::Number.between(1, 15)
#   availability = quantity
#   year         = Faker::Number.between(0, 2017)
#   Book.create!(title:      title,
#               author:     author,
#               publisher:  publisher,
#               quantity:   quantity,
#               availability: availability,
#               year:       year)
# end



