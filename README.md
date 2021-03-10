# Jesuit Lives

## Getting started

Install the database and load the

```
bundle install
bundle exec rake db:setup
```

### Using bundled Solr

The `solr_wrapper` gem can install and manage solr and your core in development. Install solr, build the core, and load
data:

```shell
bundle exec solr_wrapper --persist
```

### Using your own Solr

Add a new `blacklight-core` core.

```shell
solr create -c blacklight-core
```

Copy the following config files to the `blacklight-core` directory.

```shell
cp /path/to/project/jesuit-lives/solr/blacklight-core/conf/* /path/to/solr/8.8.1/server/solr/blacklight-core/conf/
```

Then restart solr.

```shell
solr restart
```

## Testing and development data

Development user credentials are in *seeds.rb*. Load with rake, using the `load_jesuits` env variable to also load some
test individual records

```shell
bundle exec rake db:seed:replant load_jesuits=TRUE
```

To just reload Jesuit records:

```shell
bundle exec rake db:seed:replant_jesuits
```