class PiecesController < ApplicationController


  def index
    @piece = Piece.new
    if params[:style_id]
      @style = Style.find_by(id: params[:style_id])
      if @style.pieces.empty?
        redirect_to new_style_piece_path(@style)
      else
        @pieces = @style.pieces
      end
     else
    @pieces = Piece.all
    end
  end


    def new
      @piece = Piece.new
    end


    def create
      style = Style.find(params[:piece][:style_id].to_i)
      @piece = Piece.new(piece_params)
      @piece.style_id = style.id
      # @piece.style_id = style.id
      
      if @piece.save
        redirect_to piece_path(@piece)
      else
        render :new
      end
    end

    def show
      @pieces = Piece.all
        #@designer = Designer.find(params[:id])
        #@style = Style.find(@piece.style_id)
    end


    def delete
      @piece = Piece.find_by_id(params[:id])

      @piece.destroy

      redirect_to pieces_path
    end


  private

  def piece_params
    params.require(:piece).permit(:medium, :image, :size, :comment, :designer_id, :style_id, style_attributes: %[ name method])
  end 
end
