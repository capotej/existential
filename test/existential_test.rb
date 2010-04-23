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
    @fred = User.create(:name => "fred")
    @bob = User.create(:name => "bob")
    @post = Post.create(:name => "lolz", :user_id => @bob.id)
  end

  def test_post_authorization
    assert !@fred.can?(:edit, @post)
    assert @bob.can?(:edit, @post)
  end


end
