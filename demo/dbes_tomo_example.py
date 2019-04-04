#!/usr/bin/env python3

"""\
Draft script for ingesting tomography run_start document to ES.
"""

import json
import esconverters
from pprint import pprint
from databroker_elasticsearch import load_elasticindex


doc = json.load(open('tomo_start.json'))
ei = load_elasticindex('dbes-tomo.yml')

print("Sample ES document:\n")
pprint(ei.mapper(doc))
