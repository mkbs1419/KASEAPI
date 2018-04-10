# KASEAPI

KASE 資料串接使用，包含一個資料顯示網頁及兩個API接口。

[LIVE DEMO][demo_link]
![Dashboard][screenshot]

### 資料庫資訊

```sql
伺服器版本: 10.1.21-MariaDB
資料庫： `kase`
```

### 資料表結構

資料表包含 **demov3** 及 **tag_data**
當使用API寫入資料時，會先寫入 **demov3** ，並更新 **tag_data** 內的資訊以供output使用。
因為只需撈取最新狀態資料，這樣做可以大大減低撈取資料時系統的消耗及提升反應速度。

```sql
資料表結構 `demov3`
  `_id` int(11) NOT NULL,
  `tag` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
```

```sql
資料表結構 `tag_data`
  `tag` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
```

## Installation

1. **kase.sql** 
2. **run.py**

## Usage

API default endpoint

```
http://localhost:12200/
```

### /send
```
POST   http://localhost:12200/send
```

Request headers

| Request header | Description      |
| -------------- | ---------------- |
| Content-Type   | application/json |

Request body

| Field  | Type    | Required | Description           |
| ------ | ------- | -------- | --------------------- |
| name   | String  | Yes      | Device Name           |
| status | Boolean | Yes      | Device Online/Offline |
| value  | Float   | Yes      | Device Value          |

Response

```JSON
Example JSON response
{
    "name": "device_name",
    "response": "OK",
    "status": true,
    "value": 123.456
} 
```

### /data

```
GET   http://localhost:12200/data
```

Response

```JSON
Example JSON response
{
    "count": 1,
    "status": [
      {
        "description": "8F\u7a7a\u8abf\u7bb1\u96fb\u9336\u6578\u503c", 
        "tag": "8AHU:KWH", 
        "time_stamp": "Mon, 26 Mar 2018 16:53:36 GMT", 
        "type": "string", 
        "value": "4970.52"
      }
    ]
} 
```

**[回到顶部](#kaseapi)**


[demo_link]:http://997052ba.ap.ngrok.io "LIVE DEMO"
[screenshot]:https://i.imgur.com/ZSW63Tj.png "資料檢視器"
