require 'spec_helper'

describe JqueryQueryBuilder::Evaluators::Boolean::Operators::IsNull do
  describe '#evaluate' do
    context 'input is null' do
      it 'should return true' do
        expect(subject.evaluate(nil, nil)).to eq(true)
      end
    end
    context 'input is not null' do
      it 'should return false' do
        expect(subject.evaluate("", nil)).to eq(false)
      end
    end
  end
end

