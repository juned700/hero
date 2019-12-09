class ChangeColumnImageToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :image_file, :image_file_name
  end
end
