#!/bin/sh

. "./../../CameraConfiguration.sh"

JSON=$(
	cat <<DELIMITER
{
}
DELIMITER
)
json_test media/GetAudioSources