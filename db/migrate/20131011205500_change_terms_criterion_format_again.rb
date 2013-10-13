class ChangeTermsCriterionFormatAgain < ActiveRecord::Migration
  change_table :terms do |t|
    t.rename :criterion1, :criterion
  end
end
