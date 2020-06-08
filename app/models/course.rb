class Course < ApplicationRecord
    validates :name, presence: true, length: { minimum: 5, maximum: 50 }
    validates :short_name, presence: true, length: { minimum: 3, maximum: 15 }, uniqueness: true
    validates :description, presence: true, length: { minimum: 10, maximum: 500 } 
end