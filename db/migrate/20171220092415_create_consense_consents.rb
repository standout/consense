class CreateConsenseConsents < ActiveRecord::Migration
  def change
    create_table :consense_consents do |t|
      t.references  :user, index: true, null: false
      t.string      :name, null: false
      t.date        :responded_at
      t.integer     :status, default: 0, null: false
    end
  end
end
