class Answer < ActiveRecord::Base
  validates :option_id, presence: true
  validates :question_id, presence: true
  validates :visitor_cookie, presence: true

  belongs_to :option
 
end
