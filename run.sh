echo Ring Alarm Integration
echo Node Version
node -v
echo NPM Version
npm -v
git --version

CONFIG_PATH=/data/options.json

git clone --progress  https://github.com/acolytec3/ring-alarm-HA-plugin.git

ring_username="$(jq --raw-output '.username' $CONFIG_PATH)"
ring_passphrase="$(jq --raw-output '.password' $CONFIG_PATH)"
mqtt_username="$(jq --raw-output '.mqtt_username' $CONFIG_PATH)"
mqtt_password="$(jq --raw-output '.mqtt_password' $CONFIG_PATH)"
mqtt="$(jq --raw-output '.mqtt_server' $CONFIG_PATH)"
discovery="$(jq --raw-output '.discovery' $CONFIG_PATH)"

RING_USERNAME=$ring_username RING_PASSPHRASE=$ring_passphrase MQTT=$mqtt DISCOVERY=$discovery MQTT_USER=$mqtt_username MQTT_PW=$mqtt_password node ring-alarm-HA-plugin/mqttAlarm.js
