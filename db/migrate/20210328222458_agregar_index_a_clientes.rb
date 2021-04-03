class AgregarIndexAClientes < ActiveRecord::Migration[6.1]
  def change
  	add_index :clientes, :cuit
  end
end
