# frozen_string_literal: true

require 'English'
require 'benchmark'

module RubocopTravis
  class << self
    def run
      run_main_task
      report_coverage
      check_requiring_libraries
    end

    private

    # Check requiring libraries successfully.
    # See https://github.com/bbatsov/rubocop/pull/4523#issuecomment-309136113
    def check_requiring_libraries
      sh!("ruby -I lib -r rubocop -e 'exit 0'")
    end

    def master?
      ENV['TRAVIS_BRANCH'] == 'master' && ENV['TRAVIS_PULL_REQUEST'] == 'false'
    end

    def report_coverage
      sh!('bundle exec codeclimate-test-reporter') if master?
    end

    # Run main task(RSpec or RuboCop).
    def run_main_task
      if master?
        sh!("bundle exec rake #{ENV['TASK']}")
      else
        # sh!("bundle exec rake parallel:#{ENV['TASK']}")
      end
    end

    def sh!(command)
      puts "$ #{command}"
      time = Benchmark.realtime do
        system(command)
      end
      puts "#{time} seconds"
      puts
      raise "`#{command}` is failed" unless $CHILD_STATUS.success?
    end

  end
end

RubocopTravis.run