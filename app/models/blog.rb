class Blog < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks
  mount_uploader :avatar, AvatarUploader
  attr_accessible :id, :post, :title, :user_id, :avatar
  belongs_to :user, :foreign_key => :user_id
  has_many :comments, dependent: :destroy
  validates :post, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true
  default_scope order: 'blogs.created_at DESC'

  settings :analysis => {
      :filter => {
          :edge_ngram => {
              "type" => "edgeNGram",
              "max_gram" => 10,
              "min_gram" => 1,
              "side" => "front"
          }
      },
      :analyzer => {
          :autocomplete => {
              "tokenizer" => "lowercase",
              "filter" => ["edge_ngram"],
              "type" => "custom"
          }
      }
  } do
    mapping {
      indexes :id, :index => :not_analyzed
      indexes :post, :type => 'multi_field', :fields => {
          :post => {:type => "string"},
          :autocomplete => {:type => "string", :analyzer => "autocomplete"}
      }
      indexes :title, :type => 'multi_field', :fields => {
          :title => {:type => "string"},
          :autocomplete => {:type => "string", :analyzer => "autocomplete"}
      }
    }
  end
end
