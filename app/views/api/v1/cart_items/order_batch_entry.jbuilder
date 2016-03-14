if @info == 'success'
  json.result 0
elsif @stock_num_result == 3
  json.result 3
  json.errmsg '产品库存不足'
else
  json.result 1
  if @order.blank?
    json.errmsg '无法获取订单信息'
  elsif @product.blank?
    json.errmsg '未找到该产品'
  else
    json.errmsg '添加购物车失败'
  end
end
