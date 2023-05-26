local AccessToken = require "accesstoken"

token = AccessToken()

print("IN MAIN METHOD---")
print(token.token)

local https = require("ssl.https")
local json = require("cjson")

local mytext = "hi"

local body = {
  queryInput = {
    text = {
      text = mytext
    },
    languageCode = "hi"
  },
  queryParams = {
    timeZone = "America/Los_Angeles"
  }
}

local headers = {
  ["Content-Type"] = "application/json",
  ["x-goog-user-project"] = "hackathon-385009",
  ["Content-Length"] = #json.encode(body)
}
headers["Authorization"] = "Bearer " .. token.token
local url = "https://asia-south1-dialogflow.googleapis.com/v3/projects/hackathon-385009/locations/asia-south1/agents/6d5dff0d-a141-44c8-b7d8-6ebb24d97f18/sessions/dd9ac301-97f5-4cc4-a80f-ad5751ff20fc:detectIntent"
local response_body = {}
local _, response_code, response_headers= https.request {
  url = url,
  method = "POST",
  headers = headers,
  source = ltn12.source.string(json.encode(body)),
  sink = ltn12.sink.table(response_body)
}

local response_json = table.concat(response_body)
local output = json.decode(response_json)

print(response_json)
local ans = ""
for _, res in ipairs(output.queryResult.responseMessages) do
  print(res.text.text[1])
  ans = ans .. res.text.text[1]
end
