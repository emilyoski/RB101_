=begin
	
Input: Array containing hashes
Output: Same array but reordered

Requirements:
-Reorder based on the year of publication of each book 
-Reorder based on earliest to the latest
-Use only the array we have, nothing else added

Test Cases/Examples:
-Nothing else to note 

Data Structure:
-Array in and array out (just reordered)

Algorithm:
-Look at each hash (element in the array)
-Look at the published date in the hash
-Order based on that value 
-Order based on earliest to latest 
	
=end

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

sorted_books = books.sort_by do |hash| 
	hash[:published]
end

p sorted_books