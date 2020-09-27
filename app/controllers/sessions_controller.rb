class SessionsController < ApplicationController

    def new
        @designer = Designer.new
    end

    def create

        if auth
            @designer = Designer.find_or_create_by(uid: auth['uid']) do |d|
              d.username = auth['info']['username']
              d.email = auth['info']['email']
              d.password = auth['uid']
            end
            session[:designer_id] = designer.id
            redirect_to designer_path(designer)
      
           else
            @designer = Designer.find_by(email: params[:designer][:email])
           
           if @designer && @designer.authenticate(params[:designer][:password])
             session[:designer_id] = @designer.id
             redirect_to designer_path(@designer)
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