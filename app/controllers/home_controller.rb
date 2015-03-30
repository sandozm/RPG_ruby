class HomeController < ApplicationController
  def index
    if session[:character]
      @character = Character.find_by id: session[:character]
    end
  end

  def login
  	if request.post?
  		@User_f = User.find_by username: params[:login]
  		if !@User_f.nil?
  			if @User_f.has_password?(params[:password])
  				session[:id] = @User_f[:id]
  				session[:username] = @User_f[:username]
  				session[:role] = @User_f[:role]
  				redirect_to({ :action=>'index' }, :notice => "Vous êtes maintenant connecté!")
  			else
  				redirect_to({ :action=>'login' }, :alert => "Nom d'utilisateur ou mot de passe incorrect!")
  			end
  		else
  			redirect_to({ :action=>'login' }, :alert => "Nom d'utilisateur ou mot de passe incorrect!")
  		end
  		#Rails.logger.debug(params[:password])
  			
  	end
  end

  def logout
  	session.clear
  	redirect_to({ :action=>'login' })
  end
end

