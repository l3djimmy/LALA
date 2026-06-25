package androidx.compose.ui.text.font;

import androidx.compose.ui.text.font.AsyncTypefaceCache;
import androidx.compose.ui.text.platform.SynchronizedObject;
import java.util.List;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.TuplesKt;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
/* compiled from: FontListFontFamilyTypefaceAdapter.kt */
@Metadata(d1 = {"\u0000,\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u001aR\u0010\u0000\u001a\u0016\u0012\f\u0012\n\u0012\u0004\u0012\u00020\u0003\u0018\u00010\u0002\u0012\u0004\u0012\u00020\u00040\u0001*\b\u0012\u0004\u0012\u00020\u00030\u00022\u0006\u0010\u0005\u001a\u00020\u00062\u0006\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\n2\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u00020\u0006\u0012\u0004\u0012\u00020\u00040\fH\u0002¨\u0006\r"}, d2 = {"firstImmediatelyAvailable", "Lkotlin/Pair;", "", "Landroidx/compose/ui/text/font/Font;", "", "typefaceRequest", "Landroidx/compose/ui/text/font/TypefaceRequest;", "asyncTypefaceCache", "Landroidx/compose/ui/text/font/AsyncTypefaceCache;", "platformFontLoader", "Landroidx/compose/ui/text/font/PlatformFontLoader;", "createDefaultTypeface", "Lkotlin/Function1;", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class FontListFontFamilyTypefaceAdapterKt {
    public static final /* synthetic */ Pair access$firstImmediatelyAvailable(List $receiver, TypefaceRequest typefaceRequest, AsyncTypefaceCache asyncTypefaceCache, PlatformFontLoader platformFontLoader, Function1 createDefaultTypeface) {
        return firstImmediatelyAvailable($receiver, typefaceRequest, asyncTypefaceCache, platformFontLoader, createDefaultTypeface);
    }

    public static final Pair<List<Font>, Object> firstImmediatelyAvailable(List<? extends Font> list, TypefaceRequest typefaceRequest, AsyncTypefaceCache asyncTypefaceCache, PlatformFontLoader platformFontLoader, Function1<? super TypefaceRequest, ? extends Object> function1) {
        Object result;
        Object m7341constructorimpl;
        Object result2;
        int size = list.size();
        List asyncFontsToLoad = null;
        for (int idx = 0; idx < size; idx++) {
            Font font = list.get(idx);
            int mo6395getLoadingStrategyPKNRLFQ = font.mo6395getLoadingStrategyPKNRLFQ();
            if (!FontLoadingStrategy.m6437equalsimpl0(mo6395getLoadingStrategyPKNRLFQ, FontLoadingStrategy.Companion.m6442getBlockingPKNRLFQ())) {
                if (!FontLoadingStrategy.m6437equalsimpl0(mo6395getLoadingStrategyPKNRLFQ, FontLoadingStrategy.Companion.m6443getOptionalLocalPKNRLFQ())) {
                    if (!FontLoadingStrategy.m6437equalsimpl0(mo6395getLoadingStrategyPKNRLFQ, FontLoadingStrategy.Companion.m6441getAsyncPKNRLFQ())) {
                        throw new IllegalStateException("Unknown font type " + font);
                    }
                    AsyncTypefaceCache.AsyncTypefaceResult cacheResult = asyncTypefaceCache.m6404get1ASDuI8(font, platformFontLoader);
                    if (cacheResult == null) {
                        if (asyncFontsToLoad == null) {
                            asyncFontsToLoad = CollectionsKt.mutableListOf(font);
                        } else {
                            asyncFontsToLoad.add(font);
                        }
                    } else if (!AsyncTypefaceCache.AsyncTypefaceResult.m6410isPermanentFailureimpl(cacheResult.m6412unboximpl()) && cacheResult.m6412unboximpl() != null) {
                        return TuplesKt.to(asyncFontsToLoad, FontSynthesis_androidKt.m6471synthesizeTypefaceFxwP2eA(typefaceRequest.m6496getFontSynthesisGVVA2EU(), cacheResult.m6412unboximpl(), font, typefaceRequest.getFontWeight(), typefaceRequest.m6495getFontStyle_LCdwA()));
                    }
                } else {
                    SynchronizedObject lock$iv$iv = asyncTypefaceCache.cacheLock;
                    synchronized (lock$iv$iv) {
                        AsyncTypefaceCache.Key key$iv = new AsyncTypefaceCache.Key(font, platformFontLoader.getCacheKey());
                        AsyncTypefaceCache.AsyncTypefaceResult priorResult$iv = (AsyncTypefaceCache.AsyncTypefaceResult) asyncTypefaceCache.resultCache.get(key$iv);
                        if (priorResult$iv == null) {
                            priorResult$iv = (AsyncTypefaceCache.AsyncTypefaceResult) asyncTypefaceCache.permanentCache.get(key$iv);
                        }
                        if (priorResult$iv == null) {
                            Unit unit = Unit.INSTANCE;
                            try {
                                Result.Companion companion = Result.Companion;
                                m7341constructorimpl = Result.m7341constructorimpl(platformFontLoader.loadBlocking(font));
                            } catch (Throwable th) {
                                Result.Companion companion2 = Result.Companion;
                                m7341constructorimpl = Result.m7341constructorimpl(ResultKt.createFailure(th));
                            }
                            if (Result.m7347isFailureimpl(m7341constructorimpl)) {
                                m7341constructorimpl = null;
                            }
                            result2 = m7341constructorimpl;
                            AsyncTypefaceCache.put$default(asyncTypefaceCache, font, platformFontLoader, result2, false, 8, null);
                        } else {
                            result2 = priorResult$iv.m6412unboximpl();
                        }
                    }
                    if (result2 != null) {
                        return TuplesKt.to(asyncFontsToLoad, FontSynthesis_androidKt.m6471synthesizeTypefaceFxwP2eA(typefaceRequest.m6496getFontSynthesisGVVA2EU(), result2, font, typefaceRequest.getFontWeight(), typefaceRequest.m6495getFontStyle_LCdwA()));
                    }
                }
            } else {
                SynchronizedObject lock$iv$iv2 = asyncTypefaceCache.cacheLock;
                synchronized (lock$iv$iv2) {
                    AsyncTypefaceCache.Key key$iv2 = new AsyncTypefaceCache.Key(font, platformFontLoader.getCacheKey());
                    AsyncTypefaceCache.AsyncTypefaceResult priorResult$iv2 = (AsyncTypefaceCache.AsyncTypefaceResult) asyncTypefaceCache.resultCache.get(key$iv2);
                    if (priorResult$iv2 == null) {
                        priorResult$iv2 = (AsyncTypefaceCache.AsyncTypefaceResult) asyncTypefaceCache.permanentCache.get(key$iv2);
                    }
                    if (priorResult$iv2 == null) {
                        Unit unit2 = Unit.INSTANCE;
                        try {
                            result = platformFontLoader.loadBlocking(font);
                        } catch (Exception e) {
                            result = function1.invoke(typefaceRequest);
                        }
                        Object it$iv = result;
                        AsyncTypefaceCache.put$default(asyncTypefaceCache, font, platformFontLoader, it$iv, false, 8, null);
                    } else {
                        result = priorResult$iv2.m6412unboximpl();
                    }
                }
                if (result == null) {
                    result = function1.invoke(typefaceRequest);
                }
                return TuplesKt.to(asyncFontsToLoad, FontSynthesis_androidKt.m6471synthesizeTypefaceFxwP2eA(typefaceRequest.m6496getFontSynthesisGVVA2EU(), result, font, typefaceRequest.getFontWeight(), typefaceRequest.m6495getFontStyle_LCdwA()));
            }
        }
        Object fallbackTypeface = function1.invoke(typefaceRequest);
        return TuplesKt.to(asyncFontsToLoad, fallbackTypeface);
    }
}
