ActiveAdmin.register Complaint do
  permit_params :suspeito
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :nome, :email, :numero_pedido, :cep, :descricao, :suspeito
  #
  # or
  #
  # permit_params do
  #   permitted = [:nome, :email, :numero_pedido, :cep, :descricao, :suspeito]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
