# ********RoostGPT********

# Test generated by RoostGPT for test HSBC-HK-Market-Api-Spec using AI Type Azure Open AI and AI Model roostgpt-4-32k
# 
# Feature file generated for /aisp/accounts_get for http method type GET 
# RoostTestHash=b87a8a3304
# 
# 

# ********RoostGPT********
Background:
* def urlBase = karate.properties['url.base'] || 'http://localhost:8080'
* url urlBase

* def AUTH_TOKEN = karate.properties['AUTH_TOKEN']
* def headers = {'Authorization': '#(AUTH_TOKEN)', 'x-fapi-auth-date': 'Sun, 10 Sep 2017 19:43:31 UTC', 'x-fapi-customer-ip-address': '169.254.169.254', 'x-fapi-interaction-id': '#(karate.uuid())', 'Accept-Language': 'en-HK', 'Content-Type': 'application/json'}
* configure headers = headers
