class AddColumnImageAndSpotToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :image_file, :string, default: 'placeholder_image.jpg'
    add_column :events, :spot, :intger
  end
end
