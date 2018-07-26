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
    User.create(email:"test@test.com", password:"123456", role:"admin", name:"neo", intro:"i am the chosen one")
    # create normal user
    20.times do |i|
      eml = FFaker::Internet.safe_email
      nme = eml.split("@").first
      User.create!(
        email: eml,
        password:"123456",
        name: nme
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

  task fake_favorite: :environment do
    Favorite.destroy_all
    # reset all favorites_count in Restaurant table
    res = Restaurant.all
    res.update(favorites_count:0)

    # all users collect 100 restaurants
    @users = User.all
    @users.each do |r|
      100.times do |i|
        r.favorites.create!(
          restaurant: Restaurant.all.sample
        )
      end
    end
    puts "fake favorite created!"
  end
end