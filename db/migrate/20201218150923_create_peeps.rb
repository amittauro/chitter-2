class CreatePeeps < ActiveRecord::Migration[6.1]
  def change
    create_table :peeps do |t|
      t.belongs_to :user, foreign_key: true
      t.string :peep
      t.datetime :time
    end
  end
end
