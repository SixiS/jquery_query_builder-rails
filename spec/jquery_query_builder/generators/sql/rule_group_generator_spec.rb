require 'spec_helper'

describe JqueryQueryBuilder::Generators::SQL::RuleGroupGenerator do
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

  describe '#generate' do
    context 'AND' do
      let(:rules){[decimal_rule, boolean_rule]}
      let(:generator){
        described_class.new(
          JqueryQueryBuilder::RuleGroup.new({
            'condition' => 'AND',
            'rules' => rules
          })
        )
      }
      it 'should generate an AND sql statement' do
        expect(generator.generate).to eq "((Decimal_Question = 1.2) AND (Yes_No_Question = 't'))"
      end
    end

    context 'OR' do
      let(:rules){[decimal_rule, boolean_rule]}
      let(:generator){
        described_class.new(
          JqueryQueryBuilder::RuleGroup.new({
            'condition' => 'OR',
            'rules' => rules
          })
        )
      }
      it 'should generate an OR sql statement' do
        expect(generator.generate).to eq "((Decimal_Question = 1.2) OR (Yes_No_Question = 't'))"
      end
    end
  end

  describe '#get_rule_generator' do
    context 'passed a rule' do
      it 'should return a rule object' do
        result = described_class.new(JqueryQueryBuilder::RuleGroup.new({})).get_rule_generator(decimal_rule)
        expect(result.is_a?(JqueryQueryBuilder::Generators::SQL::RuleGenerator)).to eq(true)
      end
    end
    context 'passed a rule group' do
      it 'should return a rule group' do
        result = described_class.new(JqueryQueryBuilder::RuleGroup.new({})).get_rule_generator(JqueryQueryBuilder::RuleGroup.new({'condition' => 'AND', 'rules' => [{}]}))
        expect(result.is_a?(JqueryQueryBuilder::Generators::SQL::RuleGroupGenerator)).to eq(true)
      end
    end
  end
end
