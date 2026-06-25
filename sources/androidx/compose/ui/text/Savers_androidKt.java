package androidx.compose.ui.text;

import androidx.compose.runtime.saveable.Saver;
import androidx.compose.runtime.saveable.SaverKt;
import androidx.compose.runtime.saveable.SaverScope;
import androidx.compose.ui.text.PlatformParagraphStyle;
import androidx.compose.ui.text.style.LineBreak;
import androidx.compose.ui.text.style.TextMotion;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: Savers.android.kt */
@Metadata(d1 = {"\u00002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\"\u001a\u0010\u0000\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"\u001a\u0010\u0006\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00030\u0001X\u0082\u0004¢\u0006\u0002\n\u0000\"$\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00030\u0001*\u00020\t8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\n\u0010\u000b\"$\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001*\u00020\f8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\n\u0010\r\"$\u0010\b\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00030\u0001*\u00020\u000e8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b\n\u0010\u000f¨\u0006\u0010"}, d2 = {"LineBreakSaver", "Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/style/LineBreak;", "", "PlatformParagraphStyleSaver", "Landroidx/compose/ui/text/PlatformParagraphStyle;", "TextMotionSaver", "Landroidx/compose/ui/text/style/TextMotion;", "Saver", "Landroidx/compose/ui/text/PlatformParagraphStyle$Companion;", "getSaver", "(Landroidx/compose/ui/text/PlatformParagraphStyle$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/style/LineBreak$Companion;", "(Landroidx/compose/ui/text/style/LineBreak$Companion;)Landroidx/compose/runtime/saveable/Saver;", "Landroidx/compose/ui/text/style/TextMotion$Companion;", "(Landroidx/compose/ui/text/style/TextMotion$Companion;)Landroidx/compose/runtime/saveable/Saver;", "ui-text_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class Savers_androidKt {
    private static final Saver<PlatformParagraphStyle, Object> PlatformParagraphStyleSaver = SaverKt.Saver(new Function2<SaverScope, PlatformParagraphStyle, Object>() { // from class: androidx.compose.ui.text.Savers_androidKt$PlatformParagraphStyleSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, PlatformParagraphStyle it) {
            return CollectionsKt.arrayListOf(SaversKt.save(Boolean.valueOf(it.getIncludeFontPadding())), SaversKt.save(EmojiSupportMatch.m6176boximpl(it.m6257getEmojiSupportMatch_3YsG6Y())));
        }
    }, new Function1<Object, PlatformParagraphStyle>() { // from class: androidx.compose.ui.text.Savers_androidKt$PlatformParagraphStyleSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final PlatformParagraphStyle invoke(Object it) {
            EmojiSupportMatch emojiSupportMatch;
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
            List list = (List) it;
            Object value$iv = list.get(0);
            Boolean bool = value$iv != null ? (Boolean) value$iv : null;
            Intrinsics.checkNotNull(bool);
            boolean booleanValue = bool.booleanValue();
            Object value$iv2 = list.get(1);
            if (value$iv2 == null) {
                emojiSupportMatch = null;
            } else {
                emojiSupportMatch = (EmojiSupportMatch) value$iv2;
            }
            Intrinsics.checkNotNull(emojiSupportMatch);
            return new PlatformParagraphStyle(emojiSupportMatch.m6182unboximpl(), booleanValue, (DefaultConstructorMarker) null);
        }
    });
    private static final Saver<LineBreak, Object> LineBreakSaver = SaverKt.Saver(new Function2<SaverScope, LineBreak, Object>() { // from class: androidx.compose.ui.text.Savers_androidKt$LineBreakSaver$1
        @Override // kotlin.jvm.functions.Function2
        public /* bridge */ /* synthetic */ Object invoke(SaverScope saverScope, LineBreak lineBreak) {
            return m6268invokenI23V4A(saverScope, lineBreak.m6670unboximpl());
        }

        /* renamed from: invoke-nI23V4A  reason: not valid java name */
        public final Object m6268invokenI23V4A(SaverScope $this$Saver, int it) {
            return Integer.valueOf(it);
        }
    }, new Function1<Object, LineBreak>() { // from class: androidx.compose.ui.text.Savers_androidKt$LineBreakSaver$2
        @Override // kotlin.jvm.functions.Function1
        /* renamed from: invoke-8aCASmQ  reason: not valid java name */
        public final LineBreak invoke(Object it) {
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.Int");
            return LineBreak.m6658boximpl(LineBreak.m6659constructorimpl(((Integer) it).intValue()));
        }
    });
    private static final Saver<TextMotion, Object> TextMotionSaver = SaverKt.Saver(new Function2<SaverScope, TextMotion, Object>() { // from class: androidx.compose.ui.text.Savers_androidKt$TextMotionSaver$1
        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(SaverScope $this$Saver, TextMotion it) {
            return CollectionsKt.arrayListOf(SaversKt.save(TextMotion.Linearity.m6786boximpl(it.m6785getLinearity4e0Vf04$ui_text_release())), SaversKt.save(Boolean.valueOf(it.getSubpixelTextPositioning$ui_text_release())));
        }
    }, new Function1<Object, TextMotion>() { // from class: androidx.compose.ui.text.Savers_androidKt$TextMotionSaver$2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // kotlin.jvm.functions.Function1
        public final TextMotion invoke(Object it) {
            Intrinsics.checkNotNull(it, "null cannot be cast to non-null type kotlin.collections.List<kotlin.Any>");
            List list = (List) it;
            Object value$iv = list.get(0);
            TextMotion.Linearity linearity = value$iv != null ? (TextMotion.Linearity) value$iv : null;
            Intrinsics.checkNotNull(linearity);
            int m6792unboximpl = linearity.m6792unboximpl();
            Object value$iv2 = list.get(1);
            Boolean bool = value$iv2 != null ? (Boolean) value$iv2 : null;
            Intrinsics.checkNotNull(bool);
            return new TextMotion(m6792unboximpl, bool.booleanValue(), null);
        }
    });

    public static final Saver<PlatformParagraphStyle, Object> getSaver(PlatformParagraphStyle.Companion $this$Saver) {
        return PlatformParagraphStyleSaver;
    }

    public static final Saver<LineBreak, Object> getSaver(LineBreak.Companion $this$Saver) {
        return LineBreakSaver;
    }

    public static final Saver<TextMotion, Object> getSaver(TextMotion.Companion $this$Saver) {
        return TextMotionSaver;
    }
}
