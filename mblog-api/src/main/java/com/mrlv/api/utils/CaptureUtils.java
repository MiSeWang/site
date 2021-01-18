package com.mrlv.api.utils;

import com.mrlv.api.MblogApiApplication;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

/**
 *  爬虫工具
 * @author mrlv
 */
public class CaptureUtils {


    public static void main(String[] args) {
        String url = "http://ak.mooncell.wiki/w/%E9%A6%96%E9%A1%B5";
        FileOutputStream fileOutputStream = null;
        FileChannel channel = null;
        try {
            Document document = Jsoup.connect(url).get();
            Elements links = document.select("a[href]");
            Elements media = document.select("[src]");
            Elements imports = document.select("link[href]");
            String path = CaptureUtils.class.getClass().getResource("/").getPath() + "/CaptureData/";

            File file = new File(path + "index.html");
            if (!file.getParentFile().exists()){
                file.getParentFile().mkdirs() ;
            }
            if (!file.exists()){
                file.createNewFile();
            }
            fileOutputStream = new FileOutputStream(file);
            channel = fileOutputStream.getChannel();
            ByteBuffer buf = ByteBuffer.wrap(document.toString().getBytes());
//            buf.flip();
            int bytesRead = channel.write(buf);
            System.out.println(bytesRead);

        } catch (IOException e) {
            e.printStackTrace();
        } finally{
            try {
                if(channel!=null) {
                    channel.close();
                }
                if(fileOutputStream!=null) {
                    fileOutputStream.close();
                }
            }catch(IOException ex){

            }
        }
    }

}
