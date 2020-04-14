class Cart
  def initialize
    @items = []
  end

  def add_item(item_id)
    found_item = @items.find { |item| item.item_id == item_id } # 找到目前 Cart 物件裡面的 CartItem 是否有某個 ID。

    if found_item
      found_item.increment!
    else
      @items << CartItem.new(item_id)
    end
  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end

  def total
    @items.reduce(0) { |sum, item| sum + item.total}
    
    # tmp = 0
    # @items.each do |item|
    #   tmp += item.total
    # end

    # return tmp
  end
end