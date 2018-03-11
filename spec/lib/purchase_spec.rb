require 'spec_helper'
require 'spec_shared_examples_helper'
require_relative '../../lib/order'
require_relative '../../lib/purchase'
require_relative '../../lib/supplier_gateway'

describe Purchase do
  describe 'parse correct auth data (mock example)' do
    let!(:order) { Order.new }
    it 'should send purchase message to the gateway' do
      expect_any_instance_of(SupplierGateway).to receive(:purchase)
      expect(Purchase.new(order).make_purchase).to eq(true)
    end
  end

  describe 'parse correct auth data (stub example 1)' do
    let!(:order) {
      class OrderTest
        def code
          "AAA"
        end
      end
      OrderTest.new
    }
    it 'should send purchase message to the gateway' do
      expect_any_instance_of(SupplierGateway).to receive(:purchase)
      expect(Purchase.new(order).make_purchase).to eq(true)
    end
  end

  describe 'parse correct auth data (stub example 2)' do
    let!(:order) {
      double("OrderTest", :code => "AAA")
    }
    it 'should send purchase message to the gateway' do
      expect_any_instance_of(SupplierGateway).to receive(:purchase)
      expect(Purchase.new(order).make_purchase).to eq(true)
    end
  end

  describe 'parse correct auth data (stub example 3)' do
    let!(:order) { Order.new }
    before do
      allow(order).to receive(:code).and_return("AAA")
    end

    it 'should send purchase message to the gateway' do
      expect_any_instance_of(SupplierGateway).to receive(:purchase)
      expect(Purchase.new(order).make_purchase).to eq(true)
    end
  end

  describe 'parse correct auth data (stub example 4)' do
    let!(:shared_example_order) {
      double("OrderTest", :code => "AAA")
    }

    it_behaves_like 'order code example'

    it 'should send purchase message to the gateway' do
      expect_any_instance_of(SupplierGateway).to receive(:purchase)
      expect(Purchase.new(shared_example_order).make_purchase).to eq(true)
    end
  end
end
