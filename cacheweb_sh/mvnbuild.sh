#to install crm-cache-web
cd F:/server/sourcePro/cacheweb/cache-platmgr
mvn clean install -T 1C -Dmaven.test.skip=true  -Dmaven.compile.fork=true

cd F:/server/sourcePro/cacheweb/crm-cache-web

mvn clean package -T 1C -Dmaven.test.skip=true  -Dmaven.compile.fork=true
