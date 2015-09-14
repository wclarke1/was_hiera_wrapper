require 'spec_helper'
describe 'was_hiera_wrapper' do

  context 'with defaults for all parameters' do
    it { should contain_class('was_hiera_wrapper') }
  end
end
