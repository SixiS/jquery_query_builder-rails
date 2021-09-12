require 'spec_helper'

describe JqueryQueryBuilder::Evaluator do
  context 'Boolean (default)' do
    describe '#new' do
      context 'with an object' do
        it 'should initialize a new evaluator' do
          evaluator = JqueryQueryBuilder::Evaluator.new({})
        end
      end

      context 'with json' do
        it 'should initialize a new evaluator' do
          evaluator = JqueryQueryBuilder::Evaluator.new("{}")
        end
      end
    end

    describe '#get_matching_objects' do
      it 'should try match on each object' do
        evaluator = JqueryQueryBuilder::Evaluator.new({})
        a = {one: 1}
        b = {two: 2}
        c = {three: 3}
        expect(evaluator.evaluator).to receive(:object_matches_rules?).with(a).and_call_original
        expect(evaluator.evaluator).to receive(:object_matches_rules?).with(b).and_call_original
        expect(evaluator.evaluator).to receive(:object_matches_rules?).with(c).and_call_original
        result = evaluator.get_matching_objects([a,b,c])
        expect(result).to eq([])
      end
    end

    describe '#object_matches_rules' do
      it 'should create a new rule group and valuate it' do
        rule_set = {}
        object_to_match = {}

        my_rule_group = JqueryQueryBuilder::RuleGroup.new(rule_set)
        my_rule_group_evaluator = JqueryQueryBuilder::Evaluators::Boolean::RuleGroupEvaluator.new(my_rule_group)
        expect(JqueryQueryBuilder::RuleGroup).to receive(:new).with(rule_set).and_return(my_rule_group)
        expect(JqueryQueryBuilder::Evaluators::Boolean::RuleGroupEvaluator).to receive(:new).with(my_rule_group).and_return(my_rule_group_evaluator)

        evaluator = JqueryQueryBuilder::Evaluator.new(rule_set)
        expect(my_rule_group_evaluator).to receive(:evaluate).with(object_to_match)
        evaluator.object_matches_rules?(object_to_match)
      end
    end
  end
end
