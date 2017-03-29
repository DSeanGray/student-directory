#A method that takes user input and places it as a hash into a new array
def input_students
  puts "Please enter the names of the students.".center(100)
  puts "To finish, just hit return.".center(100)
  puts "----------------------".center(100)
  #create and empty array
  students = []
  #get the first name
  puts "Enter Name:"
  name = gets.chomp.capitalize
  #getting input for their cohort
  puts "Enter Cohort:"
  cohort = gets.chomp.capitalize
  #could use ".strip" to delete whitespace and new lines but chomp acheives the same thing.

  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student info to the array if the user gives input for both values
    if !cohort.empty?
      students << {name: name, cohort: cohort}
    else
      students << {name: name, cohort: :empty}
    end
    if students.count > 1
      puts "Now we have #{students.count} students.".center(100)
    else
      puts "Now we have #{students.count} student.".center(100)
    end
    #get another name from the user
    puts "Enter Name:"
    name = gets.chomp.capitalize
    puts "Enter Cohort:"
    cohort = gets.chomp.capitalize
  end
  #return the array of students
  students
end


def print_header
  puts "The students of Villains Academy".center(100)
  puts "----------------------".center(100)
end

#students print out with their index position starting at 1
#each.with_index was used to start at 1 as each_with_index takes no arguments and starts at 0
def print(students)
  students.sort_by! { |hash| hash[:cohort] }
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(100)
  end
end

def print_while(students)
  nums = 0
  until nums == students.count do
    students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(100)
      nums += 1
    end
  end
end

#getting input from the user for a first name first letter
def user_input_letter
  puts "Type the first letter of the student names you want to see and press return.".center(100)
  first_letter = gets.chomp
end

#a method that take the students array and asks it to print out array items if they meet
#the IF coniditon that takes x from user_input_letter
def students_by_first_letter(students, x)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100) if student[:name].start_with?(x)
  end
end

def students_by_length(students)
  puts "----------------------".center(100)
  puts "Print student names under 12 characters? \n (Y/N)".center(100)
  answer = gets.chomp.upcase
  if answer == 'Y'
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100) if student[:name].length < 12
  end
end
end


def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(100)
end

#nothing happens in the program until these methods are called
students = input_students
print_header
print(students)
students_by_first_letter(students, user_input_letter)
students_by_length(students)
print_footer(students)
