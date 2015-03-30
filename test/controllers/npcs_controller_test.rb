require 'test_helper'

class NpcsControllerTest < ActionController::TestCase
  setup do
    @npc = npcs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:npcs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create npc" do
    assert_difference('Npc.count') do
      post :create, npc: { atk: @npc.atk, def: @npc.def, level: @npc.level, name: @npc.name, pv: @npc.pv }
    end

    assert_redirected_to npc_path(assigns(:npc))
  end

  test "should show npc" do
    get :show, id: @npc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @npc
    assert_response :success
  end

  test "should update npc" do
    patch :update, id: @npc, npc: { atk: @npc.atk, def: @npc.def, level: @npc.level, name: @npc.name, pv: @npc.pv }
    assert_redirected_to npc_path(assigns(:npc))
  end

  test "should destroy npc" do
    assert_difference('Npc.count', -1) do
      delete :destroy, id: @npc
    end

    assert_redirected_to npcs_path
  end
end
