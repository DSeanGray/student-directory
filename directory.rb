#printing the list of students into an array
students = [
 "Dr.Hanibal Lecter",
 "Darth Vader",
 "Nurse Ratched",
 "Michael Coleone",
 "Alex DeLarge",
 "The Wicked Witch of the west",
 "Terminator",
 "Freddy Krueger",
 "The Joker",
 "Joffrey Baratheon",
 "Norman Bates"
]
# now we print each index in the array
puts "The students of Villains Academy"
puts "------------"
students.each do |student|
  puts student
end
#now we print to total
puts "Overall, we have #{students.count} great students"
