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

    fill_in "Birth date", with: @person.birth_date
    fill_in "Cell phone", with: @person.cell_phone
    fill_in "Gender", with: @person.gender
    fill_in "Last name", with: @person.last_name
    fill_in "Name", with: @person.name
    click_on "Cadastrar"

    assert_text "Person was successfully created"
    click_on "Voltar para Pessoas Cadastradas"
  end

  test "should update Person" do
    visit person_url(@person)
    click_on "Editar esta Pessoa", match: :first

    fill_in "Birth date", with: @person.birth_date
    fill_in "Cell phone", with: @person.cell_phone
    fill_in "Gender", with: @person.gender
    fill_in "Last name", with: @person.last_name
    fill_in "Name", with: @person.name
    click_on "Editar"

    assert_text "Person was successfully updated"
    click_on "Voltar para Pessoas Cadastradas"
  end

  test "should destroy Person" do
    visit person_url(@person)
    click_on "Excluir esta Pessoa", match: :first

    assert_text "Person was successfully destroyed"
  end
end
