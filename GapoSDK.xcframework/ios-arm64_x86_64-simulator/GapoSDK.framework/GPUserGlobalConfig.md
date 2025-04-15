*** Update Global Config

* dùng curl để update global config
* trên môi trường production đổi `staging-api.gapo.vn` thành `api.gapo.vn`

```
curl -X PUT \
  https://api.gapowork.vn/settings/new-settings/ios.global_config_v5 \
  -H 'content-type: application/json' \
  -d '{
  "auth": "toan.dk",
  
  
  "key": "ios.global_config_v5",
  "values": [
    {
      "value": {
          "PIP-enable": true,
          "call_enable": true,
          "contact_upload_interval": 7,
          "force_register_input": false,
          "hide_group_feed": false,
          "poll_maximum_count_votes": 50,
          "limit_announcement_posts": 5,
          "google_client_id": "496160243049-cddc13thks0tas865vcnjt2t9muac0c6.apps.googleusercontent.com"
      },
      "ratio": 100
    },
    {
      "value": {
          "PIP-enable": true,
          "call_enable": true,
          "contact_upload_interval": 7,
          "force_register_input": false,
          "hide_group_feed": false,
          "google_client_id": "496160243049-cddc13thks0tas865vcnjt2t9muac0c6.apps.googleusercontent.com"

      },
      "whitelist": [758]
    }
  ]
}'
```

*** Update version mới

* sử dụng api với path `/settings/new-settings`, method `Post`, thay params `"key": "ios.global_config_v5"`

