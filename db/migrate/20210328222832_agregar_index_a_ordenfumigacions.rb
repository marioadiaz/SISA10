class AgregarIndexAOrdenfumigacions < ActiveRecord::Migration[6.1]
  def change
  	add_index :orden_fumigacions, :nro_certificado
  end
end
