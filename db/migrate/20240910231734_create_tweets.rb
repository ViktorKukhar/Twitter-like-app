class CreateTweets < ActiveRecord::Migration[7.1]
  def change
    create_table :tweets do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :origin, null: true, foreign_key: { to_table: :tweets }

      t.timestamps
    end
  end
end
