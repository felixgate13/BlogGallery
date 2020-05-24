class ApplicationController < ActionController::Base
    def application
        @categories = Category.all()
    end
end
