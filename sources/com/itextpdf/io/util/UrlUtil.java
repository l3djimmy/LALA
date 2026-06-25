package com.itextpdf.io.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
/* loaded from: classes12.dex */
public final class UrlUtil {
    private UrlUtil() {
    }

    public static URL toURL(String filename) throws MalformedURLException {
        try {
            URL url = new URL(filename);
            return url;
        } catch (MalformedURLException e) {
            URL url2 = new File(filename).toURI().toURL();
            return url2;
        }
    }

    public static URI toNormalizedURI(String filename) {
        return toNormalizedURI(new File(filename));
    }

    public static URI toNormalizedURI(File file) {
        return file.toURI().normalize();
    }

    public static InputStream openStream(URL url) throws IOException {
        return url.openStream();
    }

    public static String getFileUriString(String filename) throws MalformedURLException {
        return new File(filename).toURI().toURL().toExternalForm();
    }

    public static String getNormalizedFileUriString(String filename) {
        return "file://" + toNormalizedURI(filename).getPath();
    }

    public static InputStream getInputStreamOfFinalConnection(URL initialUrl) throws IOException {
        URLConnection finalConnection = getFinalConnection(initialUrl);
        return finalConnection.getInputStream();
    }

    static URLConnection getFinalConnection(URL initialUrl) throws IOException {
        URL nextUrl = initialUrl;
        URLConnection connection = null;
        while (nextUrl != null) {
            connection = nextUrl.openConnection();
            String location = connection.getHeaderField("location");
            nextUrl = location == null ? null : new URL(location);
            if (nextUrl != null) {
                connection.getInputStream().close();
            }
        }
        return connection;
    }
}
