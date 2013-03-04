namespace :db do
  desc "Load load_data fixtures (from db/fixtures) into the current environment's database." 
  task :delete_fixtures => :environment do
    require 'active_record/fixtures'
    Dir.glob(RAILS_ROOT + '/db/fixtures/*.yml').each do |file|
      #Doesn't WORK!!!!!!!!!!
      file.delete_existing_fixtures()
    end
  end
end