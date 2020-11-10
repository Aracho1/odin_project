require 'csv'

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

def format_phone_number(phone)

  phone = phone.gsub(/\D/, "")
  
  if phone.nil?
    phone = "0000000000"
  elsif phone.length == 10
    phone
  elsif phone.length == 11 and phone.chr == "1"
    phone = phone[1..-1]
  else
    phone = "0000000000"
  end

end

contents.each do |row|
  name = row[:first_name]

  phone = format_phone_number(row[:homephone])

  puts "#{name} #{phone}"
end
