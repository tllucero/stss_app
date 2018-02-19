class  MonteCarlo
#  include ActiveModel::Validations
#  include ActiveModel::Conversion
#  extend ActiveModel::Naming

  include ActiveAttr::BasicModel
  include ActiveAttr::Attributes
  include ActiveAttr::AttributeDefaults
  include ActiveAttr::QueryAttributes
  include ActiveAttr::TypecastedAttributes

  attribute :start_date, :type => Date, :default => Date.strptime("04/11/1996", "%m/%d/%Y")
  attribute :end_date, :type => Date, :default => Date.strptime("01/24/2012", "%m/%d/%Y")
  attribute :runs, :type => Integer, :default => 1000
  attribute :trade_type, :default => 'A'
  attribute :starting_amount, :default => 10000
  attribute :minimum_price, :default => 0
  attribute :maximum_price, :default => 999999
  attribute :max_picks, :type => Integer, :default => 16
  attribute :commission, :default => 7

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :runs, numericality: {only_integer: true}
  validates :runs, numericality: {:greater_than  => 0}
  validates :trade_type, presence: true
  validates :starting_amount, numericality: {:greater_than_or_equal_to  => 1000}
  validates :minimum_price, numericality: {:greater_than_or_equal_to  => 0}
  validates :maximum_price, numericality: {:greater_than  => :minimum_price}
  validates :max_picks, numericality: {only_integer: true}
  validates :max_picks, numericality: {:greater_than  => 0}
  validates :commission, numericality: {:greater_than_or_equal_to  => 0}

  validates :start_date, date: {
    after_or_equal_to: StssTrade.order(:buy_date).first(1)[0].buy_date}
  validates :start_date, date: {
    #before_or_equal_to: StssTrade.order(:buy_date).last(1)[0].buy_date}
    before_or_equal_to: Date.strptime("01/20/2012", "%m/%d/%Y")}

  validates :end_date, date: {after: :start_date}
  validates :end_date, date: {
    before_or_equal_to: Date.strptime("01/24/2012", "%m/%d/%Y")}

end
