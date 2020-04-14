class Cart
  attr_reader :items

  def initialize(items = [])
    @items = items
  end

  def add_item(item_id)
    found_item = items.find { |item| item.item_id == item_id } # 找到目前 Cart 物件裡面的 CartItem 是否有某個 ID。

    if found_item
      found_item.increment!
    else
      items << CartItem.new(item_id)
    end
  end

  def empty?
    @items.empty?
  end

  # def items
  #   @items
  # end

  def total
    result =  items.reduce(0) { |sum, item| sum + item.total}
    if Time.now.month == 4 && Time.now.day == 1
      # 4/1 全館打 1 折
      result = result * 0.1
    end

    return result

    # tmp = 0
    # @items.each do |item|
    #   tmp += item.total
    # end

    # return tmp
  end

  def self.from_hash(hash = nil)
    if hash && hash["items"]
      # items = []

      # hash["items"].each do |item|
      #   items << CartItem.new(item["item_id"], item["quantity"])
      # end

      items = hash["items"].map { |item|
        CartItem.new(item["item_id"], item["quantity"])
      }

      new items
    else
      new
    end
  end

  def to_hash
    items = []
    @items.each do |item|
      items << {"item_id" => item.item_id, 
                "quantity" => item.quantity}
    end

    # items = @items.map { |item| items << {"item_id" => item.item_id, "quantity" => item.quantity}}

    result = {"items" => items}
  end
end