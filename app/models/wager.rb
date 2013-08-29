class Wager < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :host,  class_name: "User", foreign_key: "host_id"
  belongs_to :guest,  class_name: "User", foreign_key: "guest_id"  
  
  # attr_accessible :title, :body
end
