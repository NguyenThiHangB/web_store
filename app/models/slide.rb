class Slide < ApplicationRecord
  validates_presence_of :name, message: I18n.t("admin.validates.presence.name")
  validates_length_of :name, maximum: Settings.maximum.name.length,
    message: I18n.t("admin.validates.length.name")
  validates_uniqueness_of :name,
    message: I18n.t("admin.validates.uniqueness.name")
  validates_presence_of :image,
    message: I18n.t("admin.validates.presence.image")
  validates_presence_of :content,
    message: I18n.t("admin.validates.presence.content")
  validates_length_of :content, maximum: Settings.slide.content.length,
    message: I18n.t("admin.validates.length.content")
  validates_presence_of :link, message: I18n.t("admin.validates.presence.link")
  validate :image_size

  mount_uploader :image, ImageUploader

  scope :order_by, ->{order created_at: :desc}

  class << self
    def search key
       where("name LIKE ? OR content LIKE ?", "%#{key}%", "%#{key}%")
    end
  end

  private

  def image_size
    if image.size > Settings.maximum.image.size.megabytes
      errors.add :image, I18n.t("admin.image_size.max")
    end
  end
end
