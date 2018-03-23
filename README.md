# KASEAPI

KASE 資料串接使用，包含一個資料顯示網頁及兩個API接口。

### 資料庫資訊

```sql
伺服器版本: 10.1.21-MariaDB
資料庫： `kase`
```

### 資料表結構

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