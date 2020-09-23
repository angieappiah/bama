class StylesController < ApplicationController

    def index
        @style = Style.all
    end

    def new
       @style = Style.new
    end
  
    def create
       @style = Style.find_by_id(params[:id])
       @style = Style.new(style_params)
       if @style.save
         redirect_to style_path(@style)
       else
         render :new
     end
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
  
   def show
     @style = Style.find_by(id: params[:id])
     @style = Style.all
      
    end
  
   def delete
     @style = Style.find_by_id(params[:id])
  
     @style.destroy
  
      redirect_to styles_path
    end
  
  
    private
  
    def style_params
      params.require(:style).permit(:name, :method )
    end 
  
end
