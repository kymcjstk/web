package com.b2b.inipay.utll;

import org.apache.commons.io.IOUtils;

import lombok.Getter;
import lombok.Setter;

import org.apache.http.HttpEntity;
import org.apache.http.HttpException;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * INIpaySample_v1.3.jar
 * com/inicis/std/util/HttpUtil.class
 * 객체가 기능이 부족하여 개선
 *
 * @author yongseoklee
 */
public class HttpClient {

    public static final String UTF_8 = "UTF-8";

    public static final String EUC_KR = "EUC-KR";

    private static final RequestConfig DEFAULT_REQUEST_CONFIG = RequestConfig.custom()
            .setSocketTimeout(25000)
            .setConnectTimeout(5000)
            .build();

    @Getter
    @Setter
    public RequestConfig config = DEFAULT_REQUEST_CONFIG;

    public String executeAsString(String url, Map<String, String> params) {
        List<NameValuePair> _params = convertMap2NameValuePair(params);

        return executeAsString(url, _params, UTF_8);
    }

    public String executeAsString(String url, Map<String, String> params, String charset) {
        List<NameValuePair> _params = convertMap2NameValuePair(params);

        return executeAsString(url, _params, charset);
    }

    public String executeAsString(String url, List<NameValuePair> params, String charset) {
        try {
            HttpPost request = new HttpPost(url);
            request.setHeader("Connection", "close");
            request.setHeader("Cache-Control", "no-cache");
            if (params != null) {
                UrlEncodedFormEntity entity = charset == null
                        ? new UrlEncodedFormEntity(params) : new UrlEncodedFormEntity(params, charset);
                request.setEntity(entity);
            }

            CloseableHttpClient httpClient = HttpClients
                    .custom()
                    .setDefaultRequestConfig(getConfig())
                    .build();

            CloseableHttpResponse response = httpClient.execute(request);

            int statusCode = response.getStatusLine().getStatusCode();
            if (!(statusCode == HttpStatus.SC_OK || statusCode == HttpStatus.SC_CREATED)) {
                throw new HttpException("서버응답 에러 (" + statusCode + ")");
            }

            HttpEntity entity = response.getEntity();

            return IOUtils.toString(entity.getContent(), charset);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private List<NameValuePair> convertMap2NameValuePair(Map<String, String> params) {
        List<NameValuePair> _params = new ArrayList<>();
        if (params != null) {
            for (String key : params.keySet()) {
                _params.add(new BasicNameValuePair(key, params.get(key)));
            }
        }

        return _params;
    }

}