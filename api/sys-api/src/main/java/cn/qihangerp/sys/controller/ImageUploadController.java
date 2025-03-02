package cn.qihangerp.sys.controller;


import cn.qihangerp.common.AjaxResult;
import cn.qihangerp.common.utils.FileUtils;
import com.alibaba.fastjson2.JSONObject;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Properties;

@RestController
public class ImageUploadController {

    @RequestMapping("/images/upload")
    public AjaxResult uploadImage(MultipartFile file) throws IOException {
        if (file.isEmpty()) return AjaxResult.error(400, "请选择图片");
        String fileSuffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1, file.getOriginalFilename().length());
        ArrayList<String> a = new ArrayList<>();
        a.add("gif");
        a.add("jpg");
        a.add("jpeg");
        a.add("png");
        if (a.contains(fileSuffix) == false) return AjaxResult.error(400, "不支持的格式");
        String fileName = file.getOriginalFilename();
        //appid配置
        Properties properties = PropertiesLoaderUtils.loadAllProperties("config.properties");
        String qiniu_img_domain = properties.getProperty("qiniu_img_domain");
        String qiniu_access_key = properties.getProperty("qiniu_access_key");
        String qiniu_secret_key = properties.getProperty("qiniu_secret_key");
        String qiniu_bucket = properties.getProperty("qiniu_bucket");
        if(StringUtils.isBlank(qiniu_img_domain)) return AjaxResult.error("请配置七牛云参数");
        if(StringUtils.isBlank(qiniu_access_key)) return AjaxResult.error("请配置七牛云参数");
        if(StringUtils.isBlank(qiniu_secret_key)) return AjaxResult.error("请配置七牛云参数");
        if(StringUtils.isBlank(qiniu_bucket)) return AjaxResult.error("请配置七牛云参数");

        Auth auth = Auth.create(qiniu_access_key, qiniu_secret_key);

        String upToken = auth.uploadToken(qiniu_bucket);//上传的凭据

        //构造一个带指定Zone对象的配置类
        Configuration cfg = new Configuration(Zone.zone0());

        UploadManager uploadManager = new UploadManager(cfg);
        //默认不指定key的情况下，以文件内容的hash值作为文件名
        String key = null;
//        Response response = uploadManager.put(file, key, upToken);
        try {
            Response response = uploadManager.put(file.getInputStream(), key, upToken, null, null);
            //解析上传成功的结果
            var res = JSONObject.parseObject(response.bodyString());

            String url = qiniu_img_domain + res.getString("key");
            AjaxResult ajax = AjaxResult.success();
            ajax.put("url", url);
            ajax.put("fileName", fileName);
            ajax.put("newFileName", FileUtils.getName(fileName));
            ajax.put("originalFilename", file.getOriginalFilename());
            return ajax;
        } catch (QiniuException ex) {
            Response r = ex.response;

            System.err.println(r.toString());
            try {
                System.err.println(r.bodyString());
                return AjaxResult.error(500, r.bodyString());
            } catch (QiniuException ex2) {
                //ignore
                return AjaxResult.error(500, "图片上传错误");
            }
        } catch (IOException e) {
            e.printStackTrace();
            return AjaxResult.error(400, "图片格式错误");
        }
    }
}
