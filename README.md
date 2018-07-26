# eea.docker.curator
ElasticSearch Curator docker custom image with action file read from environment variable.

## Curator


Elasticsearch Curator helps you curate, or manage, your Elasticsearch indices
and snapshots by:

1. Obtaining the full list of indices (or snapshots) from the cluster, as the
_actionable list_
2. Iterate through a list of user-defined <<filters,filters>> to progressively
remove indices (or snapshots) from this _actionable list_ as needed.
3. Perform various <<actions,actions>> on the items which remain in the
_actionable list._

## Documentation

https://www.elastic.co/guide/en/elasticsearch/client/curator/current/index.html

## Configuration
https://www.elastic.co/guide/en/elasticsearch/client/curator/current/configfile.html

* ES_HOST - elasticsearch hostname
* ES_PORT - elasticsearch port
* USE_SSL - True is elasticsearch url is https
* HTTP_AUTH - Elasticsearch credentials - USER:PASSWORD
* TIMEOUT - Elasticsearch default client connection timeout in seconds
* MASTER_ONLY - True or False, used to connect only to master node.

## Action configuration

https://www.elastic.co/guide/en/elasticsearch/client/curator/current/actionfile.html

Can be given with a volume or with a variable:

* ACTION_CONFIG - yml formatted action configuration

## Usage

    $docker run --rm -e ACTION_CONFIG="$ACTION_CONFIG" -e ES_HOST=es.eea.europa.eu -e ES_PORT=443 -e USE_SSL="True" -e HTTP_AUTH="user:password" eeacms/curator:latest

    $docker run --rm -e ACTION_CONFIG="$ACTION_CONFIG" -e ES_HOST=es.eea.europa.eu -e ES_PORT=9200 -e USE_SSL="False" -e HTTP_AUTH="user:password" eeacms/curator:latest





