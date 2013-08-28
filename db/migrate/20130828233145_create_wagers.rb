class CreateWagers < ActiveRecord::Migration
  def change
    create_table :wagers do |t|

      t.timestamps
    end
  end
end
