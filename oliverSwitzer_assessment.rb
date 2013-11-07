
# oliverSwitzer_assessment.rb
require 'rubygems'
gem 'awesome_print'
require 'awesome_print'

include ObjectSpace

# 1. Arrays ******************************************************************************

# array = ["Blake","Ashley","Jeff"]
# a. Add a element to an array
# array.push("Oliver")
# b. Write a statement to print out all the elements of the array.
# array.each {|name| puts name}
# c. Return the value at index 1.
# puts array[1]
# d. Return the index for the value "Jeff".
# jeff = array.select {|name| name == "Jeff"}
# puts jeff

# 2. Hashes

# instructor = {:name => "Ashley", :age => 27}

# # a. Add a new key for location and give it the value "NYC".
# instructor["location".to_sym] = "NYC"
# # b. Write a statement to print out all the key/value pairs in the hash
# instructor.each {|k,v| puts "#{k}: #{v}"}
# # c. Return the name value from the hash.
# puts instructor[:name]
# # d. Return the key name for the value 27.
# puts instructor.key(27)

# # 3. Nested Structures ******************************************************************************

school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

# a. Add a key to the school hash called "founded_in" and set it to the value 2013.
school[:founded_in] = "2013"
# # b. Add a student to the school's students' array.
school[:students] << {:name => "Bob", :grade => "C"}
ap school
# # c. Remove "Billy" from the students' array.
school[:students].delete_at(1)
ap school
# # d. Add a key to every student in the students array called "semester" and assign it the value "Summer".
school[:students].each {|student_hash| student_hash[:semester] = "Summer"}
ap school
# # e. Change Ashley's subject to "being almost better than Blake"
school[:instructors][1][:subject] = "being almost better than Blake"
ap school
# # f. Change Frank's grade from "A" to "F".
school[:students][2][:grade] = "F"
ap school
# g. Return the name of the student with a "B".
school[:students][0].each do |k, v|
          if v == "B"
            puts school[:students][0][:name]
          end
        end
# h. Return the subject of the instructor "Jeff".
puts school[:instructors][2][:subject]
# i. This question is ***FLAGED*** as don't do


# 4. Methods ******************************************************************************

STDNT_LIST = school[:students]
INCTR_LIST = school[:instructors]

def grade(stdnt_name, stdnt_hashlist=STDNT_LIST)
  stdnt_hashlist.each do |student_hash|
    student_hash.each do |k, v|
      if student_hash[:name] == stdnt_name
        return student_hash[:grade]
      end
    end
  end
end

puts grade("Marissa")

# b. i. Create a method to udpate a instructor's subject given the instructor and the new subject. 
# ii. Then use it to update Blake's subject to "being terrible".

def subj_update(inctr_name, new_subj, inctr_hashlist=INCTR_LIST)
  inctr_hashlist.each do |teacher_hash|
    teacher_hash.each do |k, v|
      if teacher_hash[:name] == inctr_name
         teacher_hash[:subject] = new_subj
      end
    end
  end
end

subj_update("Blake", "being terrible")
ap INCTR_LIST

# c. i. Create a method to add a new student to the schools student array. 
# ii. Then use it to add yourself to the school students array.

def add_student(stdnt_name, grade, semester, stdnt_hashlist = STDNT_LIST)
  stdnt_hashlist << {:name => stdnt_name, :grade => grade, :semester => semester}
end

add_student("Oliver", "A", "Summer")
ap STDNT_LIST

# d. i. Create a method that adds a new key at the top level of the school hash,
# given a key and a value. ii. Then use it to add a "Ranking" key with the value 1.

def add_key(key, value, hash)
  hash[key.to_sym] = value
end

add_key("Ranking", 1, school)
ap school

# 5. Object Orientation ******************************************************************************

# a. Create a bare bones class definition for a School class.

