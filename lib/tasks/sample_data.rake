namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_links
  end
end

def make_links
  Url.create_link("http://railstutorial.org", "rt")
  
  256.times do |n|
    original  = FFaker::Internet.http_url
    Url.create_link(FFaker::Internet.http_url,
      (0...8).map { ('a'..'z').to_a[rand(26)] }.join)
  end
end
