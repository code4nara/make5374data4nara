## Description

Script for Make 5374 date(csv) for Nara-shi.  
5374:  See https://github.com/codeforkanazawa-org/5374

奈良市の7374用データファイル作成スクリプト  
区域記号、区域番号ごとのファイルから奈良市全域のエリアごとの収集日ファイルを作成する。

## Files

詳細な記述フォーマットは 5374 に準拠。

#### 0arealist.csv

奈良市の収集区域リスト  
フォーマット：エリア名（日本語地域名称）,区域記号（A～F,X,Z）,区域番号（再生資源収集日の区域記号）

#### 0cnumlist.csv

区域番号ごとの資源ごみ収集日。収集日は YYYYMMDD としスペースで区切る
フォーマット：区域番号（再生資源収集日の区域記号）,YYYYMMDD YYYYMMDD YYYYMMDD ....

#### 0codelist.csv

区域記号ごとのごみ収集曜日
フォーマット：区域記号,燃やせるごみ,燃やせないごみ,再生プラスチック
例：A,奈良市収集課,月 木,隔水20160413,火

上記のファイルは、[奈良市のページ](http://www.city.nara.lg.jp/www/genre/0000000000000/1147679677610/)を参考に作成

## Usage

./mkcsv.sh を実行すると area_days_NEW.csv が作成される

## Licence

[MIT](https://github.com/tcnksm/tool/blob/master/LICENCE)  
ライセンス表示不要

## Author

[code4nara](https://github.com/code4nara)
