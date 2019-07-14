class Post < ApplicationRecord
    extend FriendlyId
    friendly_id :title, use: :slugged

    belongs_to :user
    has_many :comment
    has_many :like

    validates_presence_of :title, :link
end
