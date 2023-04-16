class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.integer :question_id, null: false
      t.integer :choice_id, null: false
      t.integer :user_id, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end
