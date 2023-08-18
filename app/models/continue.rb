class Continue < ApplicationRecord

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end


   def self.looks(search, word)
     if search == "perfect_match"
  　    @Continue = Continue.where("title LIKE?","#{word}")
     elsif search == "forward_match"
       @Continue = Continue.where("title LIKE?","#{word}%")
     elsif search == "backward_match"
       @Continue = Continue.where("title LIKE?","%#{word}")
     elsif search == "partial_match"
       @Continue = Continue.where("title LIKE?","%#{word}%")
     else
       @Continue = Copntinue.all
     end
   end

end
