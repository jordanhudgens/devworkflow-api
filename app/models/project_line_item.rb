class ProjectLineItem < ApplicationRecord
  belongs_to :project

  has_many :check_list_items, dependent: :destroy

  accepts_nested_attributes_for :check_list_items,
                                allow_destroy: true,
                                reject_if: lambda { |attrs| attrs[:title].blank? }

  has_many_attached :item_images

  def item_images_raw=(images_data)
    images_data.each do |img_data|
      img_data.match(/(image\/[a-z]{3,4});base64,(.*)/) do |match|
        content_type = match[1]
        decoded_data = Base64.decode64(match[2])

        temp = Tempfile.open("item_image", encoding: "ascii-8bit")
        temp.write(decoded_data)
        temp.rewind
        self.item_images.attach(content_type: content_type, io: temp, filename: "item.png")
      end
    end
  end

  def img_urls
    if self.item_images.attached?
      self.item_images.map do |img|
        img.service_url
      end
    else
      []
    end
  end
end
