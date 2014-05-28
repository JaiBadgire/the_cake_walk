class AdminController < ApplicationController
	layout "cakestores"
	

	def login
		if request.post?
			if params[:admin][:name]=="admin" && params[:admin][:password]=="nimda"
				session[:admin]="admin"
				redirect_to :controller=>"cakestores", :action=>"index"
			else
				flash[:notice]="Invalid Name/Password"
				render :controller=>"admin", :action=>"login"
			end
		end

	end
	def logout
		session[:admin]=nil
		flash[:notice]="Logged out"
		redirect_to :controller=>"admin", :action=>"login"
	end

end
