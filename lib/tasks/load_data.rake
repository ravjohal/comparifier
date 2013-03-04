namespace :db do
  desc "Load load_data fixtures (from db/fixtures) into the current environment's database." 
  task :load_data => :environment do
    require 'active_record/fixtures'
    Dir.glob(RAILS_ROOT + '/db/fixtures/*.yml').each do |file|
      Fixtures.create_fixtures('db/fixtures', File.basename(file, '.*'))
    end
  end
end