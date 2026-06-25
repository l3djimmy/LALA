package com.itextpdf.kernel.crypto.securityhandler;

import com.itextpdf.io.logs.IoLogMessageConstant;
import com.itextpdf.io.util.StreamUtil;
import com.itextpdf.kernel.crypto.AESCipherCBCnoPad;
import com.itextpdf.kernel.crypto.AesDecryptor;
import com.itextpdf.kernel.crypto.IDecryptor;
import com.itextpdf.kernel.crypto.IVGenerator;
import com.itextpdf.kernel.crypto.OutputStreamAesEncryption;
import com.itextpdf.kernel.crypto.OutputStreamEncryption;
import com.itextpdf.kernel.exceptions.BadPasswordException;
import com.itextpdf.kernel.exceptions.KernelExceptionMessageConstant;
import com.itextpdf.kernel.exceptions.PdfException;
import com.itextpdf.kernel.pdf.PdfBoolean;
import com.itextpdf.kernel.pdf.PdfDictionary;
import com.itextpdf.kernel.pdf.PdfLiteral;
import com.itextpdf.kernel.pdf.PdfName;
import com.itextpdf.kernel.pdf.PdfNumber;
import com.itextpdf.kernel.pdf.PdfVersion;
import java.io.OutputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import kotlin.UByte;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes12.dex */
public class StandardHandlerUsingAes256 extends StandardSecurityHandler {
    private static final int KEY_SALT_OFFSET = 40;
    private static final int SALT_LENGTH = 8;
    private static final int VALIDATION_SALT_OFFSET = 32;
    protected boolean encryptMetadata;
    private boolean isPdf2;

    public StandardHandlerUsingAes256(PdfDictionary encryptionDictionary, byte[] userPassword, byte[] ownerPassword, int permissions, boolean encryptMetadata, boolean embeddedFilesOnly, PdfVersion version) {
        this.isPdf2 = version != null && version.compareTo(PdfVersion.PDF_2_0) >= 0;
        initKeyAndFillDictionary(encryptionDictionary, userPassword, ownerPassword, permissions, encryptMetadata, embeddedFilesOnly);
    }

    public StandardHandlerUsingAes256(PdfDictionary encryptionDictionary, byte[] password) {
        initKeyAndReadDictionary(encryptionDictionary, password);
    }

    public boolean isEncryptMetadata() {
        return this.encryptMetadata;
    }

    @Override // com.itextpdf.kernel.crypto.securityhandler.SecurityHandler
    public void setHashKeyForNextObject(int objNumber, int objGeneration) {
    }

    @Override // com.itextpdf.kernel.crypto.securityhandler.SecurityHandler
    public OutputStreamEncryption getEncryptionStream(OutputStream os) {
        return new OutputStreamAesEncryption(os, this.nextObjectKey, 0, this.nextObjectKeySize);
    }

