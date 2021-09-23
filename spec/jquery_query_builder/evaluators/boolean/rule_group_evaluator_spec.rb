require 'spec_helper'

describe JqueryQueryBuilder::Evaluators::Boolean::RuleGroupEvaluator do
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

  describe '#evaluate' do
    context 'AND' do
      let(:rules){[decimal_rule, boolean_rule]}
      let(:evaluator){
        described_class.new(
          JqueryQueryBuilder::RuleGroup.new({
            'condition' => 'AND',
            'rules' => rules
          })
        )
      }
      it 'should returns true if all are true' do
        expect(evaluator.evaluate({"Decimal_Question" => 1.2, "Yes_No_Question" => true})).to eq true
      end
      it 'should return false if any are false' do
        expect(evaluator.evaluate({"Decimal_Question" => 1.2, "Yes_No_Question" => false})).to eq false
      end
    end

    context 'OR' do
      let(:rules){[decimal_rule, boolean_rule]}
      let(:evaluator){
        described_class.new(
          JqueryQueryBuilder::RuleGroup.new({
            'condition' => 'OR',
            'rules' => rules
          })
        )
      }
      it 'should returns true if any are true' do
        expect(evaluator.evaluate({"Decimal_Question" => 1.5, "Yes_No_Question" => true})).to eq true
      end
      it 'should return false if all are false' do
        expect(evaluator.evaluate({"Decimal_Question" => 1.0, "Yes_No_Question" => false})).to eq false
      end
    end
  end

  describe '#get_rule_evaluator' do
    context 'passed a rule' do
      it 'should return a rule object' do
        result = described_class.new(JqueryQueryBuilder::RuleGroup.new({})).get_rule_evaluator(decimal_rule)
        expect(result.is_a?(JqueryQueryBuilder::Evaluators::Boolean::RuleEvaluator)).to eq(true)
      end
    end
    context 'passed a rule group' do
      it 'should return a rule group' do
        result = described_class.new(JqueryQueryBuilder::RuleGroup.new({})).get_rule_evaluator(JqueryQueryBuilder::RuleGroup.new({'condition' => 'AND', 'rules' => [{}]}))
        expect(result.is_a?(JqueryQueryBuilder::Evaluators::Boolean::RuleGroupEvaluator)).to eq(true)
      end
    end
  end
end
