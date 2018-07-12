class Comment < ActiveRecord::Base
    belongs_to :db
    belongs_to :user
end
