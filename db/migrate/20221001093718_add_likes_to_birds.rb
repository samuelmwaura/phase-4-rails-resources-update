class AddLikesToBirds < ActiveRecord::Migration[6.1]
  def change
    add_column :birds, :likes, :integer, null: false, default:0
  end
end


#Rails db:reset - drops exisiting db, creates new and seed them.