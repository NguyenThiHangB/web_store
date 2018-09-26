class Menu < ApplicationRecord
  enum status: [:On, :Off]

  validates_presence_of :name, message: "Name can't be blank."
  validates_length_of :name, maximum: Settings.introduce.name.length,
    message: "Name may not be greater than 50 character."
  validates_presence_of :link, message: "Link can't be blank."
  validates_presence_of :order, message: "Order can't be blank."
  validates_presence_of :status, message: "Status can't be blank."

  scope :order_by, ->{order created_at: :desc}

  class << self
    def search key
      where("name LIKE ?", "%#{key}%")
    end
  end
end
