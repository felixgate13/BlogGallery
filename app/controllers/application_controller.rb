class ApplicationController < ActionController::Base
    protect_from_forgery
    before_action :get_categories, :authorized

    helper_method :admin_user
    helper_method :logged_in_admin?
    
    def get_categories
        @categories = Category.all()
    end
    
    def admin_user        
        User.find_by(id: session[:user_id])
    end

    def logged_in_admin?
        !admin_user.nil?
    end

    def authorized
        redirect_to '/welcome' unless logged_in_admin?
    end
end
