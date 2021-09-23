require 'spec_helper'

describe JqueryQueryBuilder::Evaluators::Boolean::Operators::In do
  describe '#evaluate' do
    context 'left is in right' do
      it 'should return true' do
        expect(subject.evaluate(3, [1,2,3])).to eq(true)
      end
    end
    context 'left is not in right' do
      it 'should return false' do
        expect(subject.evaluate('bob', ['hah', 'whatever'])).to eq(false)
      end
    end
  end
end

