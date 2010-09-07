namespace :libraries do
  desc "Update libraries parsing their feeds"
  task :update => :environment do
    Library.all.each do |library|
      library.parse_feed
    end
  end
end