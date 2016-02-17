class Employee < ActiveRecord::Base
  scope :has_title, -> (title){ where "title LIKE ?", "%#{title}%" }
  # TODO make query more robust for edge cases e.g. a title coincidentally
  # contained inside another title like man within manager. As it stands
  # you could insert a blank string even and it would return everything.
end
