class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
  	rename_column :clientes, :estado_mkt, :calificacion
  end
end
