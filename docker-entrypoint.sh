#!/usr/bin/env bash

# Bind Heroku port
if [ "$PORT" ]; then
  export MB_JETTY_PORT="$PORT"
fi

# ربط قاعدة البيانات
if [ "$DATABASE_URL" ]; then
  export MB_DB_CONNECTION_URI="$DATABASE_URL"
fi

# تحسينات JVM للذاكرة فـ Heroku
JAVA_OPTS="$JAVA_OPTS -Xmx300m"
export JAVA_OPTS

exec java $JAVA_OPTS -jar /app/metabase.jar
