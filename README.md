# KASEAPI

KASE 資料串接使用，包含一個資料顯示網頁及兩個API接口。

DEMO<http://997052ba.ap.ngrok.io>
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

## 部署方式




[screenshot]:https://raw.githubusercontent.com/mkbs1419/Esuns_IT_Dashboard/master/pic/2018-03-06_113236.png "資料檢視器"