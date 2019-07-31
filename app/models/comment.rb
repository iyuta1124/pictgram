class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  
  def content
  end
    
end
