class Category < ApplicationRecord
    validates :name, presence: true, lengh: { minimun: 3, maximum: 25 }
    validates_uniqueness_of :name

end