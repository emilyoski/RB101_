=begin

-Input: Floating point number
-Ouput: String consisting of degrees, minutes, seconds

-Requirements:
-String that represents degrees, minutes, seconds
-Use a degree symbol to represent degrees
-Use ' to represent minutes
-Use " to represent seconds
-Degree has 60 minutes
-Minute has 60 seconds
-Format minutes/seconds with 2 digit number with leading zeros
-360 can be 0 degrees or 360 degrees

-Algorithm:
-Take the integer portion...make it degrees
-Take the decimal values.
-Minutes is decimal value * 60 
-Then from that result...again take the decimal value * 60 (seconds)
-Round seconds
-Format degrees, minutes, seconds

=end
DEGREE = "\xC2\xB0"
DEGREE_MIN = 60
MIN_SEC = 60


def dms(number)
  degrees = number.to_i
  min_remain = number.remainder(1.0)
  sec_remain = (min_remain * DEGREE_MIN).remainder(1.0)
  minutes = (min_remain * DEGREE_MIN).to_i
  seconds = (sec_remain * MIN_SEC).round
  %(#{degrees}#{DEGREE}#{format('%02d', minutes)}'#{format('%02d',seconds)}")
end

puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")