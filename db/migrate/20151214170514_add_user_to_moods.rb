class AddUserToMoods < ActiveRecord::Migration
  def change
    add_reference :moods, :user, index: true
  end
end
