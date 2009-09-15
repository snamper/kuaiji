# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090415145112) do

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.integer  "category_id", :limit => 11
    t.string   "author"
    t.text     "info"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delflag",     :limit => 11, :default => 0
  end

  create_table "bangongs", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "baomings", :force => true do |t|
    t.string   "name"
    t.string   "sex"
    t.string   "workunit"
    t.string   "phone"
    t.string   "ticket"
    t.text     "remark"
    t.integer  "huiyi_id",   :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delflag",    :limit => 11, :default => 0
  end

  create_table "fawens", :force => true do |t|
    t.string   "title"
    t.string   "code"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "receiver"
    t.string   "filename"
    t.integer  "user_id",    :limit => 11
  end

  create_table "flowlogs", :force => true do |t|
    t.integer  "workflow_id", :limit => 11
    t.integer  "flowstep_id", :limit => 11
    t.integer  "user_id",     :limit => 11
    t.integer  "wenjian_id",  :limit => 11
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "flowsteps", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "workflow_id", :limit => 11
    t.integer  "seq",         :limit => 11
    t.integer  "endflag",     :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "user_id",     :limit => 11
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delflag",    :limit => 11, :default => 0
  end

  create_table "groups_ziyuans", :id => false, :force => true do |t|
    t.integer "group_id",  :limit => 11, :default => 0, :null => false
    t.integer "ziyuan_id", :limit => 11, :default => 0, :null => false
  end

  create_table "guanggaos", :force => true do |t|
    t.text     "ad1"
    t.text     "ad2"
    t.text     "ad3"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file1"
    t.string   "file2"
    t.string   "file3"
    t.text     "ad4"
    t.string   "file4"
  end

  create_table "huiyis", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "status",     :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "author"
    t.integer  "delflag",    :limit => 11, :default => 0
    t.integer  "ispub",      :limit => 11
  end

  create_table "hycategories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delflag",    :limit => 11, :default => 0
  end

  create_table "lunwens", :force => true do |t|
    t.string   "title"
    t.integer  "lwcategory_id", :limit => 11
    t.string   "author"
    t.string   "keywords"
    t.string   "filepath"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tjdanwei_id",   :limit => 11
    t.integer  "score",         :limit => 11
    t.string   "author_unit"
    t.integer  "delflag",       :limit => 11, :default => 0
  end

  create_table "lwcategories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scorelevels", :force => true do |t|
    t.string   "levelname"
    t.integer  "levelvalue",   :limit => 11
    t.integer  "scoretype_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scores", :force => true do |t|
    t.integer  "lunwen_id",   :limit => 11
    t.integer  "total_value", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
    t.text     "content"
  end

  create_table "scoretypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shouwens", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "status",          :limit => 11
    t.integer  "user_id",         :limit => 11
    t.integer  "receive_user_id", :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "pycontent"
    t.string   "filename"
  end

  create_table "tjdanweis", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "realname"
    t.string   "password"
    t.integer  "group_id",      :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lwcategory_id", :limit => 11
    t.integer  "delflag",       :limit => 11, :default => 0
  end

  create_table "webconfigs", :force => true do |t|
    t.string   "name"
    t.string   "typename"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wenjians", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "user_id"
    t.integer  "workflow_id", :limit => 11
    t.integer  "flowstep_id", :limit => 11
    t.integer  "flag",        :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workflows", :force => true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "step_num",   :limit => 11
    t.integer  "user_id",    :limit => 11
  end

  create_table "zhichengs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delflag",    :limit => 11, :default => 0
  end

  create_table "zhuanjias", :force => true do |t|
    t.string   "name"
    t.string   "sex"
    t.string   "code"
    t.string   "birthday"
    t.string   "age"
    t.string   "nations"
    t.string   "idno"
    t.string   "phone"
    t.string   "address"
    t.string   "zipcode"
    t.string   "email"
    t.integer  "zhicheng_id",   :limit => 11
    t.string   "political"
    t.string   "hukou"
    t.string   "zhichengno"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "diqu"
    t.string   "tjdanwei"
    t.string   "gzdanwei"
    t.string   "hyfenlei"
    t.string   "zhiwu"
    t.string   "xueli"
    t.string   "techang"
    t.string   "chuban"
    t.string   "jiangli"
    t.string   "othertechang"
    t.string   "photo"
    t.integer  "hycategory_id", :limit => 11
    t.integer  "delflag",       :limit => 11, :default => 0
  end

  create_table "ziyuans", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "parent_id",  :limit => 11
    t.integer  "seq",        :limit => 11
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "group_id"
    t.string   "remark"
    t.integer  "delflag",    :limit => 11, :default => 0
  end

end
