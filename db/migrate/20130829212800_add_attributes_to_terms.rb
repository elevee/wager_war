class AddAttributesToTerms < ActiveRecord::Migration
  def change
    add_column :terms, :wager_id, :integer
    add_column :terms, :criterion, :string
  
  end
end
