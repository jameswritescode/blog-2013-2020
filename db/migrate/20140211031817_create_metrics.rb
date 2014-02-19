class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string     :name
      t.string     :ip
      t.string     :referer
      t.references :post

      t.timestamps
    end
  end
end
