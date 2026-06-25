package androidx.compose.ui.graphics.vector;

import androidx.autofill.HintConstants;
import androidx.compose.runtime.ComposablesKt;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.runtime.RecomposeScopeImplKt;
import androidx.compose.runtime.ScopeUpdateScope;
import androidx.compose.runtime.Updater;
import androidx.compose.ui.graphics.Brush;
import androidx.compose.ui.graphics.PathFillType;
import androidx.compose.ui.graphics.StrokeCap;
import androidx.compose.ui.graphics.StrokeJoin;
import androidx.constraintlayout.motion.widget.Key;
import androidx.profileinstaller.ProfileVerifier;
import com.itextpdf.kernel.xmp.options.PropertyOptions;
import java.util.List;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
/* compiled from: VectorCompose.kt */
@Metadata(d1 = {"\u0000L\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0007\n\u0002\b\u0007\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0007\u001a\u0085\u0001\u0010\u0000\u001a\u00020\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00052\b\b\u0002\u0010\u0006\u001a\u00020\u00052\b\b\u0002\u0010\u0007\u001a\u00020\u00052\b\b\u0002\u0010\b\u001a\u00020\u00052\b\b\u0002\u0010\t\u001a\u00020\u00052\b\b\u0002\u0010\n\u001a\u00020\u00052\b\b\u0002\u0010\u000b\u001a\u00020\u00052\u000e\b\u0002\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000e0\r2\u0016\u0010\u000f\u001a\u0012\u0012\u0004\u0012\u00020\u00010\u0010¢\u0006\u0002\b\u0011¢\u0006\u0002\b\u0012H\u0007¢\u0006\u0002\u0010\u0013\u001a¦\u0001\u0010\u0014\u001a\u00020\u00012\f\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\u000e0\r2\b\b\u0002\u0010\u0016\u001a\u00020\u00172\b\b\u0002\u0010\u0002\u001a\u00020\u00032\n\b\u0002\u0010\u0018\u001a\u0004\u0018\u00010\u00192\b\b\u0002\u0010\u001a\u001a\u00020\u00052\n\b\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u00192\b\b\u0002\u0010\u001c\u001a\u00020\u00052\b\b\u0002\u0010\u001d\u001a\u00020\u00052\b\b\u0002\u0010\u001e\u001a\u00020\u001f2\b\b\u0002\u0010 \u001a\u00020!2\b\b\u0002\u0010\"\u001a\u00020\u00052\b\b\u0002\u0010#\u001a\u00020\u00052\b\b\u0002\u0010$\u001a\u00020\u00052\b\b\u0002\u0010%\u001a\u00020\u0005H\u0007ø\u0001\u0000¢\u0006\u0004\b&\u0010'\u0082\u0002\u0007\n\u0005\b¡\u001e0\u0001¨\u0006("}, d2 = {"Group", "", HintConstants.AUTOFILL_HINT_NAME, "", Key.ROTATION, "", "pivotX", "pivotY", "scaleX", "scaleY", "translationX", "translationY", "clipPathData", "", "Landroidx/compose/ui/graphics/vector/PathNode;", "content", "Lkotlin/Function0;", "Landroidx/compose/runtime/Composable;", "Landroidx/compose/ui/graphics/vector/VectorComposable;", "(Ljava/lang/String;FFFFFFFLjava/util/List;Lkotlin/jvm/functions/Function2;Landroidx/compose/runtime/Composer;II)V", "Path", "pathData", "pathFillType", "Landroidx/compose/ui/graphics/PathFillType;", "fill", "Landroidx/compose/ui/graphics/Brush;", "fillAlpha", "stroke", "strokeAlpha", "strokeLineWidth", "strokeLineCap", "Landroidx/compose/ui/graphics/StrokeCap;", "strokeLineJoin", "Landroidx/compose/ui/graphics/StrokeJoin;", "strokeLineMiter", "trimPathStart", "trimPathEnd", "trimPathOffset", "Path-9cdaXJ4", "(Ljava/util/List;ILjava/lang/String;Landroidx/compose/ui/graphics/Brush;FLandroidx/compose/ui/graphics/Brush;FFIIFFFFLandroidx/compose/runtime/Composer;III)V", "ui_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class VectorComposeKt {
    public static final void Group(String name, float rotation, float pivotX, float pivotY, float scaleX, float scaleY, float translationX, float translationY, List<? extends PathNode> list, final Function2<? super Composer, ? super Integer, Unit> function2, Composer $composer, final int $changed, final int i) {
        Object name2;
        float rotation2;
        float pivotX2;
        float pivotY2;
        float scaleX2;
        int i2;
        final float scaleY2;
        final float translationY2;
        final String name3;
        final float pivotX3;
        final float translationY3;
        final float pivotX4;
        final List clipPathData;
        final float rotation3;
        final float rotation4;
        float scaleY3;
        float translationX2;
        float translationY4;
        List clipPathData2;
        int $dirty;
        float scaleY4;
        int i3;
        Composer $composer2 = $composer.startRestartGroup(-213417674);
        ComposerKt.sourceInformation($composer2, "C(Group)P(2,5,3,4,6,7,8,9)58@2500L585:VectorCompose.kt#huu6hf");
        int $dirty2 = $changed;
        int i4 = i & 1;
        if (i4 != 0) {
            $dirty2 |= 6;
            name2 = name;
        } else if (($changed & 6) == 0) {
            name2 = name;
            $dirty2 |= $composer2.changed(name2) ? 4 : 2;
        } else {
            name2 = name;
        }
        int i5 = i & 2;
        if (i5 != 0) {
            $dirty2 |= 48;
            rotation2 = rotation;
        } else if (($changed & 48) == 0) {
            rotation2 = rotation;
            $dirty2 |= $composer2.changed(rotation2) ? 32 : 16;
        } else {
            rotation2 = rotation;
        }
        int i6 = i & 4;
        if (i6 != 0) {
            $dirty2 |= 384;
            pivotX2 = pivotX;
        } else if (($changed & 384) == 0) {
            pivotX2 = pivotX;
            $dirty2 |= $composer2.changed(pivotX2) ? 256 : 128;
        } else {
            pivotX2 = pivotX;
        }
        int i7 = i & 8;
        if (i7 != 0) {
            $dirty2 |= 3072;
            pivotY2 = pivotY;
        } else if (($changed & 3072) == 0) {
            pivotY2 = pivotY;
            $dirty2 |= $composer2.changed(pivotY2) ? 2048 : 1024;
        } else {
            pivotY2 = pivotY;
        }
        int i8 = i & 16;
        if (i8 != 0) {
            $dirty2 |= 24576;
            scaleX2 = scaleX;
        } else if (($changed & 24576) == 0) {
            scaleX2 = scaleX;
            $dirty2 |= $composer2.changed(scaleX2) ? 16384 : 8192;
        } else {
            scaleX2 = scaleX;
        }
        int i9 = i & 32;
        if (i9 != 0) {
            $dirty2 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            $dirty2 |= $composer2.changed(scaleY) ? 131072 : 65536;
        }
        int i10 = i & 64;
        if (i10 != 0) {
            $dirty2 |= 1572864;
        } else if (($changed & 1572864) == 0) {
            $dirty2 |= $composer2.changed(translationX) ? 1048576 : 524288;
        }
        int i11 = i & 128;
        if (i11 != 0) {
            $dirty2 |= 12582912;
            i2 = i11;
        } else if (($changed & 12582912) == 0) {
            i2 = i11;
            $dirty2 |= $composer2.changed(translationY) ? 8388608 : 4194304;
        } else {
            i2 = i11;
        }
        if (($changed & 100663296) == 0) {
            if ((i & 256) == 0 && $composer2.changedInstance(list)) {
                i3 = 67108864;
                $dirty2 |= i3;
            }
            i3 = 33554432;
            $dirty2 |= i3;
        }
        if ((i & 512) != 0) {
            $dirty2 |= 805306368;
        } else if (($changed & 805306368) == 0) {
            $dirty2 |= $composer2.changedInstance(function2) ? PropertyOptions.DELETE_EXISTING : 268435456;
        }
        int $dirty3 = $dirty2;
        if ($composer2.shouldExecute((306783379 & $dirty2) != 306783378, $dirty3 & 1)) {
            $composer2.startDefaults();
            if (($changed & 1) == 0 || $composer2.getDefaultsInvalid()) {
                if (i4 != 0) {
                    name2 = "";
                }
                if (i5 != 0) {
                    rotation2 = 0.0f;
                }
                if (i6 != 0) {
                    pivotX2 = 0.0f;
                }
                if (i7 != 0) {
                    pivotY2 = 0.0f;
                }
                if (i8 != 0) {
                    scaleX2 = 1.0f;
                }
                scaleY3 = i9 != 0 ? 1.0f : scaleY;
                translationX2 = i10 != 0 ? 0.0f : translationX;
                translationY4 = i2 != 0 ? 0.0f : translationY;
                if ((i & 256) != 0) {
                    clipPathData2 = VectorKt.getEmptyPath();
                    $dirty = $dirty3 & (-234881025);
                } else {
                    clipPathData2 = list;
                    $dirty = $dirty3;
                }
            } else {
                $composer2.skipToGroupEnd();
                if ((i & 256) != 0) {
                    translationX2 = translationX;
                    translationY4 = translationY;
                    clipPathData2 = list;
                    $dirty = $dirty3 & (-234881025);
                    scaleY3 = scaleY;
                } else {
                    scaleY3 = scaleY;
                    translationX2 = translationX;
                    translationY4 = translationY;
                    clipPathData2 = list;
                    $dirty = $dirty3;
                }
            }
            $composer2.endDefaults();
            if (ComposerKt.isTraceInProgress()) {
                scaleY4 = scaleY3;
                ComposerKt.traceEventStart(-213417674, $dirty, -1, "androidx.compose.ui.graphics.vector.Group (VectorCompose.kt:57)");
            } else {
                scaleY4 = scaleY3;
            }
            VectorComposeKt$Group$1 vectorComposeKt$Group$1 = new Function0<GroupComponent>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // kotlin.jvm.functions.Function0
                public final GroupComponent invoke() {
                    return new GroupComponent();
                }
            };
            int $dirty4 = $dirty;
            float translationX3 = translationX2;
            ComposerKt.sourceInformationMarkerStart($composer2, -548224868, "CC(ComposeNode)P(1,2)317@12553L9:Composables.kt#9igjgp");
            if (!($composer2.getApplier() instanceof VectorApplier)) {
                ComposablesKt.invalidApplier();
            }
            $composer2.startNode();
            if ($composer2.getInserting()) {
                $composer2.createNode(vectorComposeKt$Group$1);
            } else {
                $composer2.useNode();
            }
            Composer $this$Group_u24lambda_u240 = Updater.m3731constructorimpl($composer2);
            Updater.m3738setimpl($this$Group_u24lambda_u240, name2, new Function2<GroupComponent, String, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$2$1
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(GroupComponent groupComponent, String str) {
                    invoke2(groupComponent, str);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(GroupComponent $this$set, String it) {
                    $this$set.setName(it);
                }
            });
            Updater.m3738setimpl($this$Group_u24lambda_u240, Float.valueOf(rotation2), new Function2<GroupComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$2$2
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(GroupComponent groupComponent, Float f) {
                    invoke(groupComponent, f.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(GroupComponent $this$set, float it) {
                    $this$set.setRotation(it);
                }
            });
            Updater.m3738setimpl($this$Group_u24lambda_u240, Float.valueOf(pivotX2), new Function2<GroupComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$2$3
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(GroupComponent groupComponent, Float f) {
                    invoke(groupComponent, f.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(GroupComponent $this$set, float it) {
                    $this$set.setPivotX(it);
                }
            });
            Updater.m3738setimpl($this$Group_u24lambda_u240, Float.valueOf(pivotY2), new Function2<GroupComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$2$4
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(GroupComponent groupComponent, Float f) {
                    invoke(groupComponent, f.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(GroupComponent $this$set, float it) {
                    $this$set.setPivotY(it);
                }
            });
            Updater.m3738setimpl($this$Group_u24lambda_u240, Float.valueOf(scaleX2), new Function2<GroupComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$2$5
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(GroupComponent groupComponent, Float f) {
                    invoke(groupComponent, f.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(GroupComponent $this$set, float it) {
                    $this$set.setScaleX(it);
                }
            });
            Updater.m3738setimpl($this$Group_u24lambda_u240, Float.valueOf(scaleY4), new Function2<GroupComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$2$6
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(GroupComponent groupComponent, Float f) {
                    invoke(groupComponent, f.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(GroupComponent $this$set, float it) {
                    $this$set.setScaleY(it);
                }
            });
            Updater.m3738setimpl($this$Group_u24lambda_u240, Float.valueOf(translationX3), new Function2<GroupComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$2$7
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(GroupComponent groupComponent, Float f) {
                    invoke(groupComponent, f.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(GroupComponent $this$set, float it) {
                    $this$set.setTranslationX(it);
                }
            });
            Updater.m3738setimpl($this$Group_u24lambda_u240, Float.valueOf(translationY4), new Function2<GroupComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$2$8
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(GroupComponent groupComponent, Float f) {
                    invoke(groupComponent, f.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(GroupComponent $this$set, float it) {
                    $this$set.setTranslationY(it);
                }
            });
            Updater.m3738setimpl($this$Group_u24lambda_u240, clipPathData2, new Function2<GroupComponent, List<? extends PathNode>, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$2$9
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(GroupComponent groupComponent, List<? extends PathNode> list2) {
                    invoke2(groupComponent, list2);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(GroupComponent $this$set, List<? extends PathNode> list2) {
                    $this$set.setClipPathData(list2);
                }
            });
            int i12 = (6 >> 6) & 14;
            ComposerKt.sourceInformationMarkerStart($composer2, 541925533, "C72@3070L9:VectorCompose.kt#huu6hf");
            function2.invoke($composer2, Integer.valueOf(($dirty4 >> 27) & 14));
            ComposerKt.sourceInformationMarkerEnd($composer2);
            $composer2.endNode();
            ComposerKt.sourceInformationMarkerEnd($composer2);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            name3 = name2;
            translationY2 = translationY4;
            pivotX3 = pivotX2;
            translationY3 = pivotY2;
            pivotX4 = translationX3;
            clipPathData = clipPathData2;
            scaleY2 = scaleY4;
            rotation3 = rotation2;
            rotation4 = scaleX2;
        } else {
            $composer2.skipToGroupEnd();
            scaleY2 = scaleY;
            translationY2 = translationY;
            name3 = name2;
            pivotX3 = pivotX2;
            translationY3 = pivotY2;
            pivotX4 = translationX;
            clipPathData = list;
            rotation3 = rotation2;
            rotation4 = scaleX2;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Group$4
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i13) {
                    VectorComposeKt.Group(name3, rotation3, pivotX3, translationY3, rotation4, scaleY2, pivotX4, translationY2, clipPathData, function2, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), i);
                }
            });
        }
    }

    /* renamed from: Path-9cdaXJ4  reason: not valid java name */
    public static final void m4987Path9cdaXJ4(final List<? extends PathNode> list, int pathFillType, String name, Brush fill, float fillAlpha, Brush stroke, float strokeAlpha, float strokeLineWidth, int strokeLineCap, int strokeLineJoin, float strokeLineMiter, float trimPathStart, float trimPathEnd, float trimPathOffset, Composer $composer, final int $changed, final int $changed1, final int i) {
        int i2;
        Object obj;
        Object obj2;
        float f;
        Object obj3;
        float strokeAlpha2;
        int i3;
        int i4;
        int i5;
        int i6;
        int i7;
        int i8;
        int $dirty;
        final float strokeLineMiter2;
        Composer $composer2;
        int $dirty1;
        final String name2;
        final Brush fill2;
        final float fillAlpha2;
        final Brush stroke2;
        final int pathFillType2;
        final float strokeAlpha3;
        final float fillAlpha3;
        final int strokeLineCap2;
        final int strokeLineJoin2;
        final float strokeLineMiter3;
        final float trimPathStart2;
        final float strokeAlpha4;
        int pathFillType3;
        String name3;
        Brush fill3;
        float fillAlpha4;
        Brush stroke3;
        float strokeLineWidth2;
        int strokeLineCap3;
        int strokeLineJoin3;
        float strokeLineMiter4;
        float trimPathStart3;
        float trimPathEnd2;
        float trimPathOffset2;
        int pathFillType4;
        float trimPathOffset3;
        Composer $composer3 = $composer.startRestartGroup(-1478270750);
        ComposerKt.sourceInformation($composer3, "C(Path)P(3,4:c#ui.graphics.PathFillType,2!4,10,7:c#ui.graphics.StrokeCap,8:c#ui.graphics.StrokeJoin!1,13)115@5072L876:VectorCompose.kt#huu6hf");
        int $dirty2 = $changed;
        int $dirty12 = $changed1;
        if ((i & 1) != 0) {
            $dirty2 |= 6;
        } else if (($changed & 6) == 0) {
            $dirty2 |= $composer3.changedInstance(list) ? 4 : 2;
        }
        int i9 = i & 2;
        if (i9 != 0) {
            $dirty2 |= 48;
            i2 = pathFillType;
        } else if (($changed & 48) == 0) {
            i2 = pathFillType;
            $dirty2 |= $composer3.changed(i2) ? 32 : 16;
        } else {
            i2 = pathFillType;
        }
        int i10 = i & 4;
        if (i10 != 0) {
            $dirty2 |= 384;
            obj = name;
        } else if (($changed & 384) == 0) {
            obj = name;
            $dirty2 |= $composer3.changed(obj) ? 256 : 128;
        } else {
            obj = name;
        }
        int i11 = i & 8;
        if (i11 != 0) {
            $dirty2 |= 3072;
            obj2 = fill;
        } else if (($changed & 3072) == 0) {
            obj2 = fill;
            $dirty2 |= $composer3.changed(obj2) ? 2048 : 1024;
        } else {
            obj2 = fill;
        }
        int i12 = i & 16;
        if (i12 != 0) {
            $dirty2 |= 24576;
            f = fillAlpha;
        } else if (($changed & 24576) == 0) {
            f = fillAlpha;
            $dirty2 |= $composer3.changed(f) ? 16384 : 8192;
        } else {
            f = fillAlpha;
        }
        int i13 = i & 32;
        if (i13 != 0) {
            $dirty2 |= ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE;
            obj3 = stroke;
        } else if (($changed & ProfileVerifier.CompilationStatus.RESULT_CODE_ERROR_CANT_WRITE_PROFILE_VERIFICATION_RESULT_CACHE_FILE) == 0) {
            obj3 = stroke;
            $dirty2 |= $composer3.changed(obj3) ? 131072 : 65536;
        } else {
            obj3 = stroke;
        }
        int i14 = i & 64;
        if (i14 != 0) {
            $dirty2 |= 1572864;
            strokeAlpha2 = strokeAlpha;
        } else if (($changed & 1572864) == 0) {
            strokeAlpha2 = strokeAlpha;
            $dirty2 |= $composer3.changed(strokeAlpha2) ? 1048576 : 524288;
        } else {
            strokeAlpha2 = strokeAlpha;
        }
        int i15 = i & 128;
        if (i15 != 0) {
            $dirty2 |= 12582912;
            i3 = i15;
        } else if (($changed & 12582912) == 0) {
            i3 = i15;
            $dirty2 |= $composer3.changed(strokeLineWidth) ? 8388608 : 4194304;
        } else {
            i3 = i15;
        }
        int i16 = i & 256;
        if (i16 != 0) {
            $dirty2 |= 100663296;
            i4 = i16;
        } else if (($changed & 100663296) == 0) {
            i4 = i16;
            $dirty2 |= $composer3.changed(strokeLineCap) ? 67108864 : 33554432;
        } else {
            i4 = i16;
        }
        int i17 = i & 512;
        if (i17 != 0) {
            $dirty2 |= 805306368;
            i5 = i17;
        } else if (($changed & 805306368) == 0) {
            i5 = i17;
            $dirty2 |= $composer3.changed(strokeLineJoin) ? PropertyOptions.DELETE_EXISTING : 268435456;
        } else {
            i5 = i17;
        }
        int i18 = i & 1024;
        if (i18 != 0) {
            $dirty12 |= 6;
            i6 = i18;
        } else if (($changed1 & 6) == 0) {
            i6 = i18;
            $dirty12 |= $composer3.changed(strokeLineMiter) ? 4 : 2;
        } else {
            i6 = i18;
        }
        int i19 = i & 2048;
        if (i19 != 0) {
            $dirty12 |= 48;
            i7 = i19;
        } else if (($changed1 & 48) == 0) {
            i7 = i19;
            $dirty12 |= $composer3.changed(trimPathStart) ? 32 : 16;
        } else {
            i7 = i19;
        }
        int i20 = i & 4096;
        if (i20 != 0) {
            $dirty12 |= 384;
            i8 = i20;
        } else {
            i8 = i20;
            if (($changed1 & 384) == 0) {
                $dirty12 |= $composer3.changed(trimPathEnd) ? 256 : 128;
            }
        }
        int i21 = i & 8192;
        if (i21 != 0) {
            $dirty12 |= 3072;
        } else if (($changed1 & 3072) == 0) {
            $dirty12 |= $composer3.changed(trimPathOffset) ? 2048 : 1024;
        }
        if ($composer3.shouldExecute((($dirty2 & 306783379) == 306783378 && ($dirty12 & 1171) == 1170) ? false : true, $dirty2 & 1)) {
            if (i9 != 0) {
                pathFillType3 = VectorKt.getDefaultFillType();
            } else {
                pathFillType3 = i2;
            }
            if (i10 == 0) {
                name3 = obj;
            } else {
                name3 = "";
            }
            if (i11 == 0) {
                fill3 = obj2;
            } else {
                fill3 = null;
            }
            if (i12 == 0) {
                fillAlpha4 = f;
            } else {
                fillAlpha4 = 1.0f;
            }
            if (i13 == 0) {
                stroke3 = obj3;
            } else {
                stroke3 = null;
            }
            if (i14 != 0) {
                strokeAlpha2 = 1.0f;
            }
            if (i3 == 0) {
                strokeLineWidth2 = strokeLineWidth;
            } else {
                strokeLineWidth2 = 0.0f;
            }
            if (i4 == 0) {
                strokeLineCap3 = strokeLineCap;
            } else {
                strokeLineCap3 = VectorKt.getDefaultStrokeLineCap();
            }
            if (i5 == 0) {
                strokeLineJoin3 = strokeLineJoin;
            } else {
                strokeLineJoin3 = VectorKt.getDefaultStrokeLineJoin();
            }
            if (i6 == 0) {
                strokeLineMiter4 = strokeLineMiter;
            } else {
                strokeLineMiter4 = 4.0f;
            }
            if (i7 == 0) {
                trimPathStart3 = trimPathStart;
            } else {
                trimPathStart3 = 0.0f;
            }
            if (i8 == 0) {
                trimPathEnd2 = trimPathEnd;
            } else {
                trimPathEnd2 = 1.0f;
            }
            if (i21 == 0) {
                trimPathOffset2 = trimPathOffset;
            } else {
                trimPathOffset2 = 0.0f;
            }
            if (!ComposerKt.isTraceInProgress()) {
                pathFillType4 = pathFillType3;
                trimPathOffset3 = trimPathOffset2;
            } else {
                pathFillType4 = pathFillType3;
                trimPathOffset3 = trimPathOffset2;
                ComposerKt.traceEventStart(-1478270750, $dirty2, $dirty12, "androidx.compose.ui.graphics.vector.Path (VectorCompose.kt:114)");
            }
            VectorComposeKt$Path$1 vectorComposeKt$Path$1 = new Function0<PathComponent>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // kotlin.jvm.functions.Function0
                public final PathComponent invoke() {
                    return new PathComponent();
                }
            };
            $dirty = $dirty2;
            ComposerKt.sourceInformationMarkerStart($composer3, 1886828752, "CC(ComposeNode):Composables.kt#9igjgp");
            if (!($composer3.getApplier() instanceof VectorApplier)) {
                ComposablesKt.invalidApplier();
            }
            $composer3.startNode();
            if ($composer3.getInserting()) {
                $composer3.createNode(vectorComposeKt$Path$1);
            } else {
                $composer3.useNode();
            }
            Composer $this$Path_9cdaXJ4_u24lambda_u242 = Updater.m3731constructorimpl($composer3);
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, name3, new Function2<PathComponent, String, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$1
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, String str) {
                    invoke2(pathComponent, str);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(PathComponent $this$set, String it) {
                    $this$set.setName(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, list, new Function2<PathComponent, List<? extends PathNode>, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$2
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, List<? extends PathNode> list2) {
                    invoke2(pathComponent, list2);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(PathComponent $this$set, List<? extends PathNode> list2) {
                    $this$set.setPathData(list2);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, PathFillType.m4564boximpl(pathFillType4), new Function2<PathComponent, PathFillType, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$3
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, PathFillType pathFillType5) {
                    m4989invokepweu1eQ(pathComponent, pathFillType5.m4570unboximpl());
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke-pweu1eQ  reason: not valid java name */
                public final void m4989invokepweu1eQ(PathComponent $this$set, int it) {
                    $this$set.m4981setPathFillTypeoQ8Xj4U(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, fill3, new Function2<PathComponent, Brush, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$4
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, Brush brush) {
                    invoke2(pathComponent, brush);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(PathComponent $this$set, Brush it) {
                    $this$set.setFill(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, Float.valueOf(fillAlpha4), new Function2<PathComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$5
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, Float f2) {
                    invoke(pathComponent, f2.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(PathComponent $this$set, float it) {
                    $this$set.setFillAlpha(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, stroke3, new Function2<PathComponent, Brush, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$6
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, Brush brush) {
                    invoke2(pathComponent, brush);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(PathComponent $this$set, Brush it) {
                    $this$set.setStroke(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, Float.valueOf(strokeAlpha2), new Function2<PathComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$7
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, Float f2) {
                    invoke(pathComponent, f2.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(PathComponent $this$set, float it) {
                    $this$set.setStrokeAlpha(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, Float.valueOf(strokeLineWidth2), new Function2<PathComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$8
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, Float f2) {
                    invoke(pathComponent, f2.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(PathComponent $this$set, float it) {
                    $this$set.setStrokeLineWidth(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, StrokeJoin.m4645boximpl(strokeLineJoin3), new Function2<PathComponent, StrokeJoin, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$9
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, StrokeJoin strokeJoin) {
                    m4990invokekLtJ_vA(pathComponent, strokeJoin.m4651unboximpl());
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke-kLtJ_vA  reason: not valid java name */
                public final void m4990invokekLtJ_vA(PathComponent $this$set, int it) {
                    $this$set.m4983setStrokeLineJoinWw9F2mQ(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, StrokeCap.m4635boximpl(strokeLineCap3), new Function2<PathComponent, StrokeCap, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$10
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, StrokeCap strokeCap) {
                    m4988invokeCSYIeUk(pathComponent, strokeCap.m4641unboximpl());
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke-CSYIeUk  reason: not valid java name */
                public final void m4988invokeCSYIeUk(PathComponent $this$set, int it) {
                    $this$set.m4982setStrokeLineCapBeK7IIE(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, Float.valueOf(strokeLineMiter4), new Function2<PathComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$11
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, Float f2) {
                    invoke(pathComponent, f2.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(PathComponent $this$set, float it) {
                    $this$set.setStrokeLineMiter(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, Float.valueOf(trimPathStart3), new Function2<PathComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$12
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, Float f2) {
                    invoke(pathComponent, f2.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(PathComponent $this$set, float it) {
                    $this$set.setTrimPathStart(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, Float.valueOf(trimPathEnd2), new Function2<PathComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$13
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, Float f2) {
                    invoke(pathComponent, f2.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(PathComponent $this$set, float it) {
                    $this$set.setTrimPathEnd(it);
                }
            });
            Updater.m3738setimpl($this$Path_9cdaXJ4_u24lambda_u242, Float.valueOf(trimPathOffset3), new Function2<PathComponent, Float, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$2$14
                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(PathComponent pathComponent, Float f2) {
                    invoke(pathComponent, f2.floatValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(PathComponent $this$set, float it) {
                    $this$set.setTrimPathOffset(it);
                }
            });
            $composer3.endNode();
            ComposerKt.sourceInformationMarkerEnd($composer3);
            if (ComposerKt.isTraceInProgress()) {
                ComposerKt.traceEventEnd();
            }
            name2 = name3;
            $composer2 = $composer3;
            $dirty1 = $dirty12;
            fill2 = fill3;
            fillAlpha2 = fillAlpha4;
            stroke2 = stroke3;
            fillAlpha3 = strokeLineWidth2;
            strokeLineCap2 = strokeLineCap3;
            strokeLineJoin2 = strokeLineJoin3;
            strokeLineMiter3 = strokeLineMiter4;
            strokeAlpha3 = strokeAlpha2;
            trimPathStart2 = trimPathStart3;
            strokeLineMiter2 = trimPathEnd2;
            pathFillType2 = pathFillType4;
            strokeAlpha4 = trimPathOffset3;
        } else {
            $dirty = $dirty2;
            $composer3.skipToGroupEnd();
            strokeLineMiter2 = trimPathEnd;
            $composer2 = $composer3;
            $dirty1 = $dirty12;
            name2 = obj;
            fill2 = obj2;
            fillAlpha2 = f;
            stroke2 = obj3;
            pathFillType2 = i2;
            strokeAlpha3 = strokeAlpha2;
            fillAlpha3 = strokeLineWidth;
            strokeLineCap2 = strokeLineCap;
            strokeLineJoin2 = strokeLineJoin;
            strokeLineMiter3 = strokeLineMiter;
            trimPathStart2 = trimPathStart;
            strokeAlpha4 = trimPathOffset;
        }
        ScopeUpdateScope endRestartGroup = $composer2.endRestartGroup();
        if (endRestartGroup != null) {
            endRestartGroup.updateScope(new Function2<Composer, Integer, Unit>() { // from class: androidx.compose.ui.graphics.vector.VectorComposeKt$Path$3
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                /* JADX WARN: Multi-variable type inference failed */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Composer composer, Integer num) {
                    invoke(composer, num.intValue());
                    return Unit.INSTANCE;
                }

                public final void invoke(Composer composer, int i22) {
                    VectorComposeKt.m4987Path9cdaXJ4(list, pathFillType2, name2, fill2, fillAlpha2, stroke2, strokeAlpha3, fillAlpha3, strokeLineCap2, strokeLineJoin2, strokeLineMiter3, trimPathStart2, strokeLineMiter2, strokeAlpha4, composer, RecomposeScopeImplKt.updateChangedFlags($changed | 1), RecomposeScopeImplKt.updateChangedFlags($changed1), i);
                }
            });
        }
    }
}
