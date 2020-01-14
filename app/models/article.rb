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

    def likes_count
        self.reactions.where(like: true).count
    end

    def dislikes_count
        self.reactions.where(like: false).count
    end

    def react_exists?(user)
        @reaction = self.reactions.find_by(user_id: user)
        return @reaction.present?
    end

    def check_like?(user)
        @reaction = self.reactions.find_by(user_id: user)
        return @reaction.like?
    end

end