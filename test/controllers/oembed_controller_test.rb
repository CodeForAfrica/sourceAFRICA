require 'test_helper'

class OembedControllerTest < ActionController::TestCase
  
  tests ApiController

  def test_oembed_response
    get :oembed, :format => "json"
    assert_response :success
    assert_equal 'rich', json_body['type']
    assert_equal '1.0', json_body['version']
    assert_equal DC.server_root, json_body['provider_url']
  end

  def test_unsupport_format
    get :oembed, :format => "lol"
    assert_response 501
  end

end