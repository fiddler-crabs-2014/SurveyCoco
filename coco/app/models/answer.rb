class Answer < ActiveRecord::Base
  validates :content, presence: true
  validates :option_id, presence: true
  validates :visitor_cookie, presence: true

  belongs_to :option
  belongs_to :question
end
