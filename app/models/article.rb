class Article < ApplicationRecord
    belongs_to :user
    has_many :article_categories #muitas categorias de artigos
    #muitas categorias pelas categorias de artigos
    has_many :categories, through: :article_categories
    has_many :reactions, dependent: :destroy
    validates :title, presence: true, length: { minimum: 3, maximum: 50 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
    validates :autor, presence: true, length: { minimum: 3, maximum: 40 }
    validates :user_id, presence: true

end
