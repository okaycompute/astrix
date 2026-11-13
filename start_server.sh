#!/bin/bash

rabbitmq-server &
celery -A celery_app worker &
