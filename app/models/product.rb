class Product < ActiveRecord::Base
  belongs_to :provider
  belongs_to :category
  belongs_to :store
  belongs_to :description
end
