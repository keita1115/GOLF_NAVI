class Course < ApplicationRecord
    has_one_attached :image

    belongs_to :user, optional: true
    belongs_to :genre, optional: true
    has_many :favorites ,dependent: :destroy
# def get_course_image
#  (image.attached?) ? image : "no_image.jpg"
# end

def favorites?(user)
   favorites.where(user_id: user.id).exists?
end

end