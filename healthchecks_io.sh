function log_error() {
  logger -t healthcheck -p local7.error $1
}

function log_info() {
  logger -t healthcheck -p local7.info $1
}

CURL_ERROR=$(curl -sS --insecure --fail --max-time 10 https://hc-ping.com/PING-ID 2>&1 > /dev/null)

if [ $? -ne 0 ]; then
  log_error "Couldn't reach Healthchecks.io - ${CURL_ERROR}"
  
  /bin/ping -c 1 1.1.1.1
  
  PING_ERROR_CODE=$?

  if [ $PING_ERROR_CODE -ne 0 ]; then
    log_error "1.1.1.1 is NOT reachable - error_code: ${PING_ERROR_CODE}"
  else
    log_info "1.1.1.1 is reachable"
  fi

  /bin/ping -c 1 192.168.100.1
  
  PING_ERROR_CODE=$?

  if [ $PING_ERROR_CODE -ne 0 ]; then
    log_error "Modem is NOT reachable - error_code: ${PING_ERROR_CODE}"
  else
    log_info "Modem is reachable"
  fi
fi