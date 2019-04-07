require './lib/holiday_calulator'

obj = HolidayCalulator.new(Date.new(2019, 8, 10), Date.new(2019, 8, 20), [Date.new(2019, 03, 20), Date.new(2019, 03, 19)])

puts obj.total_days
