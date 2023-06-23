#!/bin/sh

. "./../../CameraConfiguration.sh"

# Формирование параметров JSON запроса.
JSON=$(cat << DELIMITER
{
	"ConfigurationToken":"vac",
	"AnalyticsModuleName":[
		"Test1",
		"Test2"
	]
}
DELIMITER
)

# Вызов DeleteAnalyticsModules()
echo "Analytics.DeleteAnalyticsModules(Test1, Test2)"
echo "$JSON" > "./Analytics.DeleteAnalyticsModules_Test12.json"
./ipcam_request.py -a $IP -s analytics -c DeleteAnalyticsModules -l "$JSON" | jq
