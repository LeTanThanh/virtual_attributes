class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :full_name, length: {minimum: 10}

  def full_name
    [first_name, last_name].join(" ")
  end

  def full_name=(name)
    first_name_and_last_name = name.split(" ")
    update_attributes first_name: first_name_and_last_name[0]
    update_attributes last_name: first_name_and_last_name[1]
  end
end
