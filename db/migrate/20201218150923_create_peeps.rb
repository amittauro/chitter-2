class CreatePeeps < ActiveRecord::Migration[6.1]
  def change
    create_table :peeps do |t|
      t.belongs_to :user, foreign_key: true
      t.string :message
      t.datetime :time
      t.integer :tags, array: true
    end
  end
end
