# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_230_910_210_806) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'action_text_rich_texts', force: :cascade do |t|
    t.string 'name', null: false
    t.text 'body'
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[record_type record_id name], name: 'index_action_text_rich_texts_uniqueness', unique: true
  end

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.bigint 'byte_size', null: false
    t.string 'checksum', null: false
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'answers', force: :cascade do |t|
    t.text 'body', null: false
    t.boolean 'correct', default: true, null: false
    t.bigint 'question_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['title'], name: 'index_categories_on_title'
  end

  create_table 'gists', force: :cascade do |t|
    t.string 'gist_url'
    t.bigint 'user_id', null: false
    t.bigint 'question_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['question_id'], name: 'index_gists_on_question_id'
    t.index ['user_id'], name: 'index_gists_on_user_id'
  end

  create_table 'questions', force: :cascade do |t|
    t.text 'body', null: false
    t.bigint 'test_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['test_id'], name: 'index_questions_on_test_id'
  end

  create_table 'test_passages', force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'test_id'
    t.bigint 'current_question_id'
    t.integer 'correct_questions', default: 0
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['current_question_id'], name: 'index_test_passages_on_current_question_id'
    t.index ['test_id'], name: 'index_test_passages_on_test_id'
    t.index ['user_id'], name: 'index_test_passages_on_user_id'
  end

  create_table 'tests', force: :cascade do |t|
    t.string 'title', null: false
    t.integer 'level', default: 1, null: false
    t.bigint 'author_id', null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'tested_user_id'
    t.integer 'countdown', null: false
    t.index ['author_id'], name: 'index_tests_on_author_id'
    t.index ['category_id'], name: 'index_tests_on_category_id'
    t.index ['tested_user_id'], name: 'index_tests_on_tested_user_id'
    t.index %w[title level], name: 'index_tests_on_title_and_level', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email', default: '', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'type', default: 'User', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['type'], name: 'index_users_on_type'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'answers', 'questions', on_delete: :cascade
  add_foreign_key 'gists', 'questions'
  add_foreign_key 'gists', 'users'
  add_foreign_key 'questions', 'tests', on_delete: :cascade
  add_foreign_key 'test_passages', 'questions', column: 'current_question_id'
  add_foreign_key 'test_passages', 'tests'
  add_foreign_key 'test_passages', 'users'
  add_foreign_key 'tests', 'categories'
  add_foreign_key 'tests', 'users', column: 'author_id'
  add_foreign_key 'tests', 'users', column: 'tested_user_id'
end
