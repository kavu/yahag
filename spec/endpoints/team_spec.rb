# encoding: utf-8

require 'spec_helper'

describe 'Yahag' do
  describe 'Team' do
    subject { Yahag::Team }
    it { should be_a Class }
    its(:ancestors) { should include Yahag::Endpoint }
  end
end
