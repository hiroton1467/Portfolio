class Comment < ApplicationRecord
  
   belongs_to :continue
   belongs_to :user
   
end
