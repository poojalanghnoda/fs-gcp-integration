# Freeswitch lua - GCP integration
There are some library support at luarocks for GCP integration with lua(lua-resty-gcp) but it porvides with ngx enviorment and we won't to connect on standalone lua scripts. 

Set env variable - GCP_SERVICE_ACCOUNT
ex - On linux you can set by `export GCP_SERVICE_ACCOUNT='<path to service account.json>'`

You'll able to hit it by running google_dialogflow_lua_integrationss.lua

# Requirements
lua - 5.2
luarocks- 2.4.2
cjson
luajwtjitsi
luasocket

