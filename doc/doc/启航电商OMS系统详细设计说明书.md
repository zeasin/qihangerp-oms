# 启航电商OMS系统详细设计说明书

&nbsp;

&nbsp;

&nbsp;

| 时间 | 版本  | 编写人 |备注 |
| --- |    --- | --- | --- |
| 2024-3-15 | 0.1 | 齐李平 |  |

<div style=”page-break-after: always;”></div>

&nbsp;&nbsp;

&nbsp;

&nbsp;

## 一、系统概述

参考1：https://max.book118.com/html/2021/0912/7042120060004003.shtm

参考2：https://wenku.baidu.com/view/8b8245642d3f5727a5e9856a561252d380eb208d.html?_wkts_=1710413157309&bdQuery=%E7%B3%BB%E7%BB%9F%E5%8A%9F%E8%83%BD%E8%AE%BE%E8%AE%A1%E6%96%87%E6%A1%A3%E6%80%8E%E4%B9%88%E5%86%99

参考3：https://blog.csdn.net/u010889616/article/details/122029286

参考4：https://wenku.baidu.com/view/31f675148462caaedd3383c4bb4cf7ec4bfeb640.html?_wkts_=1710412796490&bdQuery=%E7%B3%BB%E7%BB%9F%E8%AE%BE%E8%AE%A1%E6%96%87%E6%A1%A3%E6%80%8E%E4%B9%88%E5%86%99

参考5：https://www.zhihu.com/tardis/bd/art/474338077?source_id=1001

参考6：https://blog.csdn.net/hekuinumberone/article/details/129721093

参考7：https://zhidao.baidu.com/question/1840424966576956980.html

### 1.1 主体功能

启航电商OMS系统是一款主要用来管理多平台多店铺订单、售后的软件，系统采用B/S架构开发。对接的平台有：淘宝天猫、京东、抖店、拼多多，利用各平台的开放接口实现如下功能：

+ 订单数据同步
+ 售后数据同步
+ 商品数据同步

### 1.2 数据来源

数据来自于电商平台的开放接口：

+ 淘宝开放平台
+ 京东开放平台
+ 抖店开放平台
+ 拼多多开放平台

### 1.3 接口清单
| 平台 | 接口  | 描述  |
| --- |    --- | --- |
| 天猫 | taobao.products.get | 获取产品列表 |
|  | taobao.products.get | 获取产品列表 |

### 1.4 多店铺支持

系统支持每个店铺单独存储店铺数据。

## 二、架构设计

### 2.1 应用架构

### 2.2 系统逻辑架构

### 2.3 网络架构

## 三、功能设计

### 3.1 订单管理

#### 业务设计

#### 界面设计

## 四、数据库设计

字段设计见《启航电商OMS系统数据库设计说明书》

## 五、安全设计

## 六、接口安全设计
