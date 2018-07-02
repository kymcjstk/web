package com.b2b.inipay.utll;

import java.security.MessageDigest;
import java.security.SignatureException;
import java.util.Calendar;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import java.util.Map.Entry;

/**
 * INIpaySample_v1.3.jar
 * com/inicis/std/util/SignatureUtil.class
 */
@SuppressWarnings({"unchecked", "cast", "rawtypes"})
public class SignatureUtil {

    protected static final String UTF_8_Encoding = "UTF-8";

    public static final String SIGNATURE_KEYNAME = "signKey";
    public static final String HMAC_SHA1_ALGORITHM = "HmacSHA1";
    public static final String HMAC_SHA256_ALGORITHM = "HmacSHA256";
    public static final String NewLine = "\n";
    public static final String EmptyUriPath = "/";
    public static final String Equals = "=";
    public static final String And = "&";

    private SignatureUtil() {
    }

    public static String getTimestamp() {
        Calendar cal = Calendar.getInstance();
        return String.valueOf(cal.getTimeInMillis());
    }

    public static String makeSignature(Map<String, String> parameters) throws Exception {
        if (parameters != null && !parameters.isEmpty()) {
            String parametersString = calculateString(parameters);
            String signature = hash(parametersString, "SHA-256");
            return signature;
        } else {
            throw new RuntimeException("Parameters can not be empty.");
        }
    }

    public static String makeSignatureAuth(Map<String, String> parameters) throws Exception {
        if (parameters != null && !parameters.isEmpty()) {
            String stringToSign = "";
            String mid = (String) parameters.get("mid");
            String tstamp = (String) parameters.get("tstamp");
            String MOID = (String) parameters.get("MOID");
            String TotPrice = (String) parameters.get("TotPrice");
            String tstampKey = ((String) parameters.get("tstamp")).substring(((String) parameters.get("tstamp")).length() - 1);
            switch (Integer.parseInt(tstampKey)) {
                case 0:
                    stringToSign = "TotPrice=" + TotPrice + "&tstamp=" + tstamp + "&MOID=" + MOID;
                    break;
                case 1:
                    stringToSign = "MOID=" + MOID + "&mid=" + mid + "&tstamp=" + tstamp;
                    break;
                case 2:
                    stringToSign = "MOID=" + MOID + "&tstamp=" + tstamp + "&mid=" + mid;
                    break;
                case 3:
                    stringToSign = "mid=" + mid + "&MOID=" + MOID + "&tstamp=" + tstamp;
                    break;
                case 4:
                    stringToSign = "mid=" + mid + "&tstamp=" + tstamp + "&MOID=" + MOID;
                    break;
                case 5:
                    stringToSign = "tstamp=" + tstamp + "&mid=" + mid + "&MOID=" + MOID;
                    break;
                case 6:
                    stringToSign = "tstamp=" + tstamp + "&MOID=" + MOID + "&mid=" + mid;
                    break;
                case 7:
                    stringToSign = "TotPrice=" + TotPrice + "&mid=" + mid + "&tstamp=" + tstamp;
                    break;
                case 8:
                    stringToSign = "TotPrice=" + TotPrice + "&tstamp=" + tstamp + "&mid=" + mid;
                    break;
                case 9:
                    stringToSign = "TotPrice=" + TotPrice + "&MOID=" + MOID + "&tstamp=" + tstamp;
            }

            String signature = hash(stringToSign, "SHA-256");
            return signature;
        } else {
            throw new RuntimeException("Parameters can not be empty.");
        }
    }

    public static String hash(String data, String algorithm) throws Exception {
        MessageDigest md = MessageDigest.getInstance(algorithm);
        md.update(data.getBytes("UTF-8"));
        byte[] hashbytes = md.digest();
        StringBuilder sbuilder = new StringBuilder();

        for (int i = 0; i < hashbytes.length; ++i) {
            sbuilder.append(String.format("%02x", new Object[]{Integer.valueOf(hashbytes[i] & 255)}));
        }

        return sbuilder.toString();
    }

    private static String calculateString(Map<String, String> parameters) throws SignatureException {
        StringBuffer stringToSign = new StringBuffer("");
        Map<String, String> sortedParamMap = new TreeMap();
        sortedParamMap.putAll(parameters);
        Iterator pairs = sortedParamMap.entrySet().iterator();

        while (pairs.hasNext()) {
            Entry<String, String> pair = (Entry) pairs.next();
            stringToSign.append(((String) pair.getKey()).trim());
            stringToSign.append("=");
            stringToSign.append(((String) pair.getValue()).trim());
            if (pairs.hasNext()) {
                stringToSign.append("&");
            }
        }

        return stringToSign.toString();
    }

}