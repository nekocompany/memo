class CreateMemorandums < ActiveRecord::Migration[5.0]
  def change
    create_table :memorandums do |t|
      t.string :content

      t.timestamps
    end
  end
end
