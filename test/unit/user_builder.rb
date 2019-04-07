require './lib/employee_builder.rb'

user = EmployeeBuilder.new
user.password 11111
user.name "Daniel"
user.days_off 20
user.job_title "manager"
user.user_level 2
user.email = 'google@google.com'

puts user.for_model