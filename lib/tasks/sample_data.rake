namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
        blogs = Blog.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      blogs.each { |blog| blog.comments.create!(content: content) }
    end
  end
end