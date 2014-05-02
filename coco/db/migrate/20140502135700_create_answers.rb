class CreateAnswers < ActiveRecord::Migration
    def change
      create_table :answers do |t|
      t.belongs_to :option
      t.integer :question_id
      t.integer :visitor_cookie

      t.timestamps
    end
  end
end