class School

  # b. Define an initialize method for the School class.

  def initialize(name, location, ranking, instructors)
    @students = []
    @name = name.to_sym
    @location = location.to_sym
    @ranking = ranking.to_sym
    @instructors = instructors
  end

  def get_info
    puts "School name: #{@name}"
    puts "Location: #{@location}"
    puts "Ranking: #{@ranking}"
    puts "Students:"
    puts @students
    puts "Instructors:"
    puts @instructors
  end
  # c. Create an attr_accessor for name, location, instructors, and students. Create an attr_reader for ranking.

  attr_accessor :name
  attr_accessor :location
  attr_accessor :instructors
  attr_accessor :students
  attr_reader :ranking

  # d. Create a method to set ranking, given a ranking value.

  def set_ranking(rank)
    @ranking = rank
  end

  # e. Create a method to add a student to the school, given a name, a grade, and a semester.
  # 6.b Refactor your School instance methods to treat Students as an array of objects instead of an array of hashes.

  def add_student(student)
    @students << student
  end

  # f. Create a method to remove a student from the school, given a name.

  def del_student(name)
    @students.each_with_index do |student_hash, index|
      if student_hash[:name] == name
        @students.delete_at(index)
      end
    end
  end

# h. Create a class method reset that will empty the SCHOOLS constant.

  def self.reset
    SCHOOL.clear
  end

  def find_student_obj(name)
    found_student = ""
    @students.each_with_index do |student, index|
      if student.name == name
        found_student = student
      end
    end
    found_student.name
  end

end

# flatiron = School.new("Flatiron School", "BK", "1", STDNT_LIST, INCTR_LIST)
# flatiron.get_info

# flatiron.add_student("Bob Dole", "A", "All Year")
# flatiron.get_info

# flatiron.del_student("Bob Dole")
# flatiron.get_info

# g. Create an array constant SCHOOLS that stores all instances of your School class.

SCHOOL = []

ObjectSpace.each_object(School) do |instance|
  SCHOOL.push instance
end

# hello = School.new("Poop", "BK", "1", STDNT_LIST, INCTR_LIST)
# hmmm = School.new("What?", "h", "1", STDNT_LIST, INCTR_LIST)
# sadfasd = School.new("adfasdf?", "h", "1", STDNT_LIST, INCTR_LIST)

# School.reset

# puts SCHOOL



#6. Classes

class Student < School

  attr_accessor :name
  attr_accessor :grade
  attr_accessor :semester

  def initialize(name, grade, semester)
    @name = name
    @grade = grade
    @semester = semester
  end
end

student_1 = Student.new("Bob Dole", "A", "Summer")
student_2 = Student.new("Jesus", "B", "Summer")

flatiron = School.new("Flatiron School", "BK", "1", INCTR_LIST)

flatiron.add_student(student_1)
flatiron.add_student(student_2)

puts flatiron.students

puts "***" * 25

bob_dole = flatiron.find_student_obj("Bob Dole")
puts bob_dole

# 7. Self

# ***************************************************************
# a.What should this Class print to the screen when defined/loaded?

  # class Student

  #   def self.say_hello
  #     puts "hello"
  #   end

  #   say_hello
  #   puts self

  # end

  # --> it would print "hello" and then on a new line Student
# ***************************************************************
  # b. What should this Class print to the screen when defined/loaded?

  # class Student

  #   def self.say_hello
  #     puts self
  #   end

  #   say_hello

  # end

  # --> it would print Student when say_hello is called upon being loaded. 
# ***************************************************************

  # c. What should this Class print to the screen when defined/loaded?

# class Student

#     def initialize
#       puts self
#     end

#     new

#   end

# --> this would create a new instance of the Student class and display the object id of that instance

# d. What should this code print to the screen when run?
 
 # class Student

 #    def say_hello
 #      puts self
 #    end

 #  end 

# --> by itself, it would print nothing. However, calling Student.new.say_hello would puts the object id 
# of the new instance you created by calling .new on Student. (e.g. <Student:0x007fc0ad806090>)

#e. What should this code print to the screen when run?

# class Student

#     def say_hello
#       puts say_goodbye
#     end

#     def say_goodbye
#       "goodbye"
#     end

#   end

# --> calling Students.new.say_hello should print "goodbye" to the screen, since the method say_goodbye 
# is called in the say_hello method
