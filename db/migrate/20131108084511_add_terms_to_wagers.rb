class AddTermsToWagers < ActiveRecord::Migration
  def change
    add_column :wagers, :host_terms, :text
    add_column :wagers, :guest_terms, :text
    add_column :wagers, :status, :string
  end
end
