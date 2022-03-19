=begin

-Input: Array of strings
-Output: Integer (representing the index of the first name that starts with "Be")

-Requirements:
-Return the index of the first name that starts with "Be"
-What if there is not a "Be" name in the array? (not a case that we will handle here)
-What if there is multiple names that begin with "be"? (not handled here)
-Is this case sensitive? (based on the test case, this looks to be case sensitive)

-Examples/Test Cases:
-Only one example given here

-Data Structure: 
-Array given; returning an integer

-Algorithm:
-Set a string to "Be"
-Look at the first item; see if the string is in that array
-If yes; print the index 
-If no; continue to the next element in the array
-Stop when the array is empty

=end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

contain_string = "Be"

flintstones.each_with_index do |name, index|
	if name.include?(contain_string)
		puts index
  else
		next
	end
end