    @Override // com.itextpdf.kernel.crypto.securityhandler.SecurityHandler
    public IDecryptor getDecryptor() {
        return new AesDecryptor(this.nextObjectKey, 0, this.nextObjectKeySize);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r2v0, types: [byte[]] */
    /* JADX WARN: Type inference failed for: r2v1 */
    /* JADX WARN: Type inference failed for: r2v3, types: [int] */
    private void initKeyAndFillDictionary(PdfDictionary encryptionDictionary, byte[] userPassword, byte[] ownerPassword, int permissions, boolean encryptMetadata, boolean embeddedFilesOnly) {
        byte[] userPassword2;
        byte[] ownerPassword2;
        byte[] userKey;
        byte[] ueKey;
        byte[] ownerKey;
        byte[] hash;
        ?? r2 = userPassword;
        byte[] ownerPassword3 = generateOwnerPasswordIfNullOrEmpty(ownerPassword);
        int permissions2 = (permissions | (-3904)) & (-4);
        try {
            if (r2 != 0) {
                if (r2.length <= 127) {
                    userPassword2 = r2;
                } else {
                    userPassword2 = Arrays.copyOf((byte[]) r2, 127);
                }
            } else {
                userPassword2 = new byte[0];
            }
            try {
                r2 = ownerPassword3.length;
                if (r2 <= 127) {
                    ownerPassword2 = ownerPassword3;
                } else {
                    ownerPassword2 = Arrays.copyOf(ownerPassword3, 127);
                }
                try {
                    byte[] userValAndKeySalt = IVGenerator.getIV(16);
                    byte[] ownerValAndKeySalt = IVGenerator.getIV(16);
                    this.nextObjectKey = IVGenerator.getIV(32);
                    this.nextObjectKeySize = 32;
                    byte[] hash2 = computeHash(userPassword2, userValAndKeySalt, 0, 8);
                    userKey = Arrays.copyOf(hash2, 48);
                    System.arraycopy(userValAndKeySalt, 0, userKey, 32, 16);
                    byte[] hash3 = computeHash(userPassword2, userValAndKeySalt, 8, 8);
                    AESCipherCBCnoPad ac = new AESCipherCBCnoPad(true, hash3);
                    ueKey = ac.processBlock(this.nextObjectKey, 0, this.nextObjectKey.length);
                    byte[] hash4 = computeHash(ownerPassword2, ownerValAndKeySalt, 0, 8, userKey);
                    ownerKey = Arrays.copyOf(hash4, 48);
                    System.arraycopy(ownerValAndKeySalt, 0, ownerKey, 32, 16);
                    hash = computeHash(ownerPassword2, ownerValAndKeySalt, 8, 8, userKey);
                } catch (Exception e) {
                    ex = e;
                }
            } catch (Exception e2) {
                ex = e2;
            }
        } catch (Exception e3) {
            ex = e3;
        }
        try {
            AESCipherCBCnoPad ac2 = new AESCipherCBCnoPad(true, hash);
            byte[] oeKey = ac2.processBlock(this.nextObjectKey, 0, this.nextObjectKey.length);
            byte[] permsp = IVGenerator.getIV(16);
            permsp[0] = (byte) permissions2;
            permsp[1] = (byte) (permissions2 >> 8);
            permsp[2] = (byte) (permissions2 >> 16);
            permsp[3] = (byte) (permissions2 >> 24);
            permsp[4] = -1;
            permsp[5] = -1;
            permsp[6] = -1;
            permsp[7] = -1;
            permsp[8] = encryptMetadata ? (byte) 84 : (byte) 70;
            permsp[9] = 97;
            permsp[10] = 100;
            permsp[11] = 98;
            AESCipherCBCnoPad ac3 = new AESCipherCBCnoPad(true, this.nextObjectKey);
            byte[] aes256Perms = ac3.processBlock(permsp, 0, permsp.length);
            this.permissions = permissions2;
            this.encryptMetadata = encryptMetadata;
            setStandardHandlerDicEntries(encryptionDictionary, userKey, ownerKey);
            setAES256DicEntries(encryptionDictionary, oeKey, ueKey, aes256Perms, encryptMetadata, embeddedFilesOnly);
        } catch (Exception e4) {
            ex = e4;
            throw new PdfException(KernelExceptionMessageConstant.PDF_ENCRYPTION, (Throwable) ex);
        }
    }

    private void setAES256DicEntries(PdfDictionary encryptionDictionary, byte[] oeKey, byte[] ueKey, byte[] aes256Perms, boolean encryptMetadata, boolean embeddedFilesOnly) {
        int i;
        encryptionDictionary.put(PdfName.OE, new PdfLiteral(StreamUtil.createEscapedString(oeKey)));
        encryptionDictionary.put(PdfName.UE, new PdfLiteral(StreamUtil.createEscapedString(ueKey)));
        encryptionDictionary.put(PdfName.Perms, new PdfLiteral(StreamUtil.createEscapedString(aes256Perms)));
        PdfName pdfName = PdfName.R;
        if (!this.isPdf2) {
            i = 5;
        } else {
            i = 6;
        }
        encryptionDictionary.put(pdfName, new PdfNumber(i));
        encryptionDictionary.put(PdfName.V, new PdfNumber(5));
        PdfDictionary stdcf = new PdfDictionary();
        stdcf.put(PdfName.Length, new PdfNumber(32));
        if (!encryptMetadata) {
            encryptionDictionary.put(PdfName.EncryptMetadata, PdfBoolean.FALSE);
        }
        if (embeddedFilesOnly) {
            stdcf.put(PdfName.AuthEvent, PdfName.EFOpen);
            encryptionDictionary.put(PdfName.EFF, PdfName.StdCF);
            encryptionDictionary.put(PdfName.StrF, PdfName.Identity);
            encryptionDictionary.put(PdfName.StmF, PdfName.Identity);
        } else {
            stdcf.put(PdfName.AuthEvent, PdfName.DocOpen);
            encryptionDictionary.put(PdfName.StrF, PdfName.StdCF);
            encryptionDictionary.put(PdfName.StmF, PdfName.StdCF);
        }
        stdcf.put(PdfName.CFM, PdfName.AESV3);
        PdfDictionary cf = new PdfDictionary();
        cf.put(PdfName.StdCF, stdcf);
        encryptionDictionary.put(PdfName.CF, cf);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r21v1 */
    /* JADX WARN: Type inference failed for: r21v3 */
    /* JADX WARN: Type inference failed for: r21v6 */
    private void initKeyAndReadDictionary(PdfDictionary encryptionDictionary, byte[] password) {
        int i;
        ?? r21;
        byte[] password2 = password;
        try {
            if (password2 == null) {
                password2 = new byte[0];
            } else if (password2.length > 127) {
                password2 = Arrays.copyOf(password2, 127);
            }
            try {
                this.isPdf2 = encryptionDictionary.getAsNumber(PdfName.R).getValue() == 6.0d;
                byte[] oValue = truncateArray(getIsoBytes(encryptionDictionary.getAsString(PdfName.O)));
                byte[] uValue = truncateArray(getIsoBytes(encryptionDictionary.getAsString(PdfName.U)));
                byte[] oeValue = getIsoBytes(encryptionDictionary.getAsString(PdfName.OE));
                byte[] ueValue = getIsoBytes(encryptionDictionary.getAsString(PdfName.UE));
                byte[] perms = getIsoBytes(encryptionDictionary.getAsString(PdfName.Perms));
                PdfNumber pValue = (PdfNumber) encryptionDictionary.get(PdfName.P);
                this.permissions = pValue.longValue();
                byte[] hash = computeHash(password2, oValue, 32, 8, uValue);
                this.usedOwnerPassword = compareArray(hash, oValue, 32);
                try {
                    if (this.usedOwnerPassword) {
                        i = 8;
                        r21 = 1;
                        try {
                            byte[] hash2 = computeHash(password2, oValue, 40, 8, uValue);
                            AESCipherCBCnoPad ac = new AESCipherCBCnoPad(false, hash2);
                            this.nextObjectKey = ac.processBlock(oeValue, 0, oeValue.length);
                        } catch (BadPasswordException ex) {
                            throw ex;
                        } catch (Exception e) {
                            ex = e;
                            throw new PdfException(KernelExceptionMessageConstant.PDF_ENCRYPTION, (Throwable) ex);
                        }
                    } else {
                        i = 8;
                        r21 = 1;
                        byte[] hash3 = computeHash(password2, uValue, 32, 8);
                        if (!compareArray(hash3, uValue, 32)) {
                            throw new BadPasswordException(KernelExceptionMessageConstant.BAD_USER_PASSWORD);
                        }
                        byte[] hash4 = computeHash(password2, uValue, 40, 8);
                        AESCipherCBCnoPad ac2 = new AESCipherCBCnoPad(false, hash4);
                        this.nextObjectKey = ac2.processBlock(ueValue, 0, ueValue.length);
                    }
                    this.nextObjectKeySize = 32;
                    AESCipherCBCnoPad ac3 = new AESCipherCBCnoPad(false, this.nextObjectKey);
                    byte[] decPerms = ac3.processBlock(perms, 0, perms.length);
                    boolean z = false;
                    if (decPerms[9] != 97 || decPerms[10] != 100 || decPerms[11] != 98) {
                        throw new BadPasswordException(KernelExceptionMessageConstant.BAD_USER_PASSWORD);
                    }
                    int permissionsDecoded = (decPerms[0] & UByte.MAX_VALUE) | ((decPerms[r21] & UByte.MAX_VALUE) << i) | ((decPerms[2] & UByte.MAX_VALUE) << 16) | ((decPerms[3] & UByte.MAX_VALUE) << 24);
                    if (decPerms[i] == 84) {
                        z = r21;
                    }
                    boolean encryptMetadata = z;
                    Boolean encryptMetadataEntry = encryptionDictionary.getAsBool(PdfName.EncryptMetadata);
                    if (permissionsDecoded != this.permissions || (encryptMetadataEntry != null && encryptMetadata != encryptMetadataEntry.booleanValue())) {
                        Logger logger = LoggerFactory.getLogger(StandardHandlerUsingAes256.class);
                        logger.error(IoLogMessageConstant.ENCRYPTION_ENTRIES_P_AND_ENCRYPT_METADATA_NOT_CORRESPOND_PERMS_ENTRY);
                    }
                    this.permissions = permissionsDecoded;
                    this.encryptMetadata = encryptMetadata;
                } catch (BadPasswordException ex2) {
                } catch (Exception e2) {
                    ex = e2;
                }
            } catch (BadPasswordException ex3) {
            } catch (Exception e3) {
                ex = e3;
            }
        } catch (BadPasswordException ex4) {
            throw ex4;
        } catch (Exception e4) {
            ex = e4;
        }
    }

    private byte[] computeHash(byte[] password, byte[] salt, int saltOffset, int saltLen) throws NoSuchAlgorithmException {
        return computeHash(password, salt, saltOffset, saltLen, null);
    }

    private byte[] computeHash(byte[] password, byte[] salt, int saltOffset, int saltLen, byte[] userKey) throws NoSuchAlgorithmException {
        MessageDigest md;
        byte[] bArr = password;
        byte[] bArr2 = userKey;
        MessageDigest mdSha256 = MessageDigest.getInstance("SHA-256");
        mdSha256.update(bArr);
        mdSha256.update(salt, saltOffset, saltLen);
        if (bArr2 != null) {
            mdSha256.update(bArr2);
        }
        byte[] k = mdSha256.digest();
        if (this.isPdf2) {
            MessageDigest mdSha384 = MessageDigest.getInstance("SHA-384");
            MessageDigest mdSha512 = MessageDigest.getInstance("SHA-512");
            int i = 0;
            int userKeyLen = bArr2 != null ? bArr2.length : 0;
            int passAndUserKeyLen = bArr.length + userKeyLen;
            int roundNum = 0;
            while (true) {
                int k1RepLen = k.length + passAndUserKeyLen;
                byte[] k1 = new byte[k1RepLen * 64];
                MessageDigest mdSha2562 = mdSha256;
                System.arraycopy(bArr, i, k1, i, bArr.length);
                System.arraycopy(k, i, k1, bArr.length, k.length);
                if (bArr2 != null) {
                    System.arraycopy(bArr2, i, k1, bArr.length + k.length, userKeyLen);
                }
                for (int i2 = 1; i2 < 64; i2++) {
                    System.arraycopy(k1, i, k1, k1RepLen * i2, k1RepLen);
                }
                AESCipherCBCnoPad cipher = new AESCipherCBCnoPad(true, Arrays.copyOf(k, 16), Arrays.copyOfRange(k, 16, 32));
                byte[] e = cipher.processBlock(k1, 0, k1.length);
                BigInteger i3 = new BigInteger(1, Arrays.copyOf(e, 16));
                int remainder = i3.remainder(BigInteger.valueOf(3L)).intValue();
                switch (remainder) {
                    case 0:
                        md = mdSha2562;
                        break;
                    case 1:
                        md = mdSha384;
                        break;
                    case 2:
                        md = mdSha512;
                        break;
                    default:
                        md = null;
                        break;
                }
                k = md.digest(e);
                roundNum++;
                if (roundNum > 63) {
                    int condVal = e[e.length - 1] & UByte.MAX_VALUE;
                    if (condVal <= roundNum - 32) {
                        int condVal2 = k.length;
                        return condVal2 == 32 ? k : Arrays.copyOf(k, 32);
                    }
                }
                bArr = password;
                bArr2 = userKey;
                mdSha256 = mdSha2562;
                i = 0;
            }
        } else {
            return k;
        }
    }

    private static boolean compareArray(byte[] a, byte[] b, int len) {
        for (int k = 0; k < len; k++) {
            if (a[k] != b[k]) {
                return false;
            }
        }
        return true;
    }

    private byte[] truncateArray(byte[] array) {
        if (array.length == 48) {
            return array;
        }
        for (int i = 48; i < array.length; i++) {
            if (array[i] != 0) {
                throw new PdfException(KernelExceptionMessageConstant.BAD_PASSWORD_HASH);
            }
        }
        byte[] truncated = new byte[48];
        System.arraycopy(array, 0, truncated, 0, 48);
        return truncated;
    }
}
