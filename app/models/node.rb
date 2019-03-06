class Node < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_ancestry
end
