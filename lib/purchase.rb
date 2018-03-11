class Purchase
  def initialize(order)
    @order = order
  end

  def make_purchase
    ref_number = @order.code + '_' + Time.now.to_i.to_s
    supplier_gateway.purchase(ref_number)
    true
  end

  private

  def supplier_gateway
    SupplierGateway.new
  end
end
