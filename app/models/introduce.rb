class Introduce < ApplicationRecord
  validates_presence_of :name, message: "Name can't be blank."
  validates_length_of :name, maximum: Settings.introduce.name.length,
    message: "Name may not be greater than 50 character."
  validates_presence_of :image, message: "Image can't be blank."
  validate :image_size
  validates_presence_of :description, message: "Description can't be blank."

  mount_uploader :image, ImageUploader

  scope :order_by, ->{order created_at: :desc}

  class << self
    def search key
      where("name LIKE ? OR description LIKE ?", "%#{key}%", "%#{key}%")
    end
  end

  private

  def image_size
    if image.size > Settings.introduce.image.size.megabytes
      errors.add :image, I18n.t("admin.image_size.max")
    end
  end
end
