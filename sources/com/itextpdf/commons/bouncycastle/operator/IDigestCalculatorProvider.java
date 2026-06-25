package com.itextpdf.commons.bouncycastle.operator;

import com.itextpdf.commons.bouncycastle.asn1.x509.IAlgorithmIdentifier;
/* loaded from: classes12.dex */
public interface IDigestCalculatorProvider {
    IDigestCalculator get(IAlgorithmIdentifier iAlgorithmIdentifier) throws AbstractOperatorCreationException;
}
