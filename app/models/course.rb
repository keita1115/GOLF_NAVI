class Course < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :address, presence: true
  validates :body, presence: true

  belongs_to :user, optional: true
  belongs_to :genre, optional: true
  has_many :favorites ,dependent: :destroy
  has_many :comments, dependent: :destroy

  def favorites?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(keyword)
    where(["title like? OR body like? OR address like? OR score like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end

end