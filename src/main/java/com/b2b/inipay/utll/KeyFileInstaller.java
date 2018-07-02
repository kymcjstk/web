package com.b2b.inipay.utll;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.SystemUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.attribute.PosixFilePermission;
import java.util.EnumSet;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/**
 * 이니페이 키파일 인스톨러
 *
 * @author yongseoklee
 */
@Slf4j
public final class KeyFileInstaller {

    private KeyFileInstaller() {

    }

    /**
     * Unix 777 permission
     */
    private static final Set<PosixFilePermission> POSIX_777 =
            EnumSet.of(
                    PosixFilePermission.OWNER_READ,
                    PosixFilePermission.OWNER_WRITE,
                    PosixFilePermission.OWNER_EXECUTE,

                    PosixFilePermission.GROUP_READ,
                    PosixFilePermission.GROUP_WRITE,
                    PosixFilePermission.GROUP_EXECUTE,

                    PosixFilePermission.OTHERS_READ,
                    PosixFilePermission.OTHERS_WRITE,
                    PosixFilePermission.OTHERS_EXECUTE
            );

    /**
     * 설치
     *
     * @param keyFile
     * @param installPath 설치폴더
     * @return KCP Home 경로
     * @throws IOException
     */
    public static String install(final String keyFile, final String installPath) {
        try {
            // 설치경로
            File installDir;
            if (installPath == null || "".equals(installPath.trim()))
                installDir = new File(SystemUtils.JAVA_IO_TMPDIR, "inipayhome");
            else
                installDir = new File(installPath);
            log.debug("[KeyFileInstaller] Install path: {}", installDir);

            InputStream keyFileInputStream = KeyFileInstaller.class.getClassLoader().getResourceAsStream(keyFile);
            ZipInputStream keyFileZip = new ZipInputStream(keyFileInputStream);

            for (ZipEntry entry = keyFileZip.getNextEntry(); entry != null; entry = keyFileZip.getNextEntry()) {
                File destFile = new File(installDir, entry.getName());
                log.debug("[KeyFileInstaller] Unzip: {}", entry);

                if (entry.isDirectory()) {
                    FileUtils.forceMkdir(destFile);
                } else {
                    FileOutputStream os = null;
                    try {
                        os = new FileOutputStream(destFile);
                        IOUtils.copy(keyFileZip, os);
                        keyFileZip.closeEntry();

                        // Linux 경우 755 퍼미션 설정
                        if (SystemUtils.IS_OS_LINUX)
                            Files.setPosixFilePermissions(Paths.get(destFile.getCanonicalPath()), POSIX_777);
                    } finally {
                        IOUtils.closeQuietly(os);
                    }
                }
            }

            log.debug("[KeyFileInstaller] Completed");

            return installDir.getCanonicalPath();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
