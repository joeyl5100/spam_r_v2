class Message < ApplicationRecord
    acts_as_taggable # Alias for acts_as_taggable_on :tags
def self.search(search)
      content_contains(search) + tagged_with(search)
end
 
 def self.content_contains(search)
     where("REPLACE (lower(content), ' ', '' ) like ?", "%#{search.downcase}%")
 end
end
