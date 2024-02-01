class UserMailer < ApplicationMailer
      
    def welcome_email(user)
      @user = user
          @url  = 'http://example.com/login'
      mail(to: @user.email, subject:'welcome to instagrame!')
    end 

end


# def welcome_email(user)
#   @user = user
#   mail(to: @user.email, subject: 'Welcome to BlogApp!')
# end

# class UserMailer < ApplicationMailer
#   default from: 'your_email@example.com'

#   def welcome_email(user)
#     @user = user
#     @url  = 'http://example.com/login'
#     mail(to: @user.email, subject: 'Welcome to My Awesome Site')
#   end
# end

