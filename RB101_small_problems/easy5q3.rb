=begin

BEFORE MIDNIGHT METHOD:
-Input: Time of day (in 24 hour format)
-Output: Minutes before midnight

-Requirements:
-Take the time as a 24 hour format
-Do not use Date or Time methods
-Should return a value in the range of 0..1439 
-There is 1440 minutes in a day

Data Structure:
-String; Integer output

Algorithm:
-Take the time...break it into hours and minutes
-Take the hours...23 minus hours
-Take the minutes....60 minus minutes
-Calculate the total minutes and return it

AFTER MIDNIGHT METHOD:

=end
require 'pry'

def before_midnight(time)
  time_split = time.split(':')

  hours = time_split[0].to_i
  minutes = time_split[1].to_i

  hour_before = 23 - hours
  min_before = 60 - minutes

  time_before = (hour_before * 60) + min_before
  if hours == 0 && minutes == 0
    time_before = 0
  end
  time_before
end

def after_midnight(time)
  time_split = time.split(':')

  hours = time_split[0].to_i
  minutes = time_split[1].to_i

  time_after = (hours * 60) + minutes
  if hours == 24 && minutes == 0
    time_after = 0
  end
  time_after
end


p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0