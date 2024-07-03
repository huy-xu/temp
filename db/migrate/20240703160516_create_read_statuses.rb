class CreateReadStatuses < ActiveRecord::Migration[7.1]
  def change
    create_table :read_statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.boolean :read

      t.timestamps
    end
  end
end
