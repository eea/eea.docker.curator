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


## Action configuration examples:

https://www.elastic.co/guide/en/elasticsearch/client/curator/current/examples.html

```
---
# Remember, leave a key empty if there is no value.  None will be a string,
# not a Python "NoneType"
#
# Also remember that all examples have 'disable_action' set to True.  If you
# want to use this action as a template, be sure to set this to False after
# copying it.
actions:
  1:
    action: delete_indices
    description: >-
      Delete indices older than 45 days (based on index name), for logstash-
      prefixed indices. Ignore the error if the filter does not result in an
      actionable list of indices (ignore_empty_list) and exit cleanly.
    options:
      ignore_empty_list: True
      disable_action: True
    filters:
    - filtertype: pattern
      kind: prefix
      value: logstash-
    - filtertype: age
      source: name
      direction: older
      timestring: '%Y.%m.%d'
      unit: days
      unit_count: 45

```


## Usage

    $docker run --rm -e ACTION_CONFIG="$ACTION_CONFIG" -e ES_HOST=es.eea.europa.eu -e ES_PORT=443 -e USE_SSL="True" -e HTTP_AUTH="user:password" eeacms/curator:latest

or

    $docker run --rm -e ACTION_CONFIG="$ACTION_CONFIG" -e ES_HOST=es.eea.europa.eu -e ES_PORT=9200 -e USE_SSL="False" -e HTTP_AUTH="user:password" eeacms/curator:latest





