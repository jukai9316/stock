if @product.present?
  json.result 0
  json.product do
    json.unique_id @product.unique_id.to_s
    json.name @product.name.to_s
    json.desc @product.desc.to_s
    json.info @product.info.to_s
    json.images Image.get_images(@product).to_s
    json.unit @product.unit.present?? @product.unit.name.to_s : ""
    json.stock_num @product.stock_num.to_s
    json.price @product.price.to_s
    json.old_price @product.old_price.to_s
    json.detail_category_id @product.detail_category_id.to_s
    json.hot_category_id @product.hot_category_id.to_s
    json.sale_count @product.sale_count.to_s
    json.spec @product.spec.to_s
    json.unit_price @product.unit_price.to_s
    json.origin @product.origin
    json.remark @product.remark
    json.favorites @favorite.present? ? 0 : 1
    json.favorite_unique_id @favorite.present? ? @favorite.unique_id : ''
    json.minimum @product.minimum
    if @user
      cart_item = @product.cart_items.where(user_id: @user.id).first
      json.cart_item_unique_id cart_item.try(:unique_id).to_s
      json.number cart_item.try(:product_num).to_s
    end
  end
else
  json.result 1
end
