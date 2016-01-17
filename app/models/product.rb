class Product < ActiveRecord::Base
  belongs_to :sub_category
  belongs_to :hot_category
  has_many :images, as: :target
  belongs_to :unit
  has_many :adverts
  belongs_to :detail_category
end
