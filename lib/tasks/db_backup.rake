namespace :db do
  desc 'Backup the database'
  task :backup => :environment do
    desc 'Backup budgeter_development as SQL'
    %x[ pg_dump -h localhost budgeter_development -f "budgeter_development-$(date '+%Y%m%d%H%M%S').sql" ]
  end
end
