class Subject < ActiveRecord::Base
  belongs_to :department
  
  has_many :teachings, dependent: :destroy
  has_many :lecturers, through: :teachings
end