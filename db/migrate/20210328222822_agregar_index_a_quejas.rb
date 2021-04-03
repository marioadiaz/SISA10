class AgregarIndexAQuejas < ActiveRecord::Migration[6.1]
  def change
  	add_index :quejas, :nro_queja
  end
end
