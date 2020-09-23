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
    end

    def create
      @piece = Piece.new(piece_params)
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
