#!/bin/sh

. "./../../CameraConfiguration.sh"

# Формирование параметров JSON запроса.
SOAP=$(cat << DELIMITER
<?xml version="1.0" encoding="utf-8"?>
<s:Envelope xmlns:s="http://www.w3.org/2003/05/soap-envelope">
  <s:Header>
    <wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
      <wsse:UsernameToken>
        <wsse:Username>admin</wsse:Username>
        <wsse:Password Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordDigest">pA4WSNmWf8Tmt3+dTCgYMyAhkbs=</wsse:Password>
        <wsse:Nonce>ivcw/FxgoiPI78yu+j/FDA==</wsse:Nonce>
        <wsu:Created>2023-05-25T10:38:45Z</wsu:Created>
      </wsse:UsernameToken>
    </wsse:Security>
  </s:Header>
  <s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <GetAnalyticsModules xmlns="http://www.onvif.org/ver20/analytics/wsdl">
      <ConfigurationToken>vac</ConfigurationToken>
    <GetAnalyticsModules>
  </s:Body>
</s:Envelope>
DELIMITER
)

# Вызов DeleteAnalyticsModules()
echo "Analytics.GetAnalyticsModules()"
./../../ipcam_request.py -a $IP -S -s analytics -c GetAnalyticsModules -l "$JSON"


