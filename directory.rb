#A method that takes user input and places it as a hash into a new array
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create and empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student has to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end


def print_header
  puts "The students of Villains Academy"
  puts "-" * 20
end
#getting input from the user for a first name first letter
def user_input_letter
  puts "-" * 20
  puts "Type the first letter of the student names you want to see and press return."
  first_letter = gets.chomp
end

#a method that take the students array and asks it to print out array items if they meet
#the IF coniditon that takes x from user_input_letter
def students_by_first_letter(students, x)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].start_with?(x)
  end
end

def students_by_length(students)
  puts "-" * 20
  puts "Print student names under 12 characters? \n (Y/N)"
  answer = gets.chomp.upcase
  if answer == 'Y'
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" if student[:name].length < 12
  end
end
end

#students now print out with their index position starting at 1
#each.with_index was used sto start at 1 as each_with_index takes no arguments and starts at 0
def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens in the program until these methods are called
students = input_students
print_header
print(students)
students_by_first_letter(students, user_input_letter)
students_by_length(students)
print_footer(students)
