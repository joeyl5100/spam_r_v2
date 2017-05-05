class Message < ApplicationRecord
# This is for acts_as_taggable gem
acts_as_taggable # Alias for acts_as_taggable_on :tags

  ransacker :created_at do
    Arel.sql('date(created_at)')
  end
end
