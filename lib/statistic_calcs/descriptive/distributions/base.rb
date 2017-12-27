# frozen_string_literal: true

require 'statistic_calcs/helpers/alias_attributes.rb'
require 'gsl'

module StatisticCalcs
  module Descriptive
    module Distributions
      class Base
        include StatisticCalcs::Helpers::AliasAttributes

        attr_accessor :mean, :variance, :standard_deviation, :median,
                      :skewness, :kurtosis, :coefficient_variation,
                      :cumulative_less_than_x_probability, :cumulative_greater_than_x_probability

        attr_alias :f_x, :cumulative_less_than_x_probability
        attr_alias :g_x, :cumulative_greater_than_x_probability
        attr_alias :mu, :mean
        attr_alias :sigma, :variance
        attr_alias :sd, :standard_deviation

        def initialize(args)
          args.each do |key, value|
            send("#{key}=", value) unless value.nil?
          end
        end

        def calc!
          self.coefficient_variation = variance || 0 / mean if mean&.positive?
          self.variance ||= standard_deviation**2 if standard_deviation
          self.standard_deviation ||= Math.sqrt(variance) if variance
          round_all!
          self
        end

        private

        # The probability density function end with the suffix _pdf
        def gsl_ran
          GSL::Ran
        end

        # The cumulative functions P(x) and Q(x) ends with the suffix _P and _Q respectively.
        # The inverse cumulative functions P^{-1}(x) and Q^{-1}(x) ends with the suffix _Pinv and _Qinv respectively.
        def gsl_cdf
          GSL::Cdf
        end

        def type
          discrete? ? :discrete : :continuous
        end

        def round_all!
          instance_variables.each do |key|
            value = instance_variable_get(key)
            instance_variable_set(key, value.round(StatisticCalcs::DECIMALS)) if value.is_a?(Float)
          end
        end
      end
    end
  end
end