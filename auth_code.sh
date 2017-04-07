CLIENT_ID="amzn1.application-oa2-client.cb246e5289694a8c9c76fa46b7871dd7"
DEVICE_TYPE_ID="alexa_push"
DEVICE_SERIAL_NUMBER=123
REDIRECT_URI="https://localhost:9745/authresponse"
RESPONSE_TYPE="code"
SCOPE="alexa:all"
SCOPE_DATA="{\"alexa:all\": {\"productID\": \"$DEVICE_TYPE_ID\", \"productInstanceAttributes\": {\"deviceSerialNumber\": \"${DEVICE_SERIAL_NUMBER}\"}}}"

function urlencode() {
  perl -MURI::Escape -ne 'chomp;print uri_escape($_),"\n"'
}

AUTH_URL="https://www.amazon.com/ap/oa?client_id=${CLIENT_ID}&scope=$(echo $SCOPE | urlencode)&scope_data=$(echo $SCOPE_DATA | urlencode)&response_type=${RESPONSE_TYPE}&redirect_uri=$(echo $REDIRECT_URI | urlencode)"

echo "URL: ${AUTH_URL}"
#https://localhost:9745/authresponse?code=ANcMJpTtVktKiZvfdYaV&scope=alexa%3Aall
