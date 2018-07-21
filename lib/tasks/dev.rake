namespace :dev do
  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    User.destroy_all
    # create admin user
    User.create(email:"test@test.com", password:"123456", role:"admin")
    # create normal user
    20.times do |i|
      User.create!(
        email: FFaker::Internet.safe_email,
        password:"123456"
      )
    end
    puts "fake user created"
  end

  task fake_comment: :environment do
    Comment.destroy_all

    @restaurants = Restaurant.all
    @restaurants.each do |r|
      3.times do |i|
        r.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts "fake comment created!"
  end
end