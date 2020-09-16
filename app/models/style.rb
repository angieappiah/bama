class Style < ApplicationRecord
    has_many :pieces
    has_many :designers, through: :pieces
end
