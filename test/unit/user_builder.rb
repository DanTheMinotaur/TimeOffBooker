require './lib/employee_builder.rb'

user = EmployeeBuilder.new
user.password 11111
user.name "Daniel"
user.total_days 20
user.job_title "manager"
user.user_level 2
user.email 'google@google.com'


puts user.for_model

if User.create(user.for_model)
  puts "User Create Successfully"
end