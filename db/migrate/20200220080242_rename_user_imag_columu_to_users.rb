class RenameUserImagColumuToUsers < ActiveRecord::Migration[5.2]
  def change
  	rename_column :users, :user_imag, :profile_image_id
  end
end
