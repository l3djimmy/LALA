package com.itextpdf.commons.bouncycastle.operator.jcajce;

import com.itextpdf.commons.bouncycastle.operator.AbstractOperatorCreationException;
import com.itextpdf.commons.bouncycastle.operator.IContentVerifierProvider;
import java.security.PublicKey;
/* loaded from: classes12.dex */
public interface IJcaContentVerifierProviderBuilder {
    IContentVerifierProvider build(PublicKey publicKey) throws AbstractOperatorCreationException;

    IJcaContentVerifierProviderBuilder setProvider(String str);
}
