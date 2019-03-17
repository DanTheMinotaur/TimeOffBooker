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
        {user_id: 2, start_date: Date.new(2019, 03, 17), end_date: Date.new(2019, 03, 20), note: "Hello I am a cheeseburger", approved: false}
    ]
)