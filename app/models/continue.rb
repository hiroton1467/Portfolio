class Continue < ApplicationRecord

  has_many :continue_times, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  
  validates :title, presence: true
  validates :post, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end


   def self.looks(search, word)
     if search == "perfect_match"
       where(title: word)
     elsif search == "partial_match"
       where("title LIKE ?","%#{word}%")
     else
       all
     end
   end

end
