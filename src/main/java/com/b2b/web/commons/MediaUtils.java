package com.b2b.web.commons;

import org.springframework.http.MediaType;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

// 이미지 파일 유무 검토 클래스
public class MediaUtils {

    private static Map<String, MediaType> mediaMap;

    // meidaMap에 이미지확장자명에 따른 MINEType 저장
    static {
        mediaMap = new HashMap<>();
        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaMap.put("GIF", MediaType.IMAGE_GIF);
        mediaMap.put("PNG", MediaType.IMAGE_PNG);
    }

    public static MediaType getMediaType(String type) {
        // 이미지 MINEType 꺼내서 반환, 이미지 파일이 아닐 경우 null 반환
        return mediaMap.get(type.toUpperCase());
    }
    
    //외부호출용 테스트
    public static void print_historyback(HttpServletResponse response) throws IOException
    {
    	response.setContentType("text/html; charset=UTF-8");
    	PrintWriter out = response.getWriter();
    	out.println("<script>alert('해당 게시물이 존재하지 않습니다.'); history.go(-1);</script>");
    	out.flush();;
    	return;
    }
}
