#assigning a global variable accessible to all methods
@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array fo students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort}
    end
    file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil?# get out of the method if it isn't given
  if File.exists?(filename) #if file exists
    load_students(filename) #load that file using our own method
     puts "Loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit #quit
  end
end

#A method that takes user input and places it as a hash into a new array
def input_students
  puts "Please enter the names of the students.".center(100)
  puts "To finish, just hit return.".center(100)
  puts "----------------------".center(100)
  #create and empty array
  students = []
  #get the first name
  puts "Enter Name:"
  name = STDIN.gets.chomp.capitalize
  #getting input for their cohort
  puts "Enter Cohort:"
  cohort = STDIN.gets.chomp.capitalize
  #could use ".strip" to delete whitespace and new lines but chomp acheives the same thing.

  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student info to the array if the user gives input for both values
    if !cohort.empty?
      @students << {name: name, cohort: cohort}
    else
      @students << {name: name, cohort: :empty}
    end
    if @students.count > 1
      puts "Now we have #{@students.count} students.".center(100)
    else
      puts "Now we have #{@students.count} student.".center(100)
    end
    #get another name from the user
    puts "Enter Name:"
    name = STDIN.gets.chomp.capitalize
    puts "Enter Cohort:"
    cohort = STDIN.gets.chomp.capitalize
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
def print_student_list
  @students.sort_by! { |hash| hash[:cohort] }
  @students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(100)
  end
end

def print_while
  nums = 0
  until nums == students.count do
    @students.each.with_index(1) do |student, index|
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(100)
      nums += 1
    end
  end
end

#getting input from the user for a first name first letter
def user_input_letter
  puts "Type the first letter of the student names you want to see and press return.".center(100)
  first_letter = STDIN.gets.chomp
end

#a method that take the students array and asks it to print out array items if they meet
#the IF coniditon that takes x from user_input_letter
def students_by_first_letter(students, x)
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100) if student[:name].start_with?(x)
  end
end

def students_by_length
  puts "----------------------".center(100)
  puts "Print student names under 12 characters? \n (Y/N)".center(100)
  answer = STDIN.gets.chomp.upcase
  if answer == 'Y'
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100) if student[:name].length < 12
  end
end
end


def print_footer
  if @students.count > 1
    puts "We have #{@students.count} great students in total. "
  elsif @students.count == 1
    puts "We have 1 great student in total. "
  else
    puts "There are no students in the Villains Academy"
  end
end

#nothing happens in the program until these methods are called

try_load_students
interactive_menu
#students = input_students
#print_header
#print(students)
#students_by_first_letter(students, user_input_letter)
#students_by_length(students)
#print_footer(students)
