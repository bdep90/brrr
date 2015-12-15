class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.boolean :hot, default: false
      t.boolean :warm, default: false
      t.boolean :cold, default: false

      t.timestamps
    end
  end
end
