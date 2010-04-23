# Existential
Fine grained authorization can't get any simpler than this.

# Example
    # specify the thoughtful class
    class User < ActiveRecord::Base
      is_existential
    end

    # allow_(action)_for? methods will get the user passed in
    class Post < ActiveRecord::Base
      def allows_edit_for?(user)
        if self.user_id == user.id
          true
        else
          false
        end
      end
    end

    # your thoughtful class will have a can? method that works like so
    class PostController < ActionController::Base
      def edit
        @post = Post.find(params[:id)
       	if current_user.can?(:edit, @post)
          # render the view          
        else
          # raise an exception, yell at the user, whatever
        end
      end
    end    



Copyright (c) 2010 Julio Capote, released under the MIT license