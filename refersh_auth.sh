REFRESH=`cat refresh.dat`
CLIENT_ID="amzn1.application-oa2-client.cb246e5289694a8c9c76fa46b7871dd7"
CLIENT_SECRET="fe838ceae984c9914ce78899aab0fbc1d7b9a95e5b2d87067d54b49d4101f84e"
GRANT_TYPE="refresh_token"
REDIRECT_URI="https://localhost:9745/authresponse"

curl -X POST --data "grant_type=${GRANT_TYPE}&refresh_token=${REFRESH}&client_id=${CLIENT_ID}&client_secret=${CLIENT_SECRET}&redirect_uri=${REDIRECT_URI}" https://api.amazon.com/auth/o2/token | tee refresh_token.log | python -c "import sys,json;t1=open('token.dat','w');t2=open('refresh.dat','w');x=sys.stdin.readline(); t1.write(json.loads(x)['access_token']);t2.write(json.loads(x)['refresh_token']);"
