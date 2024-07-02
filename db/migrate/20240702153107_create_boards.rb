class CreateBoards < ActiveRecord::Migration[7.1]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :assignee

      t.timestamps
    end
  end
end
