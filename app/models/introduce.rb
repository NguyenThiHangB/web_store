class Introduce < ApplicationRecord
  validates_presence_of :name, message: I18n.t("admin.validates.presence.name")
  validates_length_of :name, maximum: Settings.maximum.name.length,
    message: I18n.t("admin.validates.length.name")
  validates_uniqueness_of :name,
    message: I18n.t("admin.validates.uniqueness.name")
  validates_presence_of :image,
    message: I18n.t("admin.validates.presence.image")
  validate :image_size
  validates_presence_of :description,
    message: I18n.t("admin.validates.presence.description")

  mount_uploader :image, ImageUploader

  scope :order_by, ->{order created_at: :desc}

  class << self
    def search key
      where("name LIKE ? OR description LIKE ?", "%#{key}%", "%#{key}%")
    end
  end

  private

  def image_size
    if image.size > Settings.maximum.image.size.megabytes
      errors.add :image, I18n.t("admin.image_size.max")
    end
  end
end
