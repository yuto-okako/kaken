desc "This task is called by the Heroku scheduler add-on"
task :delete_dayly_mission => :environment do
  Mission.where(dayly: true).delete_all
end