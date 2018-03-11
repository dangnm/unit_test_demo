require 'spec_helper'
require_relative '../../lib/test'

describe Test do
    describe 'parse correct auth data' do
      it 'should work' do
        expect(Test.test).to eq("test")
      end
    end
end
