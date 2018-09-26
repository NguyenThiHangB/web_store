class Menu < ApplicationRecord
  enum status: [:On, :Off]

  validates_presence_of :name, message: I18n.t("admin.validates.presence.name")
  validates_length_of :name, maximum: Settings.maximum.name.length,
    message: I18n.t("admin.validates.presence.name")
  validates_uniqueness_of :name,
    message: I18n.t("admin.validates.uniqueness.name")
  validates_presence_of :link, message: I18n.t("admin.validates.presence.link")
  validates_presence_of :order,
    message: I18n.t("admin.validates.presence.order")
  validates_uniqueness_of :order,
    message: I18n.t("admin.validates.uniqueness.order")
  validates_presence_of :status,
    message: I18n.t("admin.validates.presence.status")

  scope :order_by, ->{order created_at: :desc}

  class << self
    def search key
      where("name LIKE ?", "%#{key}%")
    end
  end
end
