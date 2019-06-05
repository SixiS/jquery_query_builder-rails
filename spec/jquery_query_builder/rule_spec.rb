require 'spec_helper'

describe JqueryQueryBuilder::Rule do
  let(:decimal_rule){
    {
      'id' =>     "Decimal_Question",
      'field' =>  "Decimal_Question",
      'type' =>   "double",
      'input' =>  "text",
      'operator' => "equal",
      'value' =>  "1.2"
    }
  }

  describe '#new' do
    it 'should set the accessors and initialize' do
      rule = JqueryQueryBuilder::Rule.new(decimal_rule)
      expect(rule.id).to eq(decimal_rule['id'])
      expect(rule.field).to eq(decimal_rule['field'])
      expect(rule.type).to eq(decimal_rule['type'])
      expect(rule.input).to eq(decimal_rule['input'])
      expect(rule.operator).to eq(decimal_rule['operator'])
      expect(rule.value).to eq(decimal_rule['value'])
    end
  end

  describe '#get_operator' do
    it 'should get an operator based on type' do
      rule = JqueryQueryBuilder::Rule.new(decimal_rule)
      expect(rule.get_operator.class.to_s).to eq(JqueryQueryBuilder::Operators::Equal.to_s)
    end
  end

  describe '#get_input' do
    context 'input exists' do
      context 'base value' do
        it 'returns the input value from the object' do
          rule = JqueryQueryBuilder::Rule.new(decimal_rule)
          object = {'Decimal_Question' => '1.3'}
          expect(rule.get_input(object)).to eq(1.3)
        end
      end
      context 'nested value' do
        it 'returns the nested input value from the object' do
          rule = JqueryQueryBuilder::Rule.new(decimal_rule)
          rule.field = 'fields.Decimal_Question'
          object = {'fields' => {'Decimal_Question' => '1.3'}}
          expect(rule.get_input(object)).to eq(1.3)
        end
      end
      context 'array value' do
        it 'returns the array value from the object' do
          rule = JqueryQueryBuilder::Rule.new(decimal_rule)
          rule.field = 'fields.Decimal_Question'
          object = {'fields' => {'Decimal_Question' => ['1.3', '3.7']}}
          expect(rule.get_input(object)).to eq([1.3, 3.7])
        end
      end
      context 'nested value after array' do
        it 'returns the nested input value from the object using the first item in the array' do
          rule = JqueryQueryBuilder::Rule.new(decimal_rule)
          rule.field = 'fields.Decimal_Group.Decimal_Question'
          object = {'fields' => {'Decimal_Group' => [{'Decimal_Question' => '1.3'}, {'Decimal_Question' => '3.7'}]}}
          expect(rule.get_input(object)).to eq(1.3)
        end
      end
    end
    context 'input does not exist' do
      context 'base value' do
        it 'returns nil' do
          rule = JqueryQueryBuilder::Rule.new(decimal_rule)
          object = {}
          expect(rule.get_input(object)).to eq(nil)
        end
      end
      context 'nested value' do
        it 'returns nil' do
          rule = JqueryQueryBuilder::Rule.new(decimal_rule)
          rule.field = 'fields.Decimal_Question'
          object = {}
          expect(rule.get_input(object)).to eq(nil)
        end
      end
    end
  end

  describe '#get_value' do
    it 'returns the value typecasted based on its type' do
      rule = JqueryQueryBuilder::Rule.new(decimal_rule)
      expect(rule).to receive(:typecast_value).with('1.2').once
      rule.get_value
    end
  end

  describe '#typecast_value' do
    it 'returns the value typecasted based on its type' do
      rule = JqueryQueryBuilder::Rule.new(decimal_rule)
      expect(rule).to receive(:typecast_value).with('1.2').once
      rule.get_value
    end
  end

  describe '#evaluate' do
    it 'should evaluate using the operator with the input+value' do
      rule = JqueryQueryBuilder::Rule.new(decimal_rule)

      operator = JqueryQueryBuilder::Operators::Equal.new
      input = 1.2
      value = 1.2

      object = {'Decimal_Question' => input}

      expect(rule).to receive(:get_operator).and_return(operator)
      expect(rule).to receive(:get_input).with(object).and_return(input)
      expect(rule).to receive(:get_value).and_return(value)

      expect(rule.evaluate(object)).to eq(true)
    end
  end
end

