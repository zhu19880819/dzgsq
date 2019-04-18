package com.thinkgem.jeesite.common.web;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.common.io.ByteStreams;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

@Controller
@RequestMapping(value = "${adminPath}/kindeditor")
public class AdminKindEditorController extends BaseController{

	@RequestMapping(value = "fileUpload")
	@ResponseBody
    public Map<String, Object> fileUpload(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException,
            FileUploadException {
        String savePath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL;
        String saveUrl=request.getContextPath()+Global.USERFILES_BASE_URL;
        String loginName=UserUtils.getUser().getLoginName();
        if(StringUtils.isNotEmpty(loginName)){
        	savePath+=loginName+"/";
        	saveUrl+=loginName+"/";
        }else{
        	savePath+="other/";
        	saveUrl+="other/";
        }
        // 定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("voice", "mp3,wma,wav,amr");
        extMap.put("media", "mp4");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
        extMap.put("all", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,gif,jpg,jpeg,png,bmp,doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
        // 最大文件大小10M
        long maxSize = 10485760;

        response.setContentType("text/html; charset=UTF-8");

        if (!ServletFileUpload.isMultipartContent(request)) {
            return getError("请选择文件。");
        }
        // 检查目录
        File uploadDir = new File(savePath);
        if (!uploadDir.isDirectory()) {
        	uploadDir.mkdirs();
        }
        // 检查目录写权限
        if (!uploadDir.canWrite()) {
            return getError("上传目录没有写权限。");
        }

        String dirName = request.getParameter("dir");
        if (dirName == null) {
            dirName = "image";
        }
        if (!extMap.containsKey(dirName)) {
            return getError("目录名不正确。");
        }
        // 创建文件夹
        savePath += dirName + "/";
        saveUrl += dirName + "/";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        savePath += ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }

        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setHeaderEncoding("UTF-8");


        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        
        Iterator item = multipartRequest.getFileNames();
        while (item.hasNext()) {

            String fileName = (String) item.next();

            MultipartFile file = multipartRequest.getFile(fileName);
            // 检查文件大小
            if (file.getSize() > maxSize) {
                return getError("上传文件大小超过限制。");
            }
            // 检查扩展名
            String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1).toLowerCase();
            if (!Arrays. asList(extMap.get(dirName).split(",")).contains(fileExt)) {
                return getError("上传文件扩展名是不允许的扩展名。\n只允许"
                        + extMap.get(dirName) + "格式。");

            }
            SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");

            String newFileName = file.getOriginalFilename().replace("." + fileExt, "")+"_"+df.format(new Date()) + "." + fileExt;

            try {

            File uploadedFile = new File(savePath, newFileName);

            ByteStreams.copy(file.getInputStream(), new FileOutputStream(uploadedFile));

            } catch (Exception e) {

                return getError("上传文件失败。");

            }
            Map<String, Object> msg = new HashMap<String, Object>();
            msg.put("error", 0);
            msg.put("url", saveUrl + newFileName);
            return msg;
        }
        return null;
    }

    private Map<String, Object> getError(String message) {
        Map<String, Object> msg = new HashMap<String, Object>();
        msg.put("error", 1);
        msg.put("message", message);
        return msg;
    }

    @RequestMapping(value = "/fileManager")
    public void fileManager(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	//获取输出流
    	PrintWriter out = response.getWriter(); 
        // 根目录路径，可以指定绝对路径，比如 /var/www/attached/
    	String defaultBaseDir = request.getSession().getServletContext().getRealPath("/");
        String rootPath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL;
        // 根目录URL，可以指定绝对路径，比如 http://www.yoursite.com/attached/
        String rootUrl = Global.USERFILES_BASE_URL;
        if(UserUtils.getUser().isAdmin()==false){
        	String loginName=UserUtils.getUser().getLoginName();
            if(StringUtils.isNotEmpty(loginName)){
            	rootPath+=loginName+"/";
            	rootUrl+=loginName+"/";
            }else{
            	rootPath+="other/";
            	rootUrl+="other/";
            }
        }
        // 图片扩展名
        String[] fileTypes = new String[] { "gif", "jpg", "jpeg", "png", "bmp" };

        String dirName = request.getParameter("dir");
        if (dirName != null) {
            if (!Arrays.<String> asList(
                    new String[] { "image", "flash", "media", "file" })
                    .contains(dirName)) {
                out.println("文件扩展名是不允许的扩展名！");
                return;
            }
            File saveDirFile = new File(rootPath);
            if (!saveDirFile.exists()) {
                saveDirFile.mkdirs();
            }
        }
        // 根据path参数，设置各路径和URL
        String path = request.getParameter("path") != null ? request
                .getParameter("path") : "";
        String currentPath = rootPath + path;
        String currentUrl = request.getSession().getServletContext().getContextPath()+rootUrl + path;
        String currentDirPath = path;
        String moveupDirPath = "";
        if (!"".equals(path)) {
            String str = currentDirPath.substring(0,
                    currentDirPath.length() - 1);
            moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0,
                    str.lastIndexOf("/") + 1) : "";
        }

