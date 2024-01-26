# 启航电商OMS订单处理系统

## 介绍
启航电商OMS订单处理系统是一套为中小电商企业构建的一套简单实用的第三方平台订单处理系统，本项目后端采用SpringCloudAlibaba 微服务架构，前端采用Vue3开发。

本系统支持多平台订单、售后、发货等接口对接，包括：淘宝、拼多多、抖店、快手小店、小红书等。

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

## 项目说明
### api
网关项目，负责微服务接口转发，前端统一通过网关调用其他微服务接口；

### oms-api
oms项目公用基础微服务，主要功能包括：
+ 用户
+ 授权
+ 菜单
+ 公共配置

### tao-api
淘宝开放平台接口api

### pdd-api
拼多多开放平台接口api

### jd-api
京东开放平台接口api

### dou-api
抖店开放平台接口api

### kuai-api
快手小店开放平台接口api

### xhs-api
小红书开放平台接口api

## 运行教程
### 1、运行环境所需

1.  启动Nacos
2.  启动MySQL
3.  启动Redis

### 2、启动服务
1.  启动业务微服务（tao-api、jd-api、pdd-api等平台接口api微服务）
2.  启动oms-api
3.  启动微服务网关（api）

### 3、运行前端
+ Nodejs版本：v20.11.0
+ 进入`vue3`文件夹
+ 安装pnpm：`npm install pnpm -g`
+ 运行`pnpm install` 
+ 运行`pnpm run dev`
+ 浏览网页`http://localhost:3000`

## 使用说明

1.  xxxx
2.  xxxx
3.  xxxx

