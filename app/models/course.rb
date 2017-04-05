class Course < ApplicationRecord
	has_many :user_courses
	has_many :course_contents
	has_many :users, through: :user_courses
	has_many :contents, through: :course_contents

end
