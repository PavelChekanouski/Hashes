class DatesManager
  attr_reader :dates_processor
  attr_accessor :beginning_date, :unit, :duration

  UNITS_PROCESSOR = {
    seconds: 1,
    minutes: 60,
    hours: 60 * 60,
    days: 60 * 60 * 24,
    months: 60 * 60 * 24 * 30,
    years: 60 * 60 * 24 * 30 * 365
  }

  def initialize(params = {})
    @beginning_date = params.fetch(:beginning_date, Time.now)
    @unit = params.fetch(:unit, :seconds)
    @duration = params.fetch(:duration, 100)
    
    @ending_date = @beginning_date + duration*UNITS_PROCESSOR[unit] 

    @dates_processor = {
      seconds: lambda_for_duration(UNITS_PROCESSOR[:seconds]),
      minutes: lambda_for_duration(UNITS_PROCESSOR[:minutes]),
      hours: lambda_for_duration(UNITS_PROCESSOR[:hours]),
      days: lambda_for_duration(UNITS_PROCESSOR[:days]),
      months: lambda_for_duration(UNITS_PROCESSOR[:months]),
      years: lambda_for_duration(UNITS_PROCESSOR[:years])
    }
  end

  def lambda_for_duration(duration)
    lambda {
      dates = []
      estimated_date = @beginning_date
      while (@beginning_date..@ending_date).cover?(estimated_date += duration) do
        dates << estimated_date
      end
      dates
    }
  end
end