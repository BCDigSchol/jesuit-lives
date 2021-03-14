module SolrIndexer

  class Indexer

    # Build the Indexer
    # @todo get configuration values from blacklight.yml
    #
    # @param [Integer] batch_size number of records to hold before commiting
    def initialize(batch_size: 1)
      @batch_size = batch_size
      # @type [RSolr::Client] @rsolr
      @solr = RSolr.connect :url => 'http://localhost:8983/solr/blacklight-core'
      @docs_to_index = {}
    end

    # Add Jesuit to be indexed
    #
    # @param [Jesuit] jesuit
    def add(jesuit)
      jesuit_doc = Doc.new(jesuit)
      @docs_to_index[jesuit.jl_id] = jesuit_doc
      if @docs_to_index.size >= @batch_size
        commit
      end
    end

    # Index any Jesuits in the docs list
    def commit
      @solr.add @docs_to_index.values
      @solr.commit
      @docs_to_index = {}
    end

    # Delete a Jesuit or an array of Jesuits
    #
    # @param [Jesuit,Array<Jesuit>] to_delete
    def delete(to_delete)
      if to_delete.kind_of?(Array)
        ids_to_delete = to_delete.map { |jesuit| jesuit.jl_id }
      else
        ids_to_delete = [to_delete.jl_id]
      end
      @solr.delete_by_id(ids_to_delete)
    end

    # Delete all indexed data
    def delete_all
      @solr.delete_by_query('*:*')
      @solr.commit
    end

  end
end