        // 排序形式，name or size or type
        String order = request.getParameter("order") != null ? request
                .getParameter("order").toLowerCase() : "name";

        // 不允许使用..移动到上一级目录
        if (path.indexOf("..") >= 0) {
            out.println("不允许使用..移动到上一级目录!");
            return;
        }
        // 最后一个字符不是/
        if (!"".equals(path) && !path.endsWith("/")) {
            out.println("最后一个字符不是/");
            return;
        }
        // 目录不存在或不是目录
        File currentPathFile = new File(currentPath);
        if (!currentPathFile.isDirectory()) {
            out.println("目录不存在或不是目录");
            return;
        }
        // 遍历目录取的文件信息
        List<Hashtable> fileList = new ArrayList<Hashtable>();
        if (currentPathFile.listFiles() != null) {
            for (File file : currentPathFile.listFiles()) {
                Hashtable<String, Object> hash = new Hashtable<String, Object>();
                String fileName = file.getName();
                if (file.isDirectory()) {
                    hash.put("is_dir", true);
                    hash.put("has_file", (file.listFiles() != null));
                    hash.put("filesize", 0L);
                    hash.put("is_photo", false);
                    hash.put("filetype", "");
                } else if (file.isFile()) {
                    String fileExt = fileName.substring(
                            fileName.lastIndexOf(".") + 1).toLowerCase();
                    hash.put("is_dir", false);
                    hash.put("has_file", false);
                    hash.put("filesize", file.length());
                    hash.put("is_photo", Arrays.<String> asList(fileTypes)
                            .contains(fileExt));
                    hash.put("filetype", fileExt);
                }
                hash.put("filename", fileName);
                hash.put("datetime",
                        new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file
                                .lastModified()));
                fileList.add(hash);
            }
        }

        if ("size".equals(order)) {
            Collections.sort(fileList, new SizeComparator());
        } else if ("type".equals(order)) {
            Collections.sort(fileList, new TypeComparator());
        } else {
            Collections.sort(fileList, new NameComparator());
        }
        Map<String, Object> msg = new HashMap<String, Object>();
        msg.put("moveup_dir_path", moveupDirPath);
        msg.put("current_dir_path", currentDirPath);
        msg.put("current_url", currentUrl);
        msg.put("total_count", fileList.size());
        msg.put("file_list", fileList);
        response.setContentType("application/json; charset=UTF-8");
        String msgStr = JsonMapper.getInstance().toJson(msg);
        out.println(msgStr);
    }

    class NameComparator implements Comparator {
        public int compare(Object a, Object b) {
            Hashtable hashA = (Hashtable) a;
            Hashtable hashB = (Hashtable) b;
            if (((Boolean) hashA.get("is_dir"))
                    && !((Boolean) hashB.get("is_dir"))) {
                return -1;
            } else if (!((Boolean) hashA.get("is_dir"))
                    && ((Boolean) hashB.get("is_dir"))) {
                return 1;
            } else {
                return ((String) hashA.get("filename"))
                        .compareTo((String) hashB.get("filename"));
            }
        }
    }

    class SizeComparator implements Comparator {
        public int compare(Object a, Object b) {
            Hashtable hashA = (Hashtable) a;
            Hashtable hashB = (Hashtable) b;
            if (((Boolean) hashA.get("is_dir"))
                    && !((Boolean) hashB.get("is_dir"))) {
                return -1;
            } else if (!((Boolean) hashA.get("is_dir"))
                    && ((Boolean) hashB.get("is_dir"))) {
                return 1;
            } else {
                if (((Long) hashA.get("filesize")) > ((Long) hashB
                        .get("filesize"))) {
                    return 1;
                } else if (((Long) hashA.get("filesize")) < ((Long) hashB
                        .get("filesize"))) {
                    return -1;
                } else {
                    return 0;
                }
            }
        }
    }

    class TypeComparator implements Comparator {
        public int compare(Object a, Object b) {
            Hashtable hashA = (Hashtable) a;
            Hashtable hashB = (Hashtable) b;
            if (((Boolean) hashA.get("is_dir"))
                    && !((Boolean) hashB.get("is_dir"))) {
                return -1;
            } else if (!((Boolean) hashA.get("is_dir"))
                    && ((Boolean) hashB.get("is_dir"))) {
                return 1;
            } else {
                return ((String) hashA.get("filetype"))
                        .compareTo((String) hashB.get("filetype"));
            }
        }
    }

}