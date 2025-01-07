package cn.qihangerp.open.tao.controller;

public class TaoPrintController {

     // 文档
    //https://support-cnkuaidi.taobao.com/doc.htm?spm=a219a.15212433.0.0.21b7669acyVwa3#?docId=108595&docType=1
    /***
     * 1、获取电子面单服务订购信息
     * taobao.wlb.waybill.i.search
     * {
     *   "wlb_waybill_i_search_response": {
     *     "request_id": "15sn0pnh8xu5l",
     *     "subscribtions": {
     *       "waybill_apply_subscription_info": [
     *         {
     *           "branch_account_cols": {
     *             "waybill_branch_account": [
     *               {
     *                 "allocated_quantity": 0,
     *                 "branch_code": "100591",
     *                 "branch_name": "北京朝阳区东坝公司",
     *                 "cancel_quantity": 0,
     *                 "print_quantity": 0,
     *                 "quantity": 0,
     *                 "shipp_address_cols": {
     *                   "waybill_address": [
     *                     {
     *                       "address_detail": "南彩镇坞里村中街68号曲美家居",
     *                       "area": "顺义区",
     *                       "city": "北京市",
     *                       "province": "北京",
     *                       "waybill_address_id": 191112062
     *                     }
     *                   ]
     *                 }
     *               }
     *             ]
     *           },
     *           "cp_code": "STO",
     *           "cp_type": 2
     *         },
     *         {
     *           "branch_account_cols": {
     *             "waybill_branch_account": [
     *               {
     *                 "allocated_quantity": 229,
     *                 "branch_code": "075724",
     *                 "branch_name": "广东省佛山市南海区西樵官山分部",
     *                 "cancel_quantity": 14,
     *                 "print_quantity": 0,
     *                 "quantity": 0,
     *                 "shipp_address_cols": {
     *                   "waybill_address": [
     *                     {
     *                       "address_detail": "龙江镇仙塘村委会西区一路8号之一顺德万洋众创园15幢202中铁",
     *                       "area": "顺德区",
     *                       "city": "佛山市",
     *                       "province": "广东省",
     *                       "waybill_address_id": 213564083
     *                     }
     *                   ]
     *                 }
     *               }
     *             ]
     *           },
     *           "cp_code": "YTO",
     *           "cp_type": 2
     *         },
     *         {
     *           "branch_account_cols": {
     *             "waybill_branch_account": [
     *               {
     *                 "allocated_quantity": 67,
     *                 "branch_code": "352289",
     *                 "branch_name": "江苏南通海门东城公司金盛超市分部",
     *                 "cancel_quantity": 5,
     *                 "print_quantity": 0,
     *                 "quantity": 1,
     *                 "shipp_address_cols": {
     *                   "waybill_address": [
     *                     {
     *                       "address_detail": "三星镇金色阳光花苑",
     *                       "area": "海门区",
     *                       "city": "南通市",
     *                       "province": "江苏省",
     *                       "waybill_address_id": 195470021
     *                     }
     *                   ]
     *                 }
     *               },
     *               {
     *                 "allocated_quantity": 0,
     *                 "branch_code": "581795",
     *                 "branch_name": "河北深泽县服务部",
     *                 "cancel_quantity": 0,
     *                 "print_quantity": 0,
     *                 "quantity": 0,
     *                 "shipp_address_cols": {
     *                   "waybill_address": [
     *                     {
     *                       "address_detail": "东环路洛曼家具",
     *                       "area": "深泽县",
     *                       "city": "石家庄市",
     *                       "province": "河北省",
     *                       "waybill_address_id": 228182374
     *                     }
     *                   ]
     *                 }
     *               }
     *             ]
     *           },
     *           "cp_code": "YUNDA",
     *           "cp_type": 2
     *         },
     *         {
     *           "branch_account_cols": {
     *             "waybill_branch_account": [
     *               {
     *                 "allocated_quantity": 108,
     *                 "branch_code": "3513238",
     *                 "branch_name": "南通海门绣女路网点",
     *                 "cancel_quantity": 3,
     *                 "print_quantity": 0,
     *                 "quantity": 0,
     *                 "shipp_address_cols": {
     *                   "waybill_address": [
     *                     {
     *                       "address_detail": "三星镇家纺城",
     *                       "area": "海门区",
     *                       "city": "南通市",
     *                       "province": "江苏省",
     *                       "waybill_address_id": 200644146
     *                     }
     *                   ]
     *                 }
     *               }
     *             ]
     *           },
     *           "cp_code": "HTKY",
     *           "cp_type": 2
     *         },
     *         {
     *           "branch_account_cols": {
     *             "waybill_branch_account": [
     *               {
     *                 "allocated_quantity": 144,
     *                 "branch_code": "POSTB",
     *                 "cancel_quantity": 42,
     *                 "print_quantity": 0,
     *                 "quantity": 0,
     *                 "shipp_address_cols": {
     *                   "waybill_address": [
     *                     {
     *                       "address_detail": "东环路洛曼家具",
     *                       "area": "深泽县",
     *                       "city": "石家庄市",
     *                       "province": "河北省",
     *                       "waybill_address_id": 223634022
     *                     }
     *                   ]
     *                 }
     *               }
     *             ]
     *           },
     *           "cp_code": "POSTB",
     *           "cp_type": 1
     *         },
     *         {
     *           "branch_account_cols": {
     *             "waybill_branch_account": [
     *               {
     *                 "allocated_quantity": 0,
     *                 "branch_code": "660605",
     *                 "branch_name": "南海区站点",
     *                 "cancel_quantity": 0,
     *                 "print_quantity": 0,
     *                 "quantity": 1000,
     *                 "shipp_address_cols": {
     *                   "waybill_address": [
     *                     {
     *                       "address_detail": "九江镇九江大道珠银库房A1栋（京东仓）",
     *                       "area": "南海区",
     *                       "city": "佛山市",
     *                       "province": "广东省",
     *                       "waybill_address_id": 242872489
     *                     }
     *                   ]
     *                 }
     *               },
     *               {
     *                 "allocated_quantity": 12,
     *                 "branch_code": "682387",
     *                 "branch_name": "都江堰市网点",
     *                 "cancel_quantity": 10,
     *                 "print_quantity": 0,
     *                 "quantity": 19988,
     *                 "shipp_address_cols": {
     *                   "waybill_address": [
     *                     {
     *                       "address_detail": "四川省成都市都江堰市四川都江堰经济开发区团结路 32响",
     *                       "area": "都江堰市",
     *                       "city": "成都市",
     *                       "province": "四川省",
     *                       "waybill_address_id": 211952169
     *                     }
     *                   ]
     *                 }
     *               }
     *             ]
     *           },
     *           "cp_code": "CP446881",
     *           "cp_type": 2
     *         }
     *       ]
     *     }
     *   }
     * }
     */


    /**
     * 2、cainiao.waybill.ii.get( 电子面单云打印接口 )
     * 参数：
     * {
     *     "cp_code": "CP446881",
     *     "sender": {
     *         "address": {
     *             "city": "佛山市",
     *             "detail": "九江镇九江大道珠银库房A1栋（京东仓）",
     *             "district": "南海区",
     *             "province": "广东省",
     *             "town": ""
     *         },
     *         "mobile": "1326443654",
     *         "name": "Bar",
     *         "phone": "057123222"
     *     },
     *     "trade_order_info_dtos": [
     *         {
     *             "object_id": "12345678",
     *             "order_info": {
     *                 "order_channels_type": "TB",
     *                 "out_trade_order_list": "123456,456789",
     *                 "out_trade_sub_order_list": "12,34,56,78",
     *                 "trade_order_list": "1222221"
     *             },
     *             "package_info": {
     *                 "good_value": "34.3",
     *                 "goods_description": "服装",
     *                 "height": 50,
     *                 "id": "1",
     *                 "items": [
     *                     {
     *                         "count": 1,
     *                         "name": "衣服"
     *                     }
     *                 ],
     *                 "length": 30,
     *                 "packaging_description": "5纸3木2拖",
     *                 "total_packages_count": 10,
     *                 "volume": 1,
     *                 "weight": 1,
     *                 "width": 30
     *             },
     *             "recipient": {
     *                 "address": {
     *                     "city": "北京市",
     *                     "detail": "花家地社区卫生服务站",
     *                     "district": "朝阳区",
     *                     "province": "北京",
     *                     "town": "望京街道"
     *                 },
     *                 "caid": "As268woscee",
     *                 "mobile": "1326443654",
     *                 "name": "Bar",
     *                 "oaid": "1lYuAqyrrl8696KR75icIq6YJII0ibvb8NiaT14Jh0XdBfzQnLfXp5PuqON8rjHTVibTKOQ9aZ",
     *                 "phone": "057123222",
     *                 "tid": "3719055060544802021"
     *             },
     *             "template_url": "http://cloudprint.cainiao.com/template/standard/101",
     *             "user_id": 59972781
     *         }
     *     ]
     * }
     * 结果：
     * {
     *   "cainiao_waybill_ii_get_response": {
     *     "modules": {
     *       "waybill_cloud_print_response": [
     *         {
     *           "cp_code": "CP446881",
     *           "object_id": "12345678",
     *           "print_data": "{\"data\":{\"_dataFrom\":\"waybill\",\"_page_config\":{\"REQUEST_LAYERED_IMAGE\":false},\"adsInfo\":{\"adId\":\"3\",\"advertisementType\":\"DEFAULT\",\"bannerUrl\":\"https://ad-cdn.cainiao.com/img/3/1672122736541.png\",\"miniBannerUrl\":\"https://ad-cdn.cainiao.com/img/3/1672122733813.png\",\"useCustomArea\":false},\"cpCode\":\"CP446881\",\"extraInfo\":{\"appKey\":\"12175777\",\"templateAdDisplayUp\":true,\"encryptWaybillCode\":\"zG7MEOejeVDcuQt6QsjCsA%3D%3D\"},\"needEncrypt\":false,\"orderChannelLogo\":\"https://cdn-cloudprint.cainiao.com/waybill-print/templateImages/tao.png\",\"orderChannelsType\":\"TB\",\"packageInfo\":{\"goodValue\":34.3,\"goodsDescription\":\"服装\",\"height\":50,\"id\":\"1\",\"items\":[{\"count\":1,\"name\":\"衣服\"}],\"length\":30,\"packagingDescription\":\"5纸3木2拖\",\"totalPackagesCount\":10,\"volume\":1,\"weight\":1,\"width\":30},\"parent\":false,\"realCpCode\":\"CP446881\",\"recipient\":{\"address\":{\"city\":\"北京市\",\"detail\":\"AES:RomTZ9FHeg4LOQTx2lyM17d9fJHmOF3PGgsIV0mH13Eb0dd50rNzcNYT4ypTQzqghI04MdngeEM6JEDwnSFgHA==\",\"district\":\"朝阳区\",\"province\":\"北京\",\"town\":\"望京街道\"},\"caid\":\"As268woscee\",\"mobile\":\"13260469442-4846\",\"name\":\"李*\",\"secretConsigneeMobile\":\"13260469442-4846\",\"tid\":\"3719055060544802021\"},\"routingExtraInfo\":{},\"routingInfo\":{\"consolidation\":{},\"origin\":{\"code\":\"660605\",\"name\":\"南海区站点\"},\"receiveBranch\":{},\"sortation\":{},\"startCenter\":{},\"terminalCenter\":{}},\"secretWaybillType\":\"recipientSecret\",\"sender\":{\"address\":{\"city\":\"佛山市\",\"detail\":\"九江镇九江大道珠银库房A1栋（京东仓）\",\"district\":\"南海区\",\"province\":\"广东省\"},\"mobile\":\"1326443654\",\"name\":\"Bar\",\"phone\":\"057123222\"},\"shippingOption\":{\"code\":\"STANDARD_EXPRESS\",\"title\":\"标准快递\"},\"waybillCode\":\"700059605746\"},\"signature\":\"MD:Aznc5rkMLD16KZwMbdWBtQ==\",\"templateURL\":\"http://cloudprint.cainiao.com/template/standard/101\",\"ver\":\"waybill_print_secret_version_1\"}",
     *           "real_cp_code": "CP446881",
     *           "waybill_code": "700059605746"
     *         }
     *       ]
     *     },
     *     "request_id": "16m8eoa4augpd"
     *   }
     * }
     */
}
