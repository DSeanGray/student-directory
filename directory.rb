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
#all text placed into methods
def print_header
  puts "The students of Villains Academy"
  puts "------------"
end

students.each do |student|
  puts student
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens in the program until these methods are called
print_header
print(students)
print_footer(students)
