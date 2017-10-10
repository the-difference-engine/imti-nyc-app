set :output, {error: "log/cron-error.log", standard: "log/cron.log"}
set :output, "#{path}/log/cron_log.log"
set :environment, :development

every :tuesday, at: '2pm' do
  # can change the day and time
  runner "User.send_pending_app_email"
end
