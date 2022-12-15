class Pig < ApplicationRecord
    validates :name, :breed, :habits, :image, presence: true
    validates :habits, length: { minimum: 10 }
end
