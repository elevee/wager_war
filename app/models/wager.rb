class Wager < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :host,  class_name: "User", foreign_key: "host_id"
  belongs_to :guest,  class_name: "User", foreign_key: "guest_id"  
  has_many :terms, :dependent => :destroy
  accepts_nested_attributes_for :terms, allow_destroy: true, :reject_if => lambda { |a| a[:terms].blank?  }

  attr_accessible :title, :description, :terms, :terms_attributes


end
