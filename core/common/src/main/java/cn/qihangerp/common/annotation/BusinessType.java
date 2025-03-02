package cn.qihangerp.common.annotation;

/**
 * 业务操作类型
 * 
 * @author qihang
 */
public enum BusinessType
{
    /**
     * 其它
     */
    OTHER,

    /**
     * 接收推送
     */
    RECEIVE_PUSH,

    /**
     * 主动推送
     */
    ACTIVE_PUSH,

    /**
     * 手动拉取
     */
    HAND_PULL,
}
