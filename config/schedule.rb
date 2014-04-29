set :output, "#{path}/log/crons.log"

every :day, :at => '1:00am', :roles => [:app] do
  rake "order:remind"
end