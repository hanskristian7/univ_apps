class SessionsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    
    def new
        
    end

    def create
        @student = Student.find_by(email: params[:sessions][:email])
        if @student && @student.authenticate(params[:sessions][:password])
            flash[:notice] = "Successfully Login!"
            session[:student_id] = @student.id
            redirect_to @student
        else
            flash.now[:notice] = "Login Failed!"
            render 'new'
        end
    end

    def destroy
        # render json: session[:student_id]
        session[:student_id] = nil
        flash[:notice] = "You have logged out!"
        redirect_to root_path
    end
end