class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.belongs_to :user, null: false
      t.string :category

      t.timestamps
    end
  end
end
