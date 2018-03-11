require 'spec_helper'
require 'spec_shared_examples_helper'
require_relative '../../lib/order'
require_relative '../../lib/purchase'
require_relative '../../lib/supplier_gateway'

describe Order do
  describe '#code' do
    let!(:order) { Order.new }
    it 'returns in correct format' do
      expect(order.respond_to?(:code)).to eq(true)
      expect(order.code.class).to eq(String)
    end
  end

  # describe '#code' do
  #   let!(:shared_example_order) { Order.new }
  #   it_behaves_like 'order code example'
  # end
end
