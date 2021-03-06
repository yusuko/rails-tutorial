# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_180_612_115_823) do
  create_table 'likes', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'micropost_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['micropost_id'], name: 'index_likes_on_micropost_id'
    t.index %w[user_id micropost_id], name: 'index_likes_on_user_id_and_micropost_id', unique: true
    t.index ['user_id'], name: 'index_likes_on_user_id'
  end

  create_table 'messages', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'send_user_id'
    t.string 'content'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['send_user_id'], name: 'index_messages_on_send_user_id'
    t.index %w[user_id send_user_id], name: 'index_messages_on_user_id_and_send_user_id'
    t.index ['user_id'], name: 'index_messages_on_user_id'
  end

  create_table 'microposts', force: :cascade do |t|
    t.text 'content'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'picture'
    t.integer 'reply_to', default: 0
    t.index %w[user_id created_at], name: 'index_microposts_on_user_id_and_created_at'
    t.index ['user_id'], name: 'index_microposts_on_user_id'
  end

  create_table 'relationships', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followed_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['followed_id'], name: 'index_relationships_on_followed_id'
    t.index %w[follower_id followed_id], name: 'index_relationships_on_follower_id_and_followed_id', unique: true
    t.index ['follower_id'], name: 'index_relationships_on_follower_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password_digest'
    t.string 'remember_digest'
    t.boolean 'admin', default: false
    t.string 'activation_digest'
    t.boolean 'activated', default: false
    t.string 'activated_at'
    t.string 'reset_digest'
    t.datetime 'reset_sent_at'
    t.string 'profile'
    t.string 'provider'
    t.string 'uid'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end
end
