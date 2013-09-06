class Wager < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :host,  class_name: "User", foreign_key: "host_id"
  belongs_to :guest,  class_name: "User", foreign_key: "guest_id"  
  has_many :terms
  # accepts_nested_attributes_for :terms

  attr_accessible :title, :description
end
