class Post < ActiveRecord::Base

  converts_markdown :markdown, :body

end
