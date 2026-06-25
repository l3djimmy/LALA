package com.itextpdf.commons.bouncycastle.operator.jcajce;

import com.itextpdf.commons.bouncycastle.operator.AbstractOperatorCreationException;
import com.itextpdf.commons.bouncycastle.operator.IContentSigner;
import java.security.PrivateKey;
/* loaded from: classes12.dex */
public interface IJcaContentSignerBuilder {
    IContentSigner build(PrivateKey privateKey) throws AbstractOperatorCreationException;

    IJcaContentSignerBuilder setProvider(String str);
}
