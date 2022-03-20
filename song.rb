class Song < ApplicationRecord
    has_many :reviews
    has_many :super_fans, through: :reviews

    has_many :my_fans, class_name: "SuperFan"
end
