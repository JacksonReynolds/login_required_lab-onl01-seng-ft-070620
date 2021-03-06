class SessionsController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new; end

    def create
        if params[:name].nil? || params[:name].empty?
            redirect_to '/login'
        else
            session[:name] = params[:name]
            redirect_to '/welcome'
        end
    end

    def destroy
        session.delete :name if session[:name]
        redirect_to '/'
    end
end