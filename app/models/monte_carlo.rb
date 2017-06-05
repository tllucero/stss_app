class  MonteCarlo
#  include ActiveModel:Validations
#  include ActiveModel:Conversion
#  include ActiveModel:Naming

  include ActiveAttr::BasicModel
  include ActiveAttr::Attributes
  include ActiveAttr::AttributeDefaults
#  include ActiveAttr::QueryAttributes
#  include ActiveAttr::TypecastedAttributes

  attribute :start_date, :type => Date, :default => Date.strptime("04/11/1996", "%m/%d/%Y")
  attribute :end_date, :type => Date, :default => Date.strptime("01/24/2012", "%m/%d/%Y")
end
