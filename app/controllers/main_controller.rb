class MainController < ApplicationController
    
    def login
        @show_error = params["show_error"]
    end
    
    def check_login
        puts params
        if params["account"] == "asd" and params["password"] == "asd"
            session[:name] = "admin"
            session[:is_admin] = true
            session[:is_login] = true
            redirect_to controller: 'main', action: 'index'    
        elsif params["account"] == "zxc" and params["password"] == "zxc"
            session[:name] = "employee"
            session[:is_admin] = false
            session[:is_login] = true
            redirect_to controller: 'main', action: 'index'    
        else
            redirect_to controller: 'main', action: 'login', show_error: true    
        end
    end
    
    def logout
        reset_session
        redirect_to controller: 'main', action: 'login'
    end
    
    def index
        @companies = Company.all
        @stockholders = Stockholder.all
    end

   
end
