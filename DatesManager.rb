class DatesManager
  attr_reader :dates_processor
  attr_accessor :beginning_date, :unit, :duration

  UNITS = {
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
    @dates_processor = {
      seconds: lambda_for_duration(@duration).call,
      minutes: lambda_for_duration(@duration).call,
      hours: lambda_for_duration(@duration).call,
      days: lambda_for_duration(@duration).call,
      months: lambda_for_duration(@duration).call,
      years: lambda_for_duration(@duration).call
    }
  end

  def lambda_for_duration(duration)
    lambda {
      dates = []
      estimated_date = @beginning_date
      while (@beginning_date..(@beginning_date + duration * UNITS[@unit])).cover?(estimated_date += UNITS[:days]) do
        dates << estimated_date
      end
      dates
    }
  end
end