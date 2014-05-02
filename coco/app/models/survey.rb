class Survey < ActiveRecord::Base
  validates :survey_name, presence: true, :length => { :minimum => 3, :message => "survey name must be at least 3 characters" }
  validates :user_id, presence: true

  belongs_to :user
  has_many :questions


end
