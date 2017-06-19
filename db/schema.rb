# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170617223758) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
