class  MonteCarlo
#  include ActiveModel::Validations
#  include ActiveModel::Conversion
#  include ActiveModel::Naming

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
  validates :minimum_price, numericality: {:greater_than_or_equal_to  => 0}
  validates :maximum_price, numericality: {:greater_than  => :minimum_price}
  validates :max_picks, numericality: {only_integer: true}
  validates :max_picks, numericality: {:greater_than  => 0}
  validates :commission, numericality: {:greater_than_or_equal_to  => 0}

  def earliest_start_date
    StssTrade.order(:buy_date).first(1)[0].buy_date
  end

  def latest_start_date
    StssTrade.order(:buy_date).last(1)[0].buy_date
  end

  def valid_start_date
    if :start_date < earliest_start_date
      errors.add(:start_date, "can't be before earliest_start_date")
    end

    if :start_date > latest_start_date
      errors.add(:start_date, "can't be after latest_start_date")
    end
  end

  def valid_end_date
    if :end_date < earliest_start_date
      errors.add(:end_date, "can't be before earliest_start_date")
    end

    if :end_date <= :start_date
      errors.add(:end_date, "must be after start_date")
    end
  end
end
