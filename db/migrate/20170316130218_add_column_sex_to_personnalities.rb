class AddColumnSexToPersonnalities < ActiveRecord::Migration[5.0]
  def change
    add_column :personnalities, :sex, :string
    add_column :personnalities, :description, :text
  end
end
