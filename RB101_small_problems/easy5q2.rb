=begin

-Input: Integer (number of minutes)
-Output: String (represents the time of day)

-Requirements:
-Taking the numbers of minutes (as compared to midnight)
  and converting that to a normal time
-Accept positive and negative numbers 
-Positive represent time AFTER midnight
-Negative represent time BEFORE midnight
-Assume we receive a valid integer 
-Do we need to worry about being longer than one day? 
  Yes; will just cycle around the clock..
-Can not use date or time classes

Test Cases/Examples:
-Military time (13:20) for the 1pm time

Data Structure: 
-Integer input and String output 

Algorithm:
-Receive the minutes
-Put into hour and minutes
  -If longer than 24 hours, then subtract 24 hours
  -Continue until its less than 24 hours
-If its positive then
  -Add the hours and minutes to get the time
-If its negative then
  -Subtract the hours and minutes from 24 hours

=end 
require 'pry'

def determine_hour(minutes)
  abs_min = minutes.abs
  if abs_min > 59
    hour = abs_min/60
    while hour > 23
      hour -= 24
    end
  else
    hour = 0
  end
  hour
end
   
def time_of_day(minutes)
  hour = determine_hour(minutes)
  min = (minutes.abs)%60

  if minutes >= 0
    "#{format('%02d',hour.to_s)}:#{format('%02d', min.to_s)}"
  else
    hour = 23 - hour
    min = 60 - min
    "#{format('%02d',hour)}:#{format('%02d', min)}"
  end
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"