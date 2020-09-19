class Designer < ApplicationRecord
    has_many :styles
    has_many :pieces, through: :style
    has_secure_password

    validates :username, presence: true
    #validates :password, :confirmation => true
    validates :email, presence: true, uniqueness: true
    validates :phone, presence: true, uniqueness: true
end
