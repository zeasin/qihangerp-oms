package cn.qihangerp.enums;

/**
 * 描述：通用启用状态（0禁用 1启用）
 *
 * @author 老齐
 * @date 2026-10-21 10:00:00
 */
public enum EnumEnableStatus {
    DISABLED("禁用", 0),
    ENABLED("启用", 1)
    ;
    private String name;
    private int index;

    private EnumEnableStatus(String name, int index) {
        this.name = name;
        this.index = index;
    }

    public static String getName(int index) {
        for (EnumEnableStatus c : EnumEnableStatus.values()) {
            if (c.getIndex() == index) return c.name;
        }
        return null;
    }

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
