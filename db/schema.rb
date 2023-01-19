# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_18_163234) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "firstname"
    t.string "surname"
    t.datetime "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.datetime "publish_year"
    t.string "genre"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_on_author_id"
  end

  create_table "outgoing_webhooks", force: :cascade do |t|
    t.bigint "author_id", null: false
    t.integer "event_type", null: false
    t.string "url", null: false
    t.text "description"
    t.string "secret", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_outgoing_webhooks_on_author_id"
  end

  create_table "webhook_responses", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "index_webhook_responses_on_outgoing_webhook_id"
  end

  create_table "webhook_responses_shard_0", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "webhook_responses_shard_0_outgoing_webhook_id_idx"
  end

  create_table "webhook_responses_shard_1", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "webhook_responses_shard_1_outgoing_webhook_id_idx"
  end

  create_table "webhook_responses_shard_2", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "webhook_responses_shard_2_outgoing_webhook_id_idx"
  end

  create_table "webhook_responses_shard_3", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "webhook_responses_shard_3_outgoing_webhook_id_idx"
  end

  create_table "webhook_responses_shard_4", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "webhook_responses_shard_4_outgoing_webhook_id_idx"
  end

  create_table "webhook_responses_shard_5", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "webhook_responses_shard_5_outgoing_webhook_id_idx"
  end

  create_table "webhook_responses_shard_6", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "webhook_responses_shard_6_outgoing_webhook_id_idx"
  end

  create_table "webhook_responses_shard_7", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "webhook_responses_shard_7_outgoing_webhook_id_idx"
  end

  create_table "webhook_responses_shard_8", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "webhook_responses_shard_8_outgoing_webhook_id_idx"
  end

  create_table "webhook_responses_shard_9", primary_key: ["outgoing_webhook_id", "uid"], force: :cascade do |t|
    t.string "uid", null: false
    t.bigint "outgoing_webhook_id", null: false
    t.integer "event_type", null: false
    t.string "record_klass"
    t.string "record_id"
    t.string "request_url", null: false
    t.jsonb "request_body", default: {}, null: false
    t.jsonb "request_headers", default: {}, null: false
    t.jsonb "response_body", default: {}, null: false
    t.integer "response_code"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.index ["outgoing_webhook_id"], name: "webhook_responses_shard_9_outgoing_webhook_id_idx"
  end

end
