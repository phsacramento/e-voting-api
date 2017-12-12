class CreateCandidates < ActiveRecord::Migration[5.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :last_name
      t.string :public_name
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
