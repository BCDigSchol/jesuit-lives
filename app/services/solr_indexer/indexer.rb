module SolrIndexer

  class Indexer

    # Build the Indexer
    # @todo get configuration values from blacklight.yml
    def initialize
      # @type [RSolr::Client] @rsolr
      @solr = RSolr.connect :url => 'http://localhost:8983/solr/blacklight-core'
      @docs_to_index = []
    end

    # Add Jesuit to be indexed
    #
    # @param [Jesuit] jesuit
    def add(jesuit)
      @docs_to_index << Doc.new(jesuit)
    end

    # Index any Jesuits in the docs list
    def commit
      @solr.add @docs_to_index
      @solr.commit
    end

    # Delete a Jesuit
    #
    # @param [Jesuit] jesuit
    def delete(jesuit)
      @solr.delete_by_id(jesuit.jl_id)
    end

  end
end