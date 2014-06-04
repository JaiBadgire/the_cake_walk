class Notification < ActionMailer::Base
  default from: "info@cakedelights.com"
  
  def user_forget_password(email,password_generated)
	@password = password_generated
	mail(:to=>"jbadgire27@gmail.com",:subject=>"Your Temporary Password")
	  
  end
  
  def signup_confirmation(user)
        @user = user
        mail(:to =>"jbadgire27@gmail.com", :subject => "Welcome to CakeDelight")
  end

  def user_reset_password(user)
        @user = user
        mail(:to =>"jbadgire27@gmail.com", :subject => "Your password has been reset")
  end
  
  def purchase_complete(user,cart)
      @user = user
      @cart=cart
      mail(:to =>"jbadgire27@gmail.com", :subject => "Your order has been processed!")
  end
  
  
  
end
