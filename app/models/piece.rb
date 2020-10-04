class Piece < ApplicationRecord
    belongs_to :designer, required: false
    #belongs_to :style
    has_many :styles
    has_many :designers

end
