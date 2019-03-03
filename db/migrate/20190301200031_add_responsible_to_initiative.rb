class AddResponsibleToInitiative < ActiveRecord::Migration[5.2]
  def change
    add_reference :initiatives, :responsible
  end
end
