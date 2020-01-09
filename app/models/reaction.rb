class Reaction < ApplicationRecord
	belongs_to :user
	belongs_to :article

	validates :mood, presence: true 

	validates :article_id, uniqueness: { scope: :user_id }

end