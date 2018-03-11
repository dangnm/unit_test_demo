shared_examples_for 'order code example' do
  it "has correct format" do
    expect(shared_example_order.respond_to?(:code)).to eq(true)
    expect(shared_example_order.code.class).to eq(String)
  end
end
