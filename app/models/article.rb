class Article < ApplicationRecord
    validates :title, :description, :autor, presence: true

end
