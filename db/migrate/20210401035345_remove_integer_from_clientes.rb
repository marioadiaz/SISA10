class RemoveIntegerFromClientes < ActiveRecord::Migration[6.1]
  def change
    remove_column :clientes, :integer, :string
  end
end
