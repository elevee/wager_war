class CreateWagers < ActiveRecord::Migration
  def change
    create_table :wagers do |t|
      t.integer :host_id
      t.integer :guest_id
      t.string :title
      t.text   :description
      t.integer :deadline

      t.timestamps
    end
  end
end
