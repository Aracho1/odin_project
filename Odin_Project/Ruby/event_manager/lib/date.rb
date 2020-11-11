# Find out which hours of the day the most people registered so we can run
# more ads during those hours

require 'csv'
require 'date'

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
register_hour = []
register_day = []


def register_time(regdate)
  DateTime.strptime(regdate, '%m/%d/%y %H:%M')
end

def calculate_day(date)
  case date.wday
  when 0
    "Sunday"
  when 1
    "Monday"
  when 2
    "Tuesday"
  when 3
    "Wednesday"
  when 4
    "Thursday"
  when 5
    "Friday"
  when 6
    "Saturday"
  end
end


contents.each do |row|
  register_hour << register_time(row[:regdate]).hour
  register_day << calculate_day(register_time(row[:regdate]))
end

count_by_hour = register_hour.sort.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
best_hour = count_by_hour.select {|k,v| v == count_by_hour.values.max}.keys.join(" and ")
puts "Most popular hour(s) to register was #{best_hour}"

count_by_days = register_day.inject(Hash.new(0)) { |h,v| h[v] += 1 ; h}
best_day = count_by_days.max_by {|k,v| v}[0]
puts "Most popular day to register was #{best_day}"
