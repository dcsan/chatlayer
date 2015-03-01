#!/usr/bin/env sh
set +x
cd new-app
meteor deploy --settings private/staging.json backdev.meteor.com
