class  MonteCarlo
  include ActiveModel:Validations
  include ActiveModel:Conversion
  include ActiveModel:Naming

  attr_accessor :start_date, :end_date
end
