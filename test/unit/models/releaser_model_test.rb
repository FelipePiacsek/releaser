require_relative '../../test_helper'
require_relative '../../../lib/releaser/models/releaser_model'

class ReleaserModelTest < BaseReleaserTest

  def setup
    attrs_hash = {
      testing: EXPECTED_METHOD_RETURN_VALUE,
      should: { allow: { chained: { calls: EXPECTED_METHOD_RETURN_VALUE } } }
    }
    @releaser_model = ReleaserModel.new attrs_hash
  end

  test 'should allow attributes to be retrieved via []' do
    assert_equal @releaser_model[:testing], EXPECTED_METHOD_RETURN_VALUE
    assert_equal @releaser_model['testing'], EXPECTED_METHOD_RETURN_VALUE
  end

  test 'should allow attributes to be retrieved via method call' do
    assert_equal @releaser_model.testing, EXPECTED_METHOD_RETURN_VALUE
  end

  test 'should allow chained attributes to be retrieved via method call' do
    assert_equal @releaser_model.should.allow.chained.calls, EXPECTED_METHOD_RETURN_VALUE
  end

  test 'should raise NoMethodError when a method which does not correspond to an attribute is called' do
    assert_raises(NoMethodError) do
      @releaser_model.this_method_does_not_exist_on_attrs_hash!
    end
  end
end
