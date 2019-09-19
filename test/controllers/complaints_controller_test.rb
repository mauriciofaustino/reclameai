require 'test_helper'

class ComplaintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @complaint = complaints(:one)
  end

  test "should get index" do
    get complaints_url
    assert_response :success
  end

  test "should get new" do
    get new_complaint_url
    assert_response :success
  end

  test "should create complaint" do
    assert_difference('Complaint.count') do
      post complaints_url, params: { complaint: { cep: @complaint.cep, descricao: @complaint.descricao, email: @complaint.email, nome: @complaint.nome, numero_pedido: @complaint.numero_pedido, suspeito: @complaint.suspeito } }
    end

    assert_redirected_to complaint_url(Complaint.last)
  end

  test "should show complaint" do
    get complaint_url(@complaint)
    assert_response :success
  end

  test "should get edit" do
    get edit_complaint_url(@complaint)
    assert_response :success
  end

  test "should update complaint" do
    patch complaint_url(@complaint), params: { complaint: { cep: @complaint.cep, descricao: @complaint.descricao, email: @complaint.email, nome: @complaint.nome, numero_pedido: @complaint.numero_pedido, suspeito: @complaint.suspeito } }
    assert_redirected_to complaint_url(@complaint)
  end

  test "should destroy complaint" do
    assert_difference('Complaint.count', -1) do
      delete complaint_url(@complaint)
    end

    assert_redirected_to complaints_url
  end
end
