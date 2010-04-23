require 'test/unit'
require 'test_helper'

class ExistentialTest < Test::Unit::TestCase
  load_schema
  
  class User < ActiveRecord::Base
    is_existential
  end

  class Post < ActiveRecord::Base
    def allows_edit_for?(user)
      if self.user_id == user.id
        true
      else
        false
      end
    end
  end
  
  def setup
    User.destroy_all
    Post.destroy_all
    @user = User.create(:name => "fred")
    @other_guy = User.create(:name => "bob")
    @post = Post.create(:name => "lolz", :user_id => @user.id)
  end

  def test_schema_loaded_correctly
    assert_equal 2, User.all.length
    assert_equal 1, Post.all.length
  end

  def test_post_authorization
    assert_false @fred.can?(:edit, @post)
    assert @bob.can?(:edit, @post)
  end


end
