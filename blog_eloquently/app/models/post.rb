class Post < ActiveRecord::Base
    has_many :comments
    has_and_belongs_to_many :tags

    validates_presence_of :content
end
