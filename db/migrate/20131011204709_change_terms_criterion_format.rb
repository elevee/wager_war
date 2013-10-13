class ChangeTermsCriterionFormat < ActiveRecord::Migration
  change_table :terms do |t|
    t.rename :criterion, :criterion1
  end
end
