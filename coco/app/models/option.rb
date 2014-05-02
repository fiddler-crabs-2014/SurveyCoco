class Option < ActiveRecord::Base
  validates :content, presence: true
  validates :question_id, presence: true

  belongs_to :question
  has_many :answers
end
