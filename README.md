# Jesuit Lives

## Getting started

Install the database and load the

```shell
bundle install
bundle exec rake db:setup
```

### Using bundled Solr

The `solr_wrapper` gem can install and manage solr and your core in development. The `solr_wrapper` handles installing a local solr and copying over the latest version of the solr configuration.

To install solr, build the core, and load data:

```shell
bundle exec solr_wrapper
```

### Using your own Solr

The solr schema will frequently change, so if you are using your own solr install you will need to delete your solr core after pulling changes and restarting solr with the new configuration.

To use your own solr, add a new `blacklight-core` core.

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

Development user credentials and some standard data fields are in *seeds.rb*:

```shell
bundle exec rake db:seed:replant
```

Jesuit records are stored in *db/import* and imported with 

```shell
bundle exec rake jlives:import_jesuits
```