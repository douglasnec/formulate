require 'test_helper'

class FieldsControllerTest < ActionController::TestCase
  setup do
    @field = fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create field" do
    assert_difference('Field.count') do
      post :create, field: { choice_id: @field.choice_id, descryption: @field.descryption, form_id: @field.form_id, formated: @field.formated, instruction: @field.instruction, lenght: @field.lenght, max: @field.max, min: @field.min, predefined: @field.predefined, value_unique: @field.value_unique, view: @field.view }
    end

    assert_redirected_to field_path(assigns(:field))
  end

  test "should show field" do
    get :show, id: @field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @field
    assert_response :success
  end

  test "should update field" do
    put :update, id: @field, field: { choice_id: @field.choice_id, descryption: @field.descryption, form_id: @field.form_id, formated: @field.formated, instruction: @field.instruction, lenght: @field.lenght, max: @field.max, min: @field.min, predefined: @field.predefined, value_unique: @field.value_unique, view: @field.view }
    assert_redirected_to field_path(assigns(:field))
  end

  test "should destroy field" do
    assert_difference('Field.count', -1) do
      delete :destroy, id: @field
    end

    assert_redirected_to fields_path
  end
end
