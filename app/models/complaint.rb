class Complaint < ApplicationRecord
  validates :nome, :email, :numero_pedido, :cep, :descricao, presence: true
end
