require 'spec_helper'

describe JqueryQueryBuilder::RuleGroup do
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
  let(:boolean_rule){
    {
      "id" => "Yes_No_Question",
      "field" => "Yes_No_Question",
      "type" => "boolean",
      "input" => "select",
      "operator" => "equal",
      "value" => "true"
    }
  }

  describe '#new' do
    it 'should initialize a new rule group and get the conditions and rules' do
      decimal_rule_object = JqueryQueryBuilder::Rule.new(decimal_rule)
      expect(JqueryQueryBuilder::Rule).to receive(:new).with(decimal_rule).and_return(decimal_rule_object)
      evaluator = JqueryQueryBuilder::RuleGroup.new({
        'condition' => 'AND',
        'rules' => [decimal_rule]
      })
      expect(evaluator.condition).to eq('AND')
      expect(evaluator.rules).to eq([decimal_rule_object])
    end
  end

  describe '#get_rule_object' do
    context 'passed a rule' do
      it 'should return a rule object' do
        result = JqueryQueryBuilder::RuleGroup.new({}).get_rule_object(decimal_rule)
        expect(result.is_a?(JqueryQueryBuilder::Rule)).to eq(true)
      end
    end
    context 'passed a rule group' do
      it 'should return a rule group' do
        result = JqueryQueryBuilder::RuleGroup.new({}).get_rule_object({'condition' => 'AND', 'rules' => [{}]})
        expect(result.is_a?(JqueryQueryBuilder::RuleGroup)).to eq(true)
      end
    end
  end
end
