# frozen_string_literal: true

# rspec ./spec/lib/statistic_calcs/distributions/fisher_snedecor_spec.rb
require 'statistic_calcs/distributions/fisher_snedecor'

# rubocop:disable BlockLength
RSpec.describe StatisticCalcs::Distributions::FisherSnedecor do
  subject { StatisticCalcs::Distributions::FisherSnedecor.new(options) }

  before { subject.calc! }
  describe 'calc to get f(x), p(x) & g(x)' do
    let(:options) { { d1: 45, d2: 36, x: 1.23 } }
    it 'should fill all the attributes' do
      expect(subject.x).to eq(1.23)
      expect(subject.f_x).to eq(0.73754)
      expect(subject.g_x).to eq(0.26246)
      expect(subject.mean).to eq(1.05882)
      expect(subject.variance).to eq(0.12301)
      expect(subject.standard_deviation).to eq(0.35073)
    end
  end

  describe 'calc to get f(x), p(x) & g(x)' do
    let(:options) { { d1: 45, d2: 36, f_x: 0.73754 } }
    it 'should fill all the attributes' do
      expect(subject.x).to eq(1.22999)
      expect(subject.f_x).to eq(0.73754)
      expect(subject.g_x).to eq(0.26246)
      expect(subject.mean).to eq(1.05882)
      expect(subject.variance).to eq(0.12301)
      expect(subject.standard_deviation).to eq(0.35073)
    end
  end

  describe 'calc to get f(x), p(x) & g(x)' do
    let(:options) { { d1: 45, d2: 36, g_x: 0.26246 } }
    it 'should fill all the attributes' do
      expect(subject.x).to eq(1.22999)
      expect(subject.f_x).to eq(0.73754)
      expect(subject.g_x).to eq(0.26246)
      expect(subject.mean).to eq(1.05882)
      expect(subject.variance).to eq(0.12301)
      expect(subject.standard_deviation).to eq(0.35073)
    end
  end

  describe 'calc to get f(x), p(x) & g(x)' do
    let(:options) { { d1: 3, d2: 44, x: 1.569 } }
    it 'should fill all the attributes' do
      expect(subject.x).to eq(1.569)
      expect(subject.f_x).to eq(0.78964)
      expect(subject.g_x).to eq(0.21036)
      expect(subject.mean).to eq(1.04762)
      expect(subject.variance).to eq(0.82313)
      expect(subject.standard_deviation).to eq(0.90726)
    end
  end

  describe 'calc to get f(x), p(x) & g(x)' do
    let(:options) { { d1: 3, d2: 44, f_x: 0.78964 } }
    it 'should fill all the attributes' do
      expect(subject.x).to eq(1.56899)
      expect(subject.f_x).to eq(0.78964)
      expect(subject.g_x).to eq(0.21036)
      expect(subject.mean).to eq(1.04762)
      expect(subject.variance).to eq(0.82313)
      expect(subject.standard_deviation).to eq(0.90726)
    end
  end

  describe 'calc to get f(x), p(x) & g(x)' do
    let(:options) { { d1: 3, d2: 44, g_x: 0.21036 } }
    it 'should fill all the attributes' do
      expect(subject.x).to eq(1.56899)
      expect(subject.f_x).to eq(0.78964)
      expect(subject.g_x).to eq(0.21036)
      expect(subject.mean).to eq(1.04762)
      expect(subject.variance).to eq(0.82313)
      expect(subject.standard_deviation).to eq(0.90726)
    end
  end

  describe 'calc to get f(x), p(x) & g(x)' do
    let(:options) { { d1: 40, d2: 2, f_x: 0.12158 } }
    it 'should fill all the attributes' do
      expect(subject.x).to eq(0.45001)
      expect(subject.f_x).to eq(0.12158)
      expect(subject.g_x).to eq(0.87842)
      expect(subject.mean).to eq(Float::INFINITY)
      expect(subject.variance).to eq(-Float::INFINITY)
    end
  end
end
# rubocop:enable BlockLength
