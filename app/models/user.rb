class User < ActiveRecord::Base
  has_many :work_experiences
  has_many :educations
  validates_presence_of :name, :tagline, :email, :summary, :education, :areas_of_speciality
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
