class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description, null: false
      t.belongs_to :question, null: false
      t.belongs_to :user, null: false

      t.timestamps
    end
  end
end
