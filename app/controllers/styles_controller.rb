class StylesController < ApplicationController
  before_action :require_login

    def index
        @styles = Style.all
    end

    def new
       @style = Style.new
    end
  
    def create
       @style = Style.new(style_params)
       if @style.save
         redirect_to style_path(@style)
       else
         render :new
     end
    end

    def show
      @style = Style.find_by(id: params[:id])
       
    end
  
    def edit
       @style = Style.find_by_id(params[:id])
    end
  
   def update
      @style = Style.find_by_id(params[:id])
 
      if @style.update(style_params)
        redirect_to @style
       else
         render :edit
      end
    end
  
  
    private

    def require_login  #a return guard (unless a session includes :designer_id , it returns an error 403 Forbidden)
      return head(:forbidden) unless session.include? :designer_id
   end
  
    def style_params
      params.require(:style).permit(:name, :method )
    end 
  
end
