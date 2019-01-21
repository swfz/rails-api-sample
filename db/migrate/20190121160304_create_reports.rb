class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports, primary_key: ['id', 'date'] do |t|
      t.bigint :id, null: false, auto_increment: true
      t.date :date, null: false
      t.integer :hoge, null: true
      t.timestamps
    end
  end
end
