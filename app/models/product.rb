class Product < ApplicationRecord
  belongs_to :group_product

  enum status: [:On, :Off]

  validates_presence_of :name, message: I18n.t("admin.validates.presence.name")
  validates_length_of :name, maximum: Settings.maximum.name.length,
    message: I18n.t("admin.validates.length.name")
  validates_uniqueness_of :name,
    message: I18n.t("admin.validates.uniqueness.name")
  validates_presence_of :image,
    message: I18n.t("admin.validates.presence.image")
  validates_presence_of :summary,
    message: I18n.t("admin.validates.presence.summary")
  validates_presence_of :price,
    message: I18n.t("admin.validates.presence.price")
  validates_presence_of :price_discount,
    message: I18n.t("admin.validates.presence.price_discount")
  validates_presence_of :status,
    message: I18n.t("admin.validates.presence.status")
  validates_presence_of :group_product_id,
    message: I18n.t("admin.validates.presence.group_product_id")
  validate :image_size

  mount_uploader :image, ImageUploader

  scope :order_by, ->{order created_at: :desc}

  private

  def image_size
    if image.size > Settings.maximum.image.size.megabytes
      errors.add :image, I18n.t("admin.image_size.max")
    end
  end
end
