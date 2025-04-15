*** Update Photo Editor Config

* dùng curl để update photo editor
* trên môi trường production đổi `staging-api.gapo.vn` thành `api.gapo.vn`
* enable photo editor nếu `colors.count > 0`

```
curl -X PUT \
  https://staging-api.gapo.vn/settings/new-settings/ios.photo_editor_config \
  -H 'content-type: application/json' \
  -d '{
  "auth": "toan.dk",
  "key": "ios.photo_editor_config",
  "values": [
      {
        "value": {
          "fonts": [
            {
              "inset": 5,
              "size": 30,
              "name": "Cơ bản",
              "font": "SFProText-Regular"
            },
            {
              "inset": 8,
              "size": 30,
              "name": "Đơn giản",
              "font": "Nunito-Regular"
            },
            {
              "inset": 8,
              "size": 30,
              "name": "Nghiêm túc",
              "font": "HeptaSlab-Regular"
            },
            {
              "inset": 8,
              "size": 52,
              "name": "Thành phố",
              "font": "iCielPrOutfitterScript-Reg2"
            },
            {
              "inset": 5,
              "size": 30,
              "name": "Chữ đậm",
              "font": "BalooPaaji-Regular"
            },
            {
              "inset": 8,
              "size": 68,
              "name": "Mềm mại",
              "font": "JustLovely-Roman"
            },
            {
              "inset": 8,
              "size": 30,
              "name": "Tinh nghịch",
              "font": "Pacifico-Regular"
            }
          ],
          "colors": [
            {
              "bg": "#ffffff",
              "text": "#000000"
            },
            {
              "bg": "#000000",
              "text": "#ffffff"
            },
            {
              "bg": "#FF4C82",
              "text": "#ffffff"
            },
            {
              "bg": "#1A99F4",
              "text": "#ffffff"
            },
            {
              "bg": "#F7D925",
              "text": "#ffffff"
            },
            {
              "bg": "#6FBE49",
              "text": "#ffffff"
            },
            {
              "bg": "#F87376",
              "text": "#ffffff"
            },
            {
              "bg": "#D48E15",
              "text": "#ffffff"
            },
            {
              "bg": "#5168D7",
              "text": "#ffffff"
            },
            {
              "bg": "#0B3688",
              "text": "#ffffff"
            }
          ]
        }
      }
  ]
}'
```
## English:
```
curl -X POST \
  https://staging-api.gapo.vn/settings/new-settings \
  -H 'content-type: application/json' \
  -d '{
  "auth": "toan.dk",
  "key": "ios.photo_editor_config_en",
  "values": [
      {
        "value": {
          "fonts": [
            {
              "inset": 5,
              "size": 30,
              "name": "Default",
              "font": "SFProText-Regular"
            },
            {
              "inset": 8,
              "size": 30,
              "name": "Simple",
              "font": "Nunito-Regular"
            },
            {
              "inset": 8,
              "size": 30,
              "name": "Serious",
              "font": "HeptaSlab-Regular"
            },
            {
              "inset": 8,
              "size": 52,
              "name": "City",
              "font": "iCielPrOutfitterScript-Reg2"
            },
            {
              "inset": 5,
              "size": 30,
              "name": "Bold",
              "font": "BalooPaaji-Regular"
            },
            {
              "inset": 8,
              "size": 68,
              "name": "Soft",
              "font": "JustLovely-Roman"
            },
            {
              "inset": 8,
              "size": 30,
              "name": "Naughty",
              "font": "Pacifico-Regular"
            }
          ],
          "colors": [
            {
              "bg": "#ffffff",
              "text": "#000000"
            },
            {
              "bg": "#000000",
              "text": "#ffffff"
            },
            {
              "bg": "#FF4C82",
              "text": "#ffffff"
            },
            {
              "bg": "#1A99F4",
              "text": "#ffffff"
            },
            {
              "bg": "#F7D925",
              "text": "#ffffff"
            },
            {
              "bg": "#6FBE49",
              "text": "#ffffff"
            },
            {
              "bg": "#F87376",
              "text": "#ffffff"
            },
            {
              "bg": "#D48E15",
              "text": "#ffffff"
            },
            {
              "bg": "#5168D7",
              "text": "#ffffff"
            },
            {
              "bg": "#0B3688",
              "text": "#ffffff"
            }
          ]
        }
      }
  ]
}'
```


*** Update version mới

* sử dụng api với path `/settings/new-settings`, method `Post`, thay params `"key": "ios.photo_editor_config"`
