require 'spec_helper'

describe JqueryQueryBuilder::Evaluators::Boolean::Operators::IsNotEmpty do
  describe '#evaluate' do
    context 'input is empty' do
      it 'should return false' do
        expect(subject.evaluate("", nil)).to eq(false)
      end
    end
    context 'input is not empty' do
      it 'should return true' do
        expect(subject.evaluate(1.2, nil)).to eq(true)
      end
    end
  end
end

