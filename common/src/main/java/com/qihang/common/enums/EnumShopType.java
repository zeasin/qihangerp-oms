package com.qihang.common.enums;

/**
 * 描述：
 * 店铺类型Enum
 *
 * @author qlp
 * @date 2019-09-18 19:44
 */
public enum EnumShopType {
    ALI("1688", 1),
    WEI("视频号小店", 2),
    TAO("淘宝天猫", 4),
    JD("京东", 3),
    DOU("抖音", 6),
    XHS("小红书", 7),
    KWAI("快手小店", 8),
    PDD("拼多多", 5),
    OTHER("其他渠道", 99);
    private String name;
    private int index;

    // 构造方法
    private EnumShopType(String name, int index) {
        this.name = name;
        this.index = index;
    }

    // 普通方法
    public static String getName(int index) {
        for (EnumShopType c : EnumShopType.values()) {
            if (c.getIndex() == index) {
                return c.name;
            }
        }
        return null;
    }

    // get set 方法
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
