# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create(
    [
        { name: 'Daniel Devine', job_title: 'CEO', total_days: 100, user_level: 3, email: 'danieldevine74@gmail.com', needs_approval: false, :password => "111111", :password_confirmation => "111111"  },
        { name: 'Tom Riddle', job_title: 'Drone', total_days: 15, user_level: 1, email: 'tomriddle@gmail.com', needs_approval: true, :password => "111111", :password_confirmation => "111111"  },
        { name: 'Sarah Parker', job_title: 'Programmer', total_days: 20, user_level: 1, email: 'sp@gmail.com', needs_approval: true, :password => "111111", :password_confirmation => "111111"  },
        { name: 'John Cheese', job_title: 'Customer Service', total_days: 25, user_level: 1, email: 'jc@gmail.com', needs_approval: true, :password => "111111", :password_confirmation => "111111"  },
        { name: 'Alana Peter', job_title: 'Manager', total_days: 20, user_level: 2, email: 'alanap@gmail.com', needs_approval: true, :password => "111111", :password_confirmation => "111111"  }
    ]
)

time_offs = TimeOff.create(
    [
        {user_id: 2, start_date: Date.new(2019, 03, 17), end_date: Date.new(2019, 03, 20), note: "Hello I am a cheeseburger", approved: false},
        {user_id: 3, start_date: Date.new(2019, 04, 17), end_date: Date.new(2019, 05, 01), note: "Holiday", approved: false},
        {user_id: 4, start_date: Date.new(2019, 10, 1), end_date: Date.new(2019, 10, 5), note: "Hello ", approved: false},
        {user_id: 5, start_date: Date.new(2019, 05, 17), end_date: Date.new(2019, 05, 30), note: "Cheeseburger", approved: true, approved_by: 1},
        {user_id: 2, start_date: Date.new(2019, 05, 17), end_date: Date.new(2019, 05, 17), note: "Cheeseburger", approved: true, approved_by: 5},
        {user_id: 3, start_date: Date.new(2019, 05, 20), end_date: Date.new(2019, 05, 22), note: "Cheeseburger", approved: true, approved_by: 5},
        {user_id: 4, start_date: Date.new(2019, 06, 20), end_date: Date.new(2019, 06, 23), note: "Cheeseburger", approved: false},
        {user_id: 4, start_date: Date.new(2019, 07, 30), end_date: Date.new(2019, 8, 02), note: "Cheeseburger", approved: false},
        {user_id: 5, start_date: Date.new(2019, 9, 17), end_date: Date.new(2019, 9, 18), note: "Cheeseburger", approved: true, approved_by: 1},
    ]
)

approvals = Approval.create(
    [

    ]
)