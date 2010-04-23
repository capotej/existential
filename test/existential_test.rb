require 'test/unit'
require 'test_helper'

class ExistentialTest < Test::Unit::TestCase
  load_schema
  
  class User < ActiveRecord::Base
  end

  class Post < ActiveRecord::Base
  end

  def test_schema_loaded_correctly
    assert_equal [], User.all
    assert_equal [], Post.all
  end


end
