# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Pledge.destroy_all
Reward.destroy_all
User.destroy_all
Comment.destroy_all
Project.destroy_all


5.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.free_email,
    password: 'password',
    password_confirmation: 'password'
  )
end

10.times do
  project = Project.create!(
      title: Faker::App.name,
      description: Faker::Lorem.paragraph,
      goal: rand(100000),
      start_date: Time.now.utc,
      end_date: Time.now.utc + rand(7..10).days,
      user_id: User.first.id
    )

    5.times do
      project.rewards.create!(
      description: Faker::Superhero.power,
      dollar_amount: rand(100),
      )
    end
end


20.times do
  project = Project.all.sample
  user = User.all.sample
  while user.id == project.user_id
    user = User.all.sample
  end
  Pledge.create!(
  user: user,
  project: project,
  dollar_amount: project.rewards.sample.dollar_amount + rand(10)
  )

end
