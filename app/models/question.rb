class Question < ActiveRecord::Base
belongs_to :user
# has_many :answers

validates :title, presence: true,  length: { minimum: 40 }
validates :body, presence: true,  length: { minimum: 150 }
end
