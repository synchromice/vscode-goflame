#!/bin/sh

. "./../../CameraConfiguration.sh"

# Формирование параметров JSON запроса.
JSON=$(cat << DELIMITER
{
	"ConfigurationToken":"vac"
}
DELIMITER
)

echo "Analytics.GetAnalyticsModules()"
echo "$JSON" > "./Analytics.GetAnalyticsModules.json"
./ipcam_request.py -a $IP -s analytics -c GetAnalyticsModules -l "$JSON" | jq
