class Course < ApplicationRecord
    has_one_attached :image

    belongs_to :user
    has_many :favorites ,dependent: :destroy
    has_many :comments ,dependent: :destroy
# def get_course_image
#  (image.attached?) ? image : "no_image.jpg"
# end
  
end