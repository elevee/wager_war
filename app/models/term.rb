class Term < ActiveRecord::Base
  belongs_to :wager
  attr_accessible :title, :body, :criterion, :host_criterion, :guest_criterion, :terms_attributes

  # def save_terms(terms_array)
  #   terms_array.each do |term|
  #     Term.create(term)
  #   end
  # end

end
