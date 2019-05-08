#!/usr/bin/env xonsh
# Script for starting all the servers

# start elasticsearch (the service)
#terminator -p xonsh -e "sh /home/christopher/elasticsearch/elasticsearch-6.6.1/bin/elasticsearch" &

# start zmq proxy
environment = 'ldrd_demo'
activate = "$HOME/arch/anaconda/bin/activate"

terminator -p xonsh -e f"source {activate} {environment}; bluesky-0MQ-proxy 5567 5568" &

# start data processing servers
for c in [
  'viz_server --db=raw.yml',
  f'portable_db_server {$PWD}',
  'tomo_server --db=raw.yml',
  f'python {$PWD}/elastic_server.py'
]:
    terminator -T @(c) -e @(f"source {activate} {environment}; {c}") &
