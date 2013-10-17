class AddParamsCriteriaToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :host_criterion, :string
    add_column :terms, :guest_criterion, :string
  end
end
