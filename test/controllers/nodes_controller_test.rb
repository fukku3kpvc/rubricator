require 'test_helper'

class NodesControllerTest < ActionDispatch::IntegrationTest
  # INDEX
  # SHOULD
  test 'should get index' do
    get nodes_path
    assert_response :success
  end
  test 'should log in and get index' do
    sign_in(:user)
    get nodes_path
    assert_response :success
  end


  # SHOW
  # SHOULD
  test 'should build node and show it' do
    destroy_all_nodes
    create_node
    get node_path(Node.first.id)
    assert_response :success
  end
  test 'should build node log in and show it' do
    destroy_all_nodes
    create_node
    sign_in(:user)
    get node_path(Node.first.id)
    assert_response :success
  end


  # NEW
  # SHOULD
  test 'should get new node' do
    sign_in(:user)
    get new_node_path
    assert_response :success
  end
  # SHOULD NOT
  test 'should not get new node' do
    get new_node_path
    assert_redirected_to user_session_path
  end


  # CREATE
  # SHOULD
  test 'should log in and post new node' do
    destroy_all_nodes
    sign_in(:user)
    post nodes_path, params: { node: attributes_for(:node, :correct) }
    assert_redirected_to nodes_path
  end
  # SHOULD NOT
  test 'should not post new node' do
    destroy_all_nodes
    post nodes_path, params: { node: attributes_for(:node, :correct) }
    assert_redirected_to user_session_path
  end
  test 'should sign in and not post new node' do
    destroy_all_nodes
    sign_in(:user)
    assert_difference 'Node.count', 0 do
      post nodes_path, params: { node: attributes_for(:node, :wrong) }
    end
  end


  # EDIT
  # SHOULD
  test 'should get edit node' do
    sign_in(:user)
    get edit_node_path(Node.first.id)
    assert_response :success
  end
  # SHOULD NOT
  test 'should not get edit node' do
    get edit_node_path(Node.first.id)
    assert_redirected_to user_session_path
  end


  # UPDATE
  # SHOULD
  test 'should log in and patch node' do
    destroy_all_nodes
    sign_in(:user)
    create_node
    patch node_path(Node.first.id), params: { node: { title: 'Sample' * 5 } }
    assert_redirected_to nodes_path
    put node_path(Node.first.id), params: { node: { description: 'Lorem' } }
    assert_redirected_to nodes_path
  end
  # SHOULD NOT
  test 'should not patch node' do
    patch node_path(Node.first.id), params: { node: { title: 'Sample' * 5 } }
    assert_redirected_to user_session_path
    put node_path(Node.first.id), params: { node: { description: 'Lorem' } }
    assert_redirected_to user_session_path
  end
  test 'should log in and not patch node' do
    destroy_all_nodes
    sign_in(:user)
    create_node
    patch node_path(Node.first.id), params: { node: attributes_for(:node, :wrong) }
    assert_equal 'Sample Node', Node.first.title
    put node_path(Node.first.id), params: { node: attributes_for(:node, :wrong) }
    assert_equal 'Sample Node', Node.first.title
  end


  # DESTROY
  # SHOULD
  test 'should log in and delete node' do
    sign_in(:user)
    destroy_all_nodes
    create_node
    assert_difference 'Node.count', -1 do
      delete node_path(Node.first)
    end
  end
  # SOULD NOT
  test 'should not delete node' do
    delete node_path(Node.first)
    assert_redirected_to user_session_path
  end

  private

  def create_node
    FactoryBot.create(:node, :correct)
  end

  def destroy_all_nodes
    Node.destroy_all
  end
end
