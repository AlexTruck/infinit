namespace :scrape do
  desc "Scrape MinFin currencies"
  task currency: :environment do
    puts "scraping MinFin info..."
    # Post.delay.scrape_create
    # no moneny for heroku workers :(
    Currency.scrape_create
    puts "scraping complete."
  end
end