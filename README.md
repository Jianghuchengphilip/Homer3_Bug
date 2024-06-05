# Homer3_Bug
分享Homer3使用过程中的Bug
## 在Matlab运行Homer3 **报错**:
索引超出矩阵维度。
出错 datestr2datenum (line 21)
sec     = str2num(date_standard_fmt(19:20));
## Homer3 + Matlab R2017b运行
## 原因分析:
 在datestr2datenum.m中可以看到全是英文月份且时间戳格式并不支持中文。
 ## 解决方法：
 下载修改后适配中文时间戳的源码Github下载：[datestr2datenum.m](https://github.com/Jianghuchengphilip/Homer3_Bug/blob/main/datestr2datenum.m) OR  [datestr2datenum.m](https://raw.githubusercontent.com/Jianghuchengphilip/Homer3_Bug/main/datestr2datenum.m) （求Github Follow和star🌸）
 在Homer3软件包中找到原datestr2datenum.m文件并替换：
 Homer3-1.86.0\Homer3-1.86.0\Utils\Shared\datestr2datenum.m
