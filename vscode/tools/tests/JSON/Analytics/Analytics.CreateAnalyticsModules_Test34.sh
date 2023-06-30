#!/bin/sh

. "./../../CameraConfiguration.sh"

# Формирование параметров JSON запроса.
JSON=$(cat << DELIMITER
{
	"ConfigurationToken":"vac",
	"AnalyticsModule":[
		{

			"Parameters":"<Parameters><SimpleItem Name=\"Sensitivity\" Value=\"100\"/><ElementItem Name=\"Layout\"><CellLayout Columns=\"32\" Rows=\"18\"/></ElementItem></Parameters>",
			"Parameters0":"<Parameters><SimpleItem Name=\"Sensitivity\" Value=\"90\"/><ElementItem Name=\"Layout\"><CellLayout Columns=\"32\" Rows=\"18\"/></ElementItem></Parameters>",
			"Name":"Test3",
			"Type":"cellmotiondetector"
		},
		{
			"Parameters":"<Parameters><SimpleItem Name=\"Sensitivity\" Value=\"90\"/><ElementItem Name=\"Layout\"><CellLayout Columns=\"32\" Rows=\"18\"/></ElementItem></Parameters>",
			"Name":"Test4",
			"Type":"cellmotiondetector"
		}
	]
}
DELIMITER
)

echo "Analytics.CreateAnalyticsModules(Test3, Test4)"
#echo "$JSON" > "./Analytics.CreateAnalyticsModules_Test12.json"
./../../ipcam_request.py -a $IP -s analytics -c CreateAnalyticsModules -l "$JSON" | jq