class Event < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :category

  belongs_to :user

  has_many :massages
end
