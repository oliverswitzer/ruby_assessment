
# oliverSwitzer_assessment.rb
require 'rubygems'
gem 'awesome_print'
require 'awesome_print'

# 1. Arrays

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

# # 3. Nested Structures

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
# b. Add a student to the school's students' array.
school[:students] << {:name => "Bob", :grade => "C"}
ap school
# c. Remove "Billy" from the students' array.
school[:students].delete_at(1)
ap school
# d. Add a key to every student in the students array called "semester" and assign it the value "Summer".
school[:students].each {|student_hash| student_hash[:semester] = "Summer"}
ap school
# e. Change Ashley's subject to "being almost better than Blake"
school[:instructors][1][:subject] = "being almost better than Blake"
ap school
# f. Change Frank's grade from "A" to "F".
school[:students][2][:grade] = "F"
ap school



