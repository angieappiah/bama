class PiecesController < ApplicationController


  def index
    @piece = Piece.new
    if params[:piece]
      @piece = piece.find_by(id: params[:id])
      if @pieces.empty?
        redirect_to new_piece_path(@piece)
      else
        @pieces = @style.pieces
      end
     else
    @pieces = Piece.all
    end
  end


    def new
      @piece = Piece.new
      @style = Style.find_by(id: params[:style_id])
    end


    def create
      style = Style.find(params[:piece][:style_id].to_i)
      @piece = Piece.new(piece_params)
      # @piece.style_id = style.id
      
      if @piece.save
        redirect_to piece_path(@piece)
      else
        render :new
      end
    end

    def show
     #@piece = Piece.find_by(id: params[:id])
     @piece = Piece.all
      #@style = Style.find(@piece.style_id) 
    end


    def delete
      @piece = Piece.find_by_id(params[:id])

      @piece.destroy

      redirect_to pieces_path
    end


  private

  def piece_params
    params.require(:piece).permit(:medium, :image, :size, :comment, :designer_id, :style_id)
  end 
end
