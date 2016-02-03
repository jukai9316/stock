if @orders.blank?
  json.result 1
else
  json.result 0
  json.orders(@orders) do |order|
    json.unique_id order.unique_id.to_s
    json.receive_name order.receive_name.to_s
    json.phone_num order.phone_num.to_s  
    json.state order.state.to_s
    json.created_at order.created_at.to_s
    json.delivery_time order.delivery_time.to_s
    json.complete_time order.complete_time.to_s
    if order.products.present?
      json.products(JSON.parse(order.products)) do |pro_hash|
        json.unique_id pro_hash["unique_id"]
        json.number pro_hash["number"]
        product = Product.find_by(unique_id:pro_hash["unique_id"])
        if product.present?
          json.product do 
            json.name product.name.to_s
            json.image Image.get_images(product).first.to_s
            json.unit if product.unit.present?? product.unit.name : ""
            json.stock_num product.stock_num.to_s
            json.price product.price.to_s
            json.old_price product.old_price.to_s
            json.detail_category_id product.detail_category_id.to_s
            json.hot_category_id product.hot_category_id.to_s
            json.sale_count product.sale_count.to_s
            json.spec product.spec.to_s
            json.unit_price product.unit_price.to_s
            json.origin product.origin
            json.remark product.remark
          end
        end
      end
    end

  end
end