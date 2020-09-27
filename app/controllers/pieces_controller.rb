class PiecesController < ApplicationController
  def index
    if params [:style_id]
      @style_id = Style.find_by(id: params[:style_id])
    if @style.pieces.empty?
      flash[:alert] = "This style has no pieces. Please add one below."
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
      #@piece = Piece.find_by_id(params[:id])
      @piece = Piece.new(piece_params)
      @piece.style_id = style.id
      if @piece.save
        redirect_to piece_path(@piece)
      else
        render :new
      end
    end

    def edit
      @piece = Piece.find_by_id(params[:id])
    end

    def update
      @piece = Piece.find_by_id(params[:id])

      if @piece.update(piece_params)
        redirect_to @piece
      else
        render :edit
      end
    end

    def show
      @piece = Piece.find_by(id: params[:id])
      @style = Style.find(@piece.style_id)
      #@piece = Piece.all
    
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
