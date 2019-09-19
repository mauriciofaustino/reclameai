class CreateComplaints < ActiveRecord::Migration[5.2]
  def change
    create_table :complaints do |t|
      t.string :nome
      t.string :email
      t.string :numero_pedido
      t.string :cep
      t.text :descricao
      t.boolean :suspeito

      t.timestamps
    end
  end
end
