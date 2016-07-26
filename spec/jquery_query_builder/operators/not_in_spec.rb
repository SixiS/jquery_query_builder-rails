require 'spec_helper'

describe JqueryQueryBuilder::Operators::NotIn do
  describe '#evaluate' do
    context 'left is in right' do
      it 'should return false' do
        expect(subject.evaluate(3, [1,2,3])).to eq(false)
      end
    end
    context 'left is not in right' do
      it 'should return true' do
        expect(subject.evaluate('bob', ['hah', 'whatever'])).to eq(true)
      end
    end
  end
end

