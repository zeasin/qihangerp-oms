package cn.qihangerp.gateway;

public class RestResult<T> {
    private int status;
    private String message;
    private T data; // 可选字段，根据需要返回数据

    public RestResult(int status, String message) {
        this.status = status;
        this.message = message;
    }

    // getter 和 setter
    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }
}
