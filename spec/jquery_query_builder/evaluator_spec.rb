require 'spec_helper'

describe JqueryQueryBuilder::Evaluator do
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
      expect(evaluator).to receive(:object_matches_rules?).with(a)
      expect(evaluator).to receive(:object_matches_rules?).with(b)
      expect(evaluator).to receive(:object_matches_rules?).with(c)
      evaluator.get_matching_objects([a,b,c])
    end
  end

  describe '#object_matches_rules' do
    it 'should create a new rule group and evaluate it' do
      rule_set = {}
      object_to_match = {}

      evaluator = JqueryQueryBuilder::Evaluator.new(rule_set)
      my_rule_group = JqueryQueryBuilder::RuleGroup.new(rule_set)
      expect(JqueryQueryBuilder::RuleGroup).to receive(:new).with(rule_set).and_return(my_rule_group)

      expect(my_rule_group).to receive(:evaluate).with(object_to_match).and_return({})

      evaluator.object_matches_rules?(object_to_match)
    end
  end
end
