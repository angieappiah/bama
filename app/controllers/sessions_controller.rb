class SessionsController < ApplicationController

    def new
        @designer = Designer.new
    end

    def create

        if auth
            designer = Designer.find_or_create_by(uid: auth['uid']) do |u|
              u.username = auth['info']['name']
              u.email = auth['info']['email']
              u.password = auth['uid']
            end
            session[:user_id] = user.id
            redirect_to users_path(user)
      
           else
            @designer = Designer.find_by(email: params[:username][:email])
           if @designer && @designer.authenticate(params[:username][:password])
             session[:user_id] = @user.id
             redirect_to users_path(@user)
           else
            render :new
           end
        end
        
    end

    def destroy
      session.clear
      redirect_to '/'
    end


    private

    def auth
      request.env['omniauth.auth']
    end


end