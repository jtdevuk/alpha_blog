class LinkUsersAndArticlesSecondAttempt < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :user_id, :int
  end
end
