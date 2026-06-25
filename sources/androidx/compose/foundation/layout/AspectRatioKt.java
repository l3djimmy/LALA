package androidx.compose.foundation.layout;

import androidx.compose.ui.Modifier;
import androidx.compose.ui.platform.InspectableValueKt;
import androidx.compose.ui.platform.InspectorInfo;
import androidx.compose.ui.unit.Constraints;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
/* compiled from: AspectRatio.kt */
@Metadata(d1 = {"\u0000\"\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\u001a \u0010\u0000\u001a\u00020\u0001*\u00020\u00012\b\b\u0001\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u0005H\u0007\u001a&\u0010\u0006\u001a\u00020\u0005*\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\tH\u0001ø\u0001\u0000¢\u0006\u0004\b\u000b\u0010\f\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006\r"}, d2 = {"aspectRatio", "Landroidx/compose/ui/Modifier;", "ratio", "", "matchHeightConstraintsFirst", "", "isSatisfiedBy", "Landroidx/compose/ui/unit/Constraints;", "width", "", "height", "isSatisfiedBy-NN6Ew-U", "(JII)Z", "foundation-layout_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes.dex */
public final class AspectRatioKt {
    public static /* synthetic */ Modifier aspectRatio$default(Modifier modifier, float f, boolean z, int i, Object obj) {
        if ((i & 2) != 0) {
            z = false;
        }
        return aspectRatio(modifier, f, z);
    }

    public static final Modifier aspectRatio(Modifier $this$aspectRatio, final float ratio, final boolean matchHeightConstraintsFirst) {
        return $this$aspectRatio.then(new AspectRatioElement(ratio, matchHeightConstraintsFirst, InspectableValueKt.isDebugInspectorInfoEnabled() ? new Function1<InspectorInfo, Unit>() { // from class: androidx.compose.foundation.layout.AspectRatioKt$aspectRatio$$inlined$debugInspectorInfo$1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(InspectorInfo inspectorInfo) {
                invoke2(inspectorInfo);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(InspectorInfo $this$null) {
                $this$null.setName("aspectRatio");
                $this$null.getProperties().set("ratio", Float.valueOf(ratio));
                $this$null.getProperties().set("matchHeightConstraintsFirst", Boolean.valueOf(matchHeightConstraintsFirst));
            }
        } : InspectableValueKt.getNoInspectorInfo()));
    }

    /* renamed from: isSatisfiedBy-NN6Ew-U  reason: not valid java name */
    public static final boolean m891isSatisfiedByNN6EwU(long $this$isSatisfiedBy_u2dNN6Ew_u2dU, int width, int height) {
        if (width <= Constraints.m6826getMaxWidthimpl($this$isSatisfiedBy_u2dNN6Ew_u2dU) && Constraints.m6828getMinWidthimpl($this$isSatisfiedBy_u2dNN6Ew_u2dU) <= width) {
            if (height <= Constraints.m6825getMaxHeightimpl($this$isSatisfiedBy_u2dNN6Ew_u2dU) && Constraints.m6827getMinHeightimpl($this$isSatisfiedBy_u2dNN6Ew_u2dU) <= height) {
                return true;
            }
        }
        return false;
    }
}
