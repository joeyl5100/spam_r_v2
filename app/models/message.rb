class Message < ApplicationRecord
acts_as_taggable # Alias for acts_as_taggable_on :tags

  ransacker :created_at do
    Arel.sql('date(created_at)')
  end
end
