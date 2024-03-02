# 启航电商OMS订单处理系统

## 介绍
启航电商OMS订单处理系统是一套为中小电商企业构建的一套简单实用的第三方平台订单处理系统，本项目后端采用SpringCloudAlibaba 微服务架构，前端采用Vue3开发。

支持多平台店铺，目前支持：淘宝、京东、拼多多、抖店。后续计划支持快手、小红书等。

主要功能包括：订单管理及发货、售后处理、商品管理等。

后续计划推出订单打单（电子面单打印）功能。

## 主体功能

### 1、订单管理
+ 从平台同步订单
+ 订单发货
  + 获取订单收货地址信息
  + 推送物流信息到平台
+ 订单备注修改

### 2、售后管理
+ 从平台同步售后列表
+ 售后处理（同意、备注）

### 3、商品管理
+ 从平台同步商品信息
+ 更新销量
+ 同步库存

### 4、店铺管理

**支持多店铺管理**

+ 店铺参数设置（appkey等）
+ 基础管理
  + 发货地址库
  + 发货物流公司库



## 软件架构
### 1、后端
+ jdk：17
+ SpringBoot：3.0.2
  + spring-boot-starter-security 
+ SpringCloudAlibaba：2022.0.0.0
  + Nacos
  + SpringCloud Gateway
  + spring-cloud-starter-loadbalancer

### 2、前端
+ vue3 + element

### 3、存储
+ MySQL8

### 4、中间件
+ Redis：7.x（缓存：在线用户、字典、系统配置）
+ Nacos：2.2.0（配置中心、注册中心）
+ Sentinel（分布式流量治理组件）

  `java -Dserver.port=8888 -Dcsp.sentinel.dashboard.server=localhost:8888 -Dproject.name=sentinel-dashboard -jar sentinel-dashboard.jar`

## 项目说明
### core
项目公共模块包括：
#### common
公共类型

#### security
公共权限验证模块

### api
网关项目，负责微服务接口转发，前端统一通过网关调用其他微服务接口；

### sys-api
oms项目系统微服务，主要功能包括：
+ 用户
+ 授权
+ 菜单
+ 公共配置

### tao-api
淘宝开放平台接口api



### jd-api
京东开放平台接口api

### dou-api
抖店开放平台接口api

### pdd-api
拼多多开放平台接口api



## 运行教程
### 1、运行环境所需


1. 启动MySQL
2. 启动Redis
3. 启动Sentinel控制台
4. 启动Nacos

### 2、启动服务(项目)
1.  启动业务微服务（tao-api、jd-api等平台接口api微服务）
2.  启动sys-api(系统api)
3.  启动微服务网关（api）

### 3、运行前端
+ Nodejs版本：v20.11.0
+ 进入`vue3`文件夹
+ 安装pnpm：`npm install pnpm -g`
+ 运行`pnpm install` 
+ 运行`pnpm run dev`
+ 浏览网页`http://localhost:3000`

## 项目部署

### 打包

#### 后端打包

#### 前端打包

```
# 项目打包
pnpm run build:prod

# 上传文件至远程服务器
将打包生成在 `dist` 目录下的文件拷贝至 `/usr/share/nginx/html` 目录

# nginx.cofig 配置
server {
	listen     80;
	server_name  localhost;
	location / {
			root /usr/share/nginx/html;
			index index.html index.htm;
	}
	# 反向代理配置
	location /prod-api/ {
			proxy_pass http://vapi.youlai.tech/; # vapi.youlai.tech替换成你的后端API地址
	}
}
```


💖 如果觉得有用记得点 Star⭐


欢迎一起交流！



## 捐献作者
作者为兼职做开源,平时还需要工作,如果帮到了您可以请作者吃个盒饭(目前还希望接收大家的捐献可以搭建一个演示环境！)


<img src="./weixinzhifu.jpg" width="300px" />
<img src="./zhifubao.jpg" width="300px" />

