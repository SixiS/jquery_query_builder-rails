require 'spec_helper'

describe JqueryQueryBuilder::Evaluators::Boolean::Operators::NotEqual do
  describe '#evaluate' do
    context 'left equals right' do
      it 'should return false' do
        expect(subject.evaluate(1.2, 1.2)).to eq(false)
      end
    end
    context 'left does not equal right' do
      it 'should return true' do
        expect(subject.evaluate(1.2, 1.5)).to eq(true)
      end
    end
  end
end

