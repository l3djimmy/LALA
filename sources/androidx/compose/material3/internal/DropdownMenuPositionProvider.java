package androidx.compose.material3.internal;

import androidx.autofill.HintConstants;
import androidx.compose.material3.internal.MenuPosition;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.DpOffset;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntOffsetKt;
import androidx.compose.ui.unit.IntRect;
import androidx.compose.ui.unit.IntRectKt;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.compose.ui.window.PopupPositionProvider;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: MenuPosition.kt */
@Metadata(d1 = {"\u0000l\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001BY\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\b\b\u0002\u0010\u0006\u001a\u00020\u0007\u00128\b\u0002\u0010\b\u001a2\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f0\t¢\u0006\u0002\u0010\u0010J2\u0010%\u001a\u00020&2\u0006\u0010\r\u001a\u00020\n2\u0006\u0010'\u001a\u00020(2\u0006\u0010)\u001a\u00020*2\u0006\u0010+\u001a\u00020(H\u0016ø\u0001\u0000¢\u0006\u0004\b,\u0010-J\u0016\u0010.\u001a\u00020\u0003HÆ\u0003ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b/\u0010\u0016J\t\u00100\u001a\u00020\u0005HÆ\u0003J\t\u00101\u001a\u00020\u0007HÆ\u0003J9\u00102\u001a2\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f0\tHÆ\u0003Jk\u00103\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u000728\b\u0002\u0010\b\u001a2\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f0\tHÆ\u0001ø\u0001\u0000¢\u0006\u0004\b4\u00105J\u0013\u00106\u001a\u0002072\b\u00108\u001a\u0004\u0018\u000109HÖ\u0003J\t\u0010:\u001a\u00020\u0007HÖ\u0001J\t\u0010;\u001a\u00020<HÖ\u0001R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0012X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0012X\u0082\u0004¢\u0006\u0002\n\u0000R\u0019\u0010\u0002\u001a\u00020\u0003ø\u0001\u0000ø\u0001\u0001¢\u0006\n\n\u0002\u0010\u0017\u001a\u0004\b\u0015\u0010\u0016R\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\u0018\u0010\u0019R\u000e\u0010\u001a\u001a\u00020\u001bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u001c\u001a\u00020\u001bX\u0082\u0004¢\u0006\u0002\n\u0000RA\u0010\b\u001a2\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\r\u0012\u0013\u0012\u00110\n¢\u0006\f\b\u000b\u0012\b\b\f\u0012\u0004\b\b(\u000e\u0012\u0004\u0012\u00020\u000f0\t¢\u0006\b\n\u0000\u001a\u0004\b\u001d\u0010\u001eR\u000e\u0010\u001f\u001a\u00020\u001bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010 \u001a\u00020\u001bX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010!\u001a\u00020\u0012X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\"\u001a\u00020\u0012X\u0082\u0004¢\u0006\u0002\n\u0000R\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b#\u0010$\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006="}, d2 = {"Landroidx/compose/material3/internal/DropdownMenuPositionProvider;", "Landroidx/compose/ui/window/PopupPositionProvider;", "contentOffset", "Landroidx/compose/ui/unit/DpOffset;", "density", "Landroidx/compose/ui/unit/Density;", "verticalMargin", "", "onPositionCalculated", "Lkotlin/Function2;", "Landroidx/compose/ui/unit/IntRect;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "anchorBounds", "menuBounds", "", "(JLandroidx/compose/ui/unit/Density;ILkotlin/jvm/functions/Function2;Lkotlin/jvm/internal/DefaultConstructorMarker;)V", "bottomToAnchorTop", "Landroidx/compose/material3/internal/MenuPosition$Vertical;", "bottomToWindowBottom", "centerToAnchorTop", "getContentOffset-RKDOV3M", "()J", "J", "getDensity", "()Landroidx/compose/ui/unit/Density;", "endToAnchorEnd", "Landroidx/compose/material3/internal/MenuPosition$Horizontal;", "leftToWindowLeft", "getOnPositionCalculated", "()Lkotlin/jvm/functions/Function2;", "rightToWindowRight", "startToAnchorStart", "topToAnchorBottom", "topToWindowTop", "getVerticalMargin", "()I", "calculatePosition", "Landroidx/compose/ui/unit/IntOffset;", "windowSize", "Landroidx/compose/ui/unit/IntSize;", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "popupContentSize", "calculatePosition-llwVHH4", "(Landroidx/compose/ui/unit/IntRect;JLandroidx/compose/ui/unit/LayoutDirection;J)J", "component1", "component1-RKDOV3M", "component2", "component3", "component4", "copy", "copy-uVxBXkw", "(JLandroidx/compose/ui/unit/Density;ILkotlin/jvm/functions/Function2;)Landroidx/compose/material3/internal/DropdownMenuPositionProvider;", "equals", "", "other", "", "hashCode", "toString", "", "material3_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class DropdownMenuPositionProvider implements PopupPositionProvider {
    public static final int $stable = 0;
    private final MenuPosition.Vertical bottomToAnchorTop;
    private final MenuPosition.Vertical bottomToWindowBottom;
    private final MenuPosition.Vertical centerToAnchorTop;
    private final long contentOffset;
    private final Density density;
    private final MenuPosition.Horizontal endToAnchorEnd;
    private final MenuPosition.Horizontal leftToWindowLeft;
    private final Function2<IntRect, IntRect, Unit> onPositionCalculated;
    private final MenuPosition.Horizontal rightToWindowRight;
    private final MenuPosition.Horizontal startToAnchorStart;
    private final MenuPosition.Vertical topToAnchorBottom;
    private final MenuPosition.Vertical topToWindowTop;
    private final int verticalMargin;

    public /* synthetic */ DropdownMenuPositionProvider(long j, Density density, int i, Function2 function2, DefaultConstructorMarker defaultConstructorMarker) {
        this(j, density, i, function2);
    }

    /* renamed from: copy-uVxBXkw$default  reason: not valid java name */
    public static /* synthetic */ DropdownMenuPositionProvider m2946copyuVxBXkw$default(DropdownMenuPositionProvider dropdownMenuPositionProvider, long j, Density density, int i, Function2 function2, int i2, Object obj) {
        if ((i2 & 1) != 0) {
            j = dropdownMenuPositionProvider.contentOffset;
        }
        long j2 = j;
        if ((i2 & 2) != 0) {
            density = dropdownMenuPositionProvider.density;
        }
        Density density2 = density;
        if ((i2 & 4) != 0) {
            i = dropdownMenuPositionProvider.verticalMargin;
        }
        int i3 = i;
        Function2<IntRect, IntRect, Unit> function22 = function2;
        if ((i2 & 8) != 0) {
            function22 = dropdownMenuPositionProvider.onPositionCalculated;
        }
        return dropdownMenuPositionProvider.m2948copyuVxBXkw(j2, density2, i3, function22);
    }

    /* renamed from: component1-RKDOV3M  reason: not valid java name */
    public final long m2947component1RKDOV3M() {
        return this.contentOffset;
    }

    public final Density component2() {
        return this.density;
    }

    public final int component3() {
        return this.verticalMargin;
    }

    public final Function2<IntRect, IntRect, Unit> component4() {
        return this.onPositionCalculated;
    }

    /* renamed from: copy-uVxBXkw  reason: not valid java name */
    public final DropdownMenuPositionProvider m2948copyuVxBXkw(long j, Density density, int i, Function2<? super IntRect, ? super IntRect, Unit> function2) {
        return new DropdownMenuPositionProvider(j, density, i, function2, null);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof DropdownMenuPositionProvider) {
            DropdownMenuPositionProvider dropdownMenuPositionProvider = (DropdownMenuPositionProvider) obj;
            return DpOffset.m6933equalsimpl0(this.contentOffset, dropdownMenuPositionProvider.contentOffset) && Intrinsics.areEqual(this.density, dropdownMenuPositionProvider.density) && this.verticalMargin == dropdownMenuPositionProvider.verticalMargin && Intrinsics.areEqual(this.onPositionCalculated, dropdownMenuPositionProvider.onPositionCalculated);
        }
        return false;
    }

    public int hashCode() {
        return (((((DpOffset.m6938hashCodeimpl(this.contentOffset) * 31) + this.density.hashCode()) * 31) + Integer.hashCode(this.verticalMargin)) * 31) + this.onPositionCalculated.hashCode();
    }

    public String toString() {
        return "DropdownMenuPositionProvider(contentOffset=" + ((Object) DpOffset.m6941toStringimpl(this.contentOffset)) + ", density=" + this.density + ", verticalMargin=" + this.verticalMargin + ", onPositionCalculated=" + this.onPositionCalculated + ')';
    }

    /* JADX WARN: Multi-variable type inference failed */
    private DropdownMenuPositionProvider(long contentOffset, Density density, int verticalMargin, Function2<? super IntRect, ? super IntRect, Unit> function2) {
        this.contentOffset = contentOffset;
        this.density = density;
        this.verticalMargin = verticalMargin;
        this.onPositionCalculated = function2;
        Density $this$_init__u24lambda_u241 = this.density;
        int contentOffsetX = $this$_init__u24lambda_u241.mo638roundToPx0680j_4(DpOffset.m6934getXD9Ej5fM(this.contentOffset));
        this.startToAnchorStart = MenuPosition.INSTANCE.startToAnchorStart(contentOffsetX);
        this.endToAnchorEnd = MenuPosition.INSTANCE.endToAnchorEnd(contentOffsetX);
        this.leftToWindowLeft = MenuPosition.INSTANCE.leftToWindowLeft(0);
        this.rightToWindowRight = MenuPosition.INSTANCE.rightToWindowRight(0);
        Density $this$_init__u24lambda_u242 = this.density;
        int contentOffsetY = $this$_init__u24lambda_u242.mo638roundToPx0680j_4(DpOffset.m6936getYD9Ej5fM(this.contentOffset));
        this.topToAnchorBottom = MenuPosition.INSTANCE.topToAnchorBottom(contentOffsetY);
        this.bottomToAnchorTop = MenuPosition.INSTANCE.bottomToAnchorTop(contentOffsetY);
        this.centerToAnchorTop = MenuPosition.INSTANCE.centerToAnchorTop(contentOffsetY);
        this.topToWindowTop = MenuPosition.INSTANCE.topToWindowTop(this.verticalMargin);
        this.bottomToWindowBottom = MenuPosition.INSTANCE.bottomToWindowBottom(this.verticalMargin);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public /* synthetic */ DropdownMenuPositionProvider(long r8, androidx.compose.ui.unit.Density r10, int r11, kotlin.jvm.functions.Function2 r12, int r13, kotlin.jvm.internal.DefaultConstructorMarker r14) {
        /*
            r7 = this;
            r14 = r13 & 4
            if (r14 == 0) goto L10
            r11 = r10
            r14 = 0
            float r0 = androidx.compose.material3.MenuKt.getMenuVerticalMargin()
            int r11 = r11.mo638roundToPx0680j_4(r0)
            r4 = r11
            goto L11
        L10:
            r4 = r11
        L11:
            r11 = r13 & 8
            if (r11 == 0) goto L1c
            androidx.compose.material3.internal.DropdownMenuPositionProvider$2 r11 = new kotlin.jvm.functions.Function2<androidx.compose.ui.unit.IntRect, androidx.compose.ui.unit.IntRect, kotlin.Unit>() { // from class: androidx.compose.material3.internal.DropdownMenuPositionProvider.2
                static {
                    /*
                        androidx.compose.material3.internal.DropdownMenuPositionProvider$2 r0 = new androidx.compose.material3.internal.DropdownMenuPositionProvider$2
                        r0.<init>()
                        
                        // error: 0x0005: SPUT  (r0 I:androidx.compose.material3.internal.DropdownMenuPositionProvider$2) androidx.compose.material3.internal.DropdownMenuPositionProvider.2.INSTANCE androidx.compose.material3.internal.DropdownMenuPositionProvider$2
                        return
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.internal.DropdownMenuPositionProvider.AnonymousClass2.<clinit>():void");
                }

                {
                    /*
                        r1 = this;
                        r0 = 2
                        r1.<init>(r0)
                        return
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.internal.DropdownMenuPositionProvider.AnonymousClass2.<init>():void");
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ kotlin.Unit invoke(androidx.compose.ui.unit.IntRect r3, androidx.compose.ui.unit.IntRect r4) {
                    /*
                        r2 = this;
                        r0 = r3
                        androidx.compose.ui.unit.IntRect r0 = (androidx.compose.ui.unit.IntRect) r0
                        r1 = r4
                        androidx.compose.ui.unit.IntRect r1 = (androidx.compose.ui.unit.IntRect) r1
                        r2.invoke2(r0, r1)
                        kotlin.Unit r0 = kotlin.Unit.INSTANCE
                        return r0
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.internal.DropdownMenuPositionProvider.AnonymousClass2.invoke(java.lang.Object, java.lang.Object):java.lang.Object");
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(androidx.compose.ui.unit.IntRect r1, androidx.compose.ui.unit.IntRect r2) {
                    /*
                        r0 = this;
                        return
                    */
                    throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.internal.DropdownMenuPositionProvider.AnonymousClass2.invoke2(androidx.compose.ui.unit.IntRect, androidx.compose.ui.unit.IntRect):void");
                }
            }
            r12 = r11
            kotlin.jvm.functions.Function2 r12 = (kotlin.jvm.functions.Function2) r12
            r5 = r12
            goto L1d
        L1c:
            r5 = r12
        L1d:
            r6 = 0
            r0 = r7
            r1 = r8
            r3 = r10
            r0.<init>(r1, r3, r4, r5, r6)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.material3.internal.DropdownMenuPositionProvider.<init>(long, androidx.compose.ui.unit.Density, int, kotlin.jvm.functions.Function2, int, kotlin.jvm.internal.DefaultConstructorMarker):void");
    }

    /* renamed from: getContentOffset-RKDOV3M  reason: not valid java name */
    public final long m2949getContentOffsetRKDOV3M() {
        return this.contentOffset;
    }

    public final Density getDensity() {
        return this.density;
    }

    public final int getVerticalMargin() {
        return this.verticalMargin;
    }

    public final Function2<IntRect, IntRect, Unit> getOnPositionCalculated() {
        return this.onPositionCalculated;
    }

    @Override // androidx.compose.ui.window.PopupPositionProvider
    /* renamed from: calculatePosition-llwVHH4 */
    public long mo613calculatePositionllwVHH4(IntRect anchorBounds, long windowSize, LayoutDirection layoutDirection, long popupContentSize) {
        MenuPosition.Horizontal horizontal;
        MenuPosition.Vertical vertical;
        MenuPosition.Horizontal[] horizontalArr = new MenuPosition.Horizontal[3];
        horizontalArr[0] = this.startToAnchorStart;
        horizontalArr[1] = this.endToAnchorEnd;
        if (IntOffset.m7001getXimpl(anchorBounds.m7025getCenternOccac()) < IntSize.m7044getWidthimpl(windowSize) / 2) {
            horizontal = this.leftToWindowLeft;
        } else {
            horizontal = this.rightToWindowRight;
        }
        horizontalArr[2] = horizontal;
        List xCandidates = CollectionsKt.listOf((Object[]) horizontalArr);
        int x = 0;
        int size = xCandidates.size();
        for (int index = 0; index < size; index++) {
            int xCandidate = ((MenuPosition.Horizontal) xCandidates.get(index)).mo2940position95KtPRI(anchorBounds, windowSize, IntSize.m7044getWidthimpl(popupContentSize), layoutDirection);
            if (index == CollectionsKt.getLastIndex(xCandidates) || (xCandidate >= 0 && IntSize.m7044getWidthimpl(popupContentSize) + xCandidate <= IntSize.m7044getWidthimpl(windowSize))) {
                x = xCandidate;
                break;
            }
        }
        MenuPosition.Vertical[] verticalArr = new MenuPosition.Vertical[4];
        verticalArr[0] = this.topToAnchorBottom;
        verticalArr[1] = this.bottomToAnchorTop;
        verticalArr[2] = this.centerToAnchorTop;
        if (IntOffset.m7002getYimpl(anchorBounds.m7025getCenternOccac()) < IntSize.m7043getHeightimpl(windowSize) / 2) {
            vertical = this.topToWindowTop;
        } else {
            vertical = this.bottomToWindowBottom;
        }
        verticalArr[3] = vertical;
        List yCandidates = CollectionsKt.listOf((Object[]) verticalArr);
        int y = 0;
        int size2 = yCandidates.size();
        for (int index2 = 0; index2 < size2; index2++) {
            int yCandidate = ((MenuPosition.Vertical) yCandidates.get(index2)).mo2941positionJVtK1S4(anchorBounds, windowSize, IntSize.m7043getHeightimpl(popupContentSize));
            if (index2 == CollectionsKt.getLastIndex(yCandidates) || (yCandidate >= this.verticalMargin && IntSize.m7043getHeightimpl(popupContentSize) + yCandidate <= IntSize.m7043getHeightimpl(windowSize) - this.verticalMargin)) {
                y = yCandidate;
                break;
            }
        }
        long menuOffset = IntOffsetKt.IntOffset(x, y);
        this.onPositionCalculated.invoke(anchorBounds, IntRectKt.m7034IntRectVbeCjmY(menuOffset, popupContentSize));
        return menuOffset;
    }
}
