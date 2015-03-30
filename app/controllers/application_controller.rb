class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_filter :check_log, except: [:login]

	def check_log
		if !session[:id]
			redirect_to({ :controller=>'home' ,:action=>'login' })
		end
	end
end
