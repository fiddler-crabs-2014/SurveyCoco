class Question < ActiveRecord::Base
  validates :content, presence: true, :length => { :minimum => 6, :message => "question must be at least 6 characters" }
  validates :survey_id, presence: true

  belongs_to :survey
  has_many :options
end
