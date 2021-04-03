class AgregarIndexATecnicos < ActiveRecord::Migration[6.1]
  def change
  	add_index :tecnicos, :dni
  end
end
