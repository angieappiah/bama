class DesignersController < ApplicationController
    #before_action :require_login, only: [:index]
    
    def index 
        if session[:user_id]
           designer =Designer.find(session[:designer_id])
            redirect_to designer_path(designer)
          else
            render :index
        end
    end

    def new
        @designer = Designer.new
    end

    def create
        flash[:notice] = "Make sure passwords match and/or email is correct."
        @designer = Designer.new(designer_params)
        return redirect_to new_designer_path unless @designer.save
        session[:designer_id] = @designer.id
        redirect_to designer_path(@designer)
    end

    def show
        @designer = Designer.find(params[:id])

    end

    private

    # def require_login
    #     return head(:forbidden) unless session.include? :user_id
    # end

    def designer_params
      params.require(:designer).permit(:username, :email, :location, :phone, :password, :password_confirmation)
    end
end
