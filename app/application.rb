class Application

    # @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last

      the_item = Item.all.find{|i|i.name == item_name}

    #   if item =@@items.find{|i| i.name == item_name}
    if the_item != nil
        resp.write the_item.price
      else 
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status=404
      resp.write "Route not found"
    end
    resp.finish
  end

end