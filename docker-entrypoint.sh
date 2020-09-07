#!/bin/bash

sed -i 's/68.183.115.60/0.0.0.0/g' /usr/src/app/web/vue/dist/UIconfig.js
sed -i 's/68.183.115.60/'${HOST}'/g' /usr/src/app/web/vue/dist/UIconfig.js
sed -i 's/3000/'${PORT}'/g' /usr/src/app/web/vue/dist/UIconfig.js
if [[ "${USE_SSL:-0}" == "1" ]] ; then
    sed -i 's/ssl: false/ssl: true/g' /usr/src/app/web/vue/dist/UIconfig.js
fi
exec node gekko "$@"
