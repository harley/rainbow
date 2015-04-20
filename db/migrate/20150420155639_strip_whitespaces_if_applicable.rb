class StripWhitespacesIfApplicable < ActiveRecord::Migration
  def up
    SchoolLevel.find_each(&:save)
    Subject.find_each(&:save)
    Category.find_each(&:save)
    Item.find_each(&:save)
    Member.find_each(&:save)
  end

  def down
  end
end
