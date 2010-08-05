class User < ActiveRecord::Base
  has_many :work_experiences
  has_many :educations
  validates_presence_of :name, :tagline, :email, :summary, :education, :areas_of_speciality
  
  validates_format_of :email, :with => /^[A-Z0-9_\.%\+\-]+@(?:[A-Z0-9\-]+\.)+(?:[A-Z]{2,4}|museum|travel)$/i, :message => 'format is invalid', :allow_blank => true
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
