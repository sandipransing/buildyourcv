class User < ActiveRecord::Base
  has_many :work_experiences
  has_many :educations
end
