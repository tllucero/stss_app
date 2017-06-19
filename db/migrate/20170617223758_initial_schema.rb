class InitialSchema < ActiveRecord::Migration[5.1]
  def up
    create_table "stss_trades", id: :bigint, default: nil, force: :cascade do |t|
      t.string "trade_type", limit: 3, null: false
      t.string "ticker", limit: 10, null: false
      t.date "buy_date", null: false
      t.float "buy_price", null: false
      t.date "sell_date"
      t.float "sell_price"
      t.float "gain"
      t.integer "days"
      t.index ["trade_type", "buy_date"], name: "trade_type_buy_idx"
      t.index ["trade_type"], name: "trade_type_idx"
    end
  end

  def down
    drop_table :stss_trades
  end
end
