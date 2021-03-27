class Role < ApplicationRecord
  belongs_to :user
  has_many :permissions

  def admin?
    self.name.eql?('admin')
  end
end
