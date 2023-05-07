class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.integer :admin_id, null: false
      # 画像投稿のため
      t.string :title, null: false
      t.timestamps
    end
  end
end
