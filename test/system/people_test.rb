require "application_system_test_case"

class PeopleTest < ApplicationSystemTestCase
  setup do
    @person = people(:one)
  end

  test "visiting the index" do
    visit people_url
    assert_selector "h1", text: "Pessoas Cadastradas"
  end

  test "should create person" do
    visit people_url
    click_on "Cadastrar Nova Pessoa"

    fill_in "person_birth_date", with: @person.birth_date
    fill_in "person_cell_phone", with: @person.cell_phone
    select @person.gender, from: "person_gender"
    fill_in "person_last_name", with: @person.last_name
    fill_in "person_name", with: @person.name
    click_on "Cadastrar"

    assert_text "Pessoa Cadastrada com Sucesso"
    click_on "Voltar para Pessoas Cadastradas"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Editar esta Pessoa", match: :first

    fill_in "person_birth_date", with: @person.birth_date
    fill_in "person_cell_phone", with: @person.cell_phone
    select @person.gender, from: "person_gender"
    fill_in "person_last_name", with: @person.last_name
    fill_in "person_name", with: @person.name
    click_on "Editar"

    assert_text "Pessoa Atualizada com Sucesso"
    click_on "Voltar para Pessoas Cadastradas"
  end

  test "should destroy Person" do
    visit person_url(@person)
    click_on "Excluir esta Pessoa", match: :first

    assert_text "Pessoa Deletada com Sucesso"
  end
end
