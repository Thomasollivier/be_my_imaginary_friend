class AddPhotoToPersonnalities < ActiveRecord::Migration[5.0]
  def change
    add_column :personnalities, :photo, :string
  end
end
