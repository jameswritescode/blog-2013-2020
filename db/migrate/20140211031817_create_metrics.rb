class CreateMetrics < ActiveRecord::Migration
  def change
    create_table :metrics do |t|
      t.string     :name
      t.string     :ip
      t.references :post

      t.timestamps
    end
  end
end
