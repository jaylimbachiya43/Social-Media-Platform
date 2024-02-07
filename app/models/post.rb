class Post < ApplicationRecord
  belongs_to :user 
  has_many :likes, dependent: :destroy
  has_many :comments , dependent: :destroy

# post.rb
# class Post
#   attr_reader :content, :likes

#   def initialize(content)
#     @content = content
#     @likes = []
#   end

#   def like(user)
#     @likes << user
#     puts "#{user.name} liked your post!"
#   end

#   def display_likes
#     puts "Liked by: #{likes.map { |user| user.name }.join(', ')}"
#   end
# end

# class  Comment
#   attr_reader :content, :comment  
#   def initialize(content)
#     @comments = []
#   end
  
#   def comment(user)
#     @comments << user 
#       puts "#{user.name} like youre post"
#   end
  
#   def display_comments
#     puts "c"
#   end
#   end

end