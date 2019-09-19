json.extract! complaint, :id, :nome, :email, :numero_pedido, :cep, :descricao, :suspeito, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)
