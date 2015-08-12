class AddAgeToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :age, :integer, :default => 0
  end
end
