class Item < ActiveRecord::Base
  extend Enumerize
  enumerize :kind, in: [:book], default: :book

  searchable do
    text :title
    text :kind
    text :author
    text :summary
    integer :number_of_pages
    text :code
    text :publisher
  end

  validates :title, presence: true
  # validates :code, uniqueness: {allow_blank: false}, presence: true

  after_save :index_record
  before_destroy :remove_from_index

  def index_record
    SolrService.add(self.to_solr)
    SolrService.commit
  end

  def to_solr
    {'id' => id,
     'title_field' => title
    }
  end

  def remove_from_index
    SolrService.delete_by_id(self.id)
    SolrService.commit
  end
end
