class CreateUserWager < ActiveRecord::Migration
  def change
    create_table :users_wagers do |t|
      t.belongs_to :user
      t.belongs_to :wager
    end
  end
end
