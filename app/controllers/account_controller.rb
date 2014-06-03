class AccountController < ApplicationController
  
  def index
  end
  
  def signin
    @user = User.new
    
    if request.post?
    @user = User.authenticate(params[:user][:email],params[:user][:password])
     if @user
     session[:user]=@user.id
   redirect_to :controller =>"gallery" , :action=>"index"
   
     else  
      flash[:notice] = "Invalid Username / Password"
          render :controller =>"account" , :action => "signin"
   
     end
    end

  end

 
  
   def logout
   session[:user] = nil
   session[:cart_id] = nil
   redirect_to :action=>"signin"
   end


  
  def signup
    @user = User.new
    
    if request.post?
      puts "=========================="
        puts user_params.inspect
			@user = User.new(user_params)
			
			if @user.save
				        Notification.signup_confirmation(@user).deliver

				redirect_to :controller =>"account" , :action=>"signin"
				
			else
				render :action=>"signup"
			end
    end
  end
  
  
  def contact
    
  end
  
  def pastryshop
    redirect_to :controller =>"gallery" , :action=>"index"
  end
  
  def services
    
  end
  
  def about
    
  end
  
  def forget_password
		if request.post?
			@user = User.find_by_email(params[:user][:email])
			if @user
			   new_password = random_password
			  
			   @user.update_attributes(:password=>new_password)
			   Notification.user_forget_password(@user.email,new_password).deliver
			   flash[:notice] = "A new password has been sent your email"
			   redirect_to :controller =>"account" , :action=>"signin"
			else
			   flash[:notice]="Invalid Email.Please enter correct email"
			   render :action=>"forget_password"
			end
		
		end
		
  end
	
	def random_password
	   (0...8).map{65.+(rand(25)).chr}.join
		
	end
	
	def reset_password
		@user = User.find(session[:user])
		
		if request.post?			
			if @user.valid?(params[:user])
			@user.update_attributes(:password=>params[:user][:password])
			puts params[:user][:password]
			flash[:notice] = "Your password has been reset"
			redirect_to :controller =>"account" , :action=>"index"
			
			else
				render :action=>"reset_password"
				
			end
		end
		
	end
  
  private

  def user_params
    params.require(:user).permit(:username,:email, :password, :password_confirmation, :password_hash,:password_salt)
  end
  
end
