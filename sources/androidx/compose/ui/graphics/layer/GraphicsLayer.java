package androidx.compose.ui.graphics.layer;

import android.graphics.Canvas;
import android.graphics.Outline;
import android.graphics.RectF;
import android.os.Build;
import androidx.collection.MutableScatterSet;
import androidx.collection.ScatterSet;
import androidx.collection.ScatterSetKt;
import androidx.compose.ui.geometry.CornerRadius;
import androidx.compose.ui.geometry.InlineClassHelperKt;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.RoundRectKt;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.AndroidCanvas_androidKt;
import androidx.compose.ui.graphics.AndroidPaint_androidKt;
import androidx.compose.ui.graphics.AndroidPath;
import androidx.compose.ui.graphics.BlendMode;
import androidx.compose.ui.graphics.ClipOp;
import androidx.compose.ui.graphics.Color;
import androidx.compose.ui.graphics.ColorFilter;
import androidx.compose.ui.graphics.Outline;
import androidx.compose.ui.graphics.Paint;
import androidx.compose.ui.graphics.Path;
import androidx.compose.ui.graphics.RenderEffect;
import androidx.compose.ui.graphics.drawscope.CanvasDrawScope;
import androidx.compose.ui.graphics.drawscope.DrawContext;
import androidx.compose.ui.graphics.drawscope.DrawContextKt;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.drawscope.DrawTransform;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.IntSizeKt;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.exifinterface.media.ExifInterface;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: AndroidGraphicsLayer.android.kt */
@Metadata(d1 = {"\u0000è\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0007\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b\u0015\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\u0018\u0000 ½\u00012\u00020\u0001:\u0002½\u0001B\u0019\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\b\u0010\u0004\u001a\u0004\u0018\u00010\u0005¢\u0006\u0002\u0010\u0006J\u0012\u0010\u008a\u0001\u001a\u00020,2\u0007\u0010\u008b\u0001\u001a\u00020\u0000H\u0002J\t\u0010\u008c\u0001\u001a\u00020,H\u0002J\t\u0010\u008d\u0001\u001a\u00020,H\u0002J\u000f\u0010\u008e\u0001\u001a\u00020,H\u0000¢\u0006\u0003\b\u008f\u0001J$\u0010\u0090\u0001\u001a\u00020,2\b\u0010\u0091\u0001\u001a\u00030\u0092\u00012\t\u0010\u0093\u0001\u001a\u0004\u0018\u00010\u0000H\u0000¢\u0006\u0003\b\u0094\u0001J\u0019\u0010\u0095\u0001\u001a\u00020,2\b\u0010\u0091\u0001\u001a\u00030\u0092\u0001H\u0000¢\u0006\u0003\b\u0096\u0001J\u000f\u0010\u0097\u0001\u001a\u00020,H\u0001¢\u0006\u0003\b\u0098\u0001J\t\u0010\u0099\u0001\u001a\u00020\u0015H\u0002J\t\u0010\u009a\u0001\u001a\u00020QH\u0002J\t\u0010\u009b\u0001\u001a\u00020,H\u0002J\t\u0010\u009c\u0001\u001a\u00020,H\u0002JE\u0010\u009d\u0001\u001a\u00020,2\u0006\u00108\u001a\u0002092\u0006\u0010D\u001a\u00020E2\u0006\u0010u\u001a\u00020t2\u0018\u0010\u009e\u0001\u001a\u0013\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020,0*¢\u0006\u0002\b-ø\u0001\u0000¢\u0006\u0006\b\u009f\u0001\u0010 \u0001J\t\u0010¡\u0001\u001a\u00020,H\u0002J\t\u0010¢\u0001\u001a\u00020,H\u0002J\u000f\u0010£\u0001\u001a\u00020,H\u0000¢\u0006\u0003\b¤\u0001J\t\u0010¥\u0001\u001a\u00020,H\u0002J5\u0010¦\u0001\u001a\u0003H§\u0001\"\u0005\b\u0000\u0010§\u00012\u001b\u0010\u009e\u0001\u001a\u0016\u0012\u0004\u0012\u00020R\u0012\u0004\u0012\u00020i\u0012\u0005\u0012\u0003H§\u00010¨\u0001H\u0082\b¢\u0006\u0003\u0010©\u0001J\u0010\u0010ª\u0001\u001a\u00020,2\u0007\u0010«\u0001\u001a\u00020KJ&\u0010¬\u0001\u001a\u00020,2\u0007\u0010\u0080\u0001\u001a\u00020\u007f2\u0006\u0010u\u001a\u00020tH\u0002ø\u0001\u0000¢\u0006\u0006\b\u00ad\u0001\u0010®\u0001J(\u0010¯\u0001\u001a\u00020,2\t\b\u0002\u0010\u0080\u0001\u001a\u00020R2\b\b\u0002\u0010u\u001a\u00020iø\u0001\u0000¢\u0006\u0006\b°\u0001\u0010®\u0001J3\u0010±\u0001\u001a\u00020,2\t\b\u0002\u0010\u0080\u0001\u001a\u00020R2\b\b\u0002\u0010u\u001a\u00020i2\t\b\u0002\u0010²\u0001\u001a\u00020\bø\u0001\u0000¢\u0006\u0006\b³\u0001\u0010´\u0001J\u0011\u0010µ\u0001\u001a\u00030¶\u0001H\u0086@¢\u0006\u0003\u0010·\u0001J\u0013\u0010¸\u0001\u001a\u00020,2\b\u0010¹\u0001\u001a\u00030º\u0001H\u0002J\u0014\u0010»\u0001\u001a\u0004\u0018\u00010\u00152\u0007\u0010«\u0001\u001a\u00020KH\u0002J\r\u0010¼\u0001\u001a\u00020,*\u00020+H\u0002R$\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\b\n\u0010\u000b\"\u0004\b\f\u0010\rR*\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0007\u001a\u00020\u000e8F@FX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\f\u001a\u0004\b\u0010\u0010\u0011\"\u0004\b\u0012\u0010\u0013R\u0010\u0010\u0014\u001a\u0004\u0018\u00010\u0015X\u0082\u000e¢\u0006\u0002\n\u0000R*\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0007\u001a\u00020\u00168F@FX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\f\u001a\u0004\b\u0018\u0010\u0019\"\u0004\b\u001a\u0010\u001bR$\u0010\u001c\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\b\u001d\u0010\u000b\"\u0004\b\u001e\u0010\rR\u000e\u0010\u001f\u001a\u00020 X\u0082\u0004¢\u0006\u0002\n\u0000R,\u0010\"\u001a\u00020!2\u0006\u0010\u0007\u001a\u00020!8F@FX\u0086\u000e¢\u0006\u0014\n\u0000\u0012\u0004\b#\u0010$\u001a\u0004\b%\u0010&\"\u0004\b'\u0010(R\u001f\u0010)\u001a\u0013\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020,0*¢\u0006\u0002\b-X\u0082\u0004¢\u0006\u0002\n\u0000R(\u0010/\u001a\u0004\u0018\u00010.2\b\u0010\u0007\u001a\u0004\u0018\u00010.8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\b0\u00101\"\u0004\b2\u00103R*\u00105\u001a\u0002042\u0006\u0010\u0007\u001a\u0002048F@FX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\f\u001a\u0004\b6\u0010\u0019\"\u0004\b7\u0010\u001bR\u000e\u00108\u001a\u000209X\u0082\u000e¢\u0006\u0002\n\u0000R\u001f\u0010:\u001a\u0013\u0012\u0004\u0012\u00020+\u0012\u0004\u0012\u00020,0*¢\u0006\u0002\b-X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b;\u0010<R\u0010\u0010=\u001a\u0004\u0018\u00010>X\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010@\u001a\u00020!2\u0006\u0010?\u001a\u00020!@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\b@\u0010&R\u0011\u0010A\u001a\u00020B8F¢\u0006\u0006\u001a\u0004\bC\u0010\u0011R\u0010\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010D\u001a\u00020EX\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010F\u001a\u00020>8F¢\u0006\u0006\u001a\u0004\bG\u0010HR\u000e\u0010I\u001a\u00020!X\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010J\u001a\u0004\u0018\u00010KX\u0082\u000e¢\u0006\u0002\n\u0000R\u0011\u0010L\u001a\u00020B8F¢\u0006\u0006\u001a\u0004\bM\u0010\u0011R\u000e\u0010N\u001a\u00020OX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010P\u001a\u0004\u0018\u00010QX\u0082\u000e¢\u0006\u0002\n\u0000R,\u0010S\u001a\u00020R2\u0006\u0010\u0007\u001a\u00020R@FX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010V\u001a\u0004\bT\u0010\u0011\"\u0004\bU\u0010\u0013R(\u0010X\u001a\u0004\u0018\u00010W2\b\u0010\u0007\u001a\u0004\u0018\u00010W8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\bY\u0010Z\"\u0004\b[\u0010\\R$\u0010]\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\b^\u0010\u000b\"\u0004\b_\u0010\rR$\u0010`\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\ba\u0010\u000b\"\u0004\bb\u0010\rR$\u0010c\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\bd\u0010\u000b\"\u0004\be\u0010\rR\u0010\u0010f\u001a\u0004\u0018\u00010KX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010g\u001a\u00020\bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010h\u001a\u00020iX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010VR\u0016\u0010j\u001a\u00020RX\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010VR$\u0010k\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\bl\u0010\u000b\"\u0004\bm\u0010\rR$\u0010n\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\bo\u0010\u000b\"\u0004\bp\u0010\rR$\u0010q\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b8F@FX\u0086\u000e¢\u0006\f\u001a\u0004\br\u0010\u000b\"\u0004\bs\u0010\rR,\u0010u\u001a\u00020t2\u0006\u0010\u0007\u001a\u00020t@BX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010V\u001a\u0004\bv\u0010\u0011\"\u0004\bw\u0010\u0013R\u0010\u0010x\u001a\u0004\u0018\u00010yX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010z\u001a\u0004\u0018\u00010{X\u0082\u000e¢\u0006\u0002\n\u0000R*\u0010|\u001a\u00020\u000e2\u0006\u0010\u0007\u001a\u00020\u000e8F@FX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\f\u001a\u0004\b}\u0010\u0011\"\u0004\b~\u0010\u0013R/\u0010\u0080\u0001\u001a\u00020\u007f2\u0006\u0010\u0007\u001a\u00020\u007f@FX\u0086\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0012\n\u0002\u0010V\u001a\u0005\b\u0081\u0001\u0010\u0011\"\u0005\b\u0082\u0001\u0010\u0013R'\u0010\u0083\u0001\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b8F@FX\u0086\u000e¢\u0006\u000e\u001a\u0005\b\u0084\u0001\u0010\u000b\"\u0005\b\u0085\u0001\u0010\rR'\u0010\u0086\u0001\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\b8F@FX\u0086\u000e¢\u0006\u000e\u001a\u0005\b\u0087\u0001\u0010\u000b\"\u0005\b\u0088\u0001\u0010\rR\u000f\u0010\u0089\u0001\u001a\u00020!X\u0082\u000e¢\u0006\u0002\n\u0000\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006¾\u0001"}, d2 = {"Landroidx/compose/ui/graphics/layer/GraphicsLayer;", "", "impl", "Landroidx/compose/ui/graphics/layer/GraphicsLayerImpl;", "layerManager", "Landroidx/compose/ui/graphics/layer/LayerManager;", "(Landroidx/compose/ui/graphics/layer/GraphicsLayerImpl;Landroidx/compose/ui/graphics/layer/LayerManager;)V", "value", "", "alpha", "getAlpha", "()F", "setAlpha", "(F)V", "Landroidx/compose/ui/graphics/Color;", "ambientShadowColor", "getAmbientShadowColor-0d7_KjU", "()J", "setAmbientShadowColor-8_81llA", "(J)V", "androidOutline", "Landroid/graphics/Outline;", "Landroidx/compose/ui/graphics/BlendMode;", "blendMode", "getBlendMode-0nO6VwU", "()I", "setBlendMode-s9anfk8", "(I)V", "cameraDistance", "getCameraDistance", "setCameraDistance", "childDependenciesTracker", "Landroidx/compose/ui/graphics/layer/ChildLayerDependenciesTracker;", "", "clip", "getClip$annotations", "()V", "getClip", "()Z", "setClip", "(Z)V", "clipDrawBlock", "Lkotlin/Function1;", "Landroidx/compose/ui/graphics/drawscope/DrawScope;", "", "Lkotlin/ExtensionFunctionType;", "Landroidx/compose/ui/graphics/ColorFilter;", "colorFilter", "getColorFilter", "()Landroidx/compose/ui/graphics/ColorFilter;", "setColorFilter", "(Landroidx/compose/ui/graphics/ColorFilter;)V", "Landroidx/compose/ui/graphics/layer/CompositingStrategy;", "compositingStrategy", "getCompositingStrategy-ke2Ky5w", "setCompositingStrategy-Wpw9cng", "density", "Landroidx/compose/ui/unit/Density;", "drawBlock", "getImpl$ui_graphics_release", "()Landroidx/compose/ui/graphics/layer/GraphicsLayerImpl;", "internalOutline", "Landroidx/compose/ui/graphics/Outline;", "<set-?>", "isReleased", "layerId", "", "getLayerId", "layoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "outline", "getOutline", "()Landroidx/compose/ui/graphics/Outline;", "outlineDirty", "outlinePath", "Landroidx/compose/ui/graphics/Path;", "ownerViewId", "getOwnerViewId", "parentLayerUsages", "", "pathBounds", "Landroid/graphics/RectF;", "Landroidx/compose/ui/geometry/Offset;", "pivotOffset", "getPivotOffset-F1C5BW0", "setPivotOffset-k-4lQ0M", "J", "Landroidx/compose/ui/graphics/RenderEffect;", "renderEffect", "getRenderEffect", "()Landroidx/compose/ui/graphics/RenderEffect;", "setRenderEffect", "(Landroidx/compose/ui/graphics/RenderEffect;)V", "rotationX", "getRotationX", "setRotationX", "rotationY", "getRotationY", "setRotationY", "rotationZ", "getRotationZ", "setRotationZ", "roundRectClipPath", "roundRectCornerRadius", "roundRectOutlineSize", "Landroidx/compose/ui/geometry/Size;", "roundRectOutlineTopLeft", "scaleX", "getScaleX", "setScaleX", "scaleY", "getScaleY", "setScaleY", "shadowElevation", "getShadowElevation", "setShadowElevation", "Landroidx/compose/ui/unit/IntSize;", "size", "getSize-YbymL2g", "setSize-ozmzZPI", "softwareDrawScope", "Landroidx/compose/ui/graphics/drawscope/CanvasDrawScope;", "softwareLayerPaint", "Landroidx/compose/ui/graphics/Paint;", "spotShadowColor", "getSpotShadowColor-0d7_KjU", "setSpotShadowColor-8_81llA", "Landroidx/compose/ui/unit/IntOffset;", "topLeft", "getTopLeft-nOcc-ac", "setTopLeft--gyyYBs", "translationX", "getTranslationX", "setTranslationX", "translationY", "getTranslationY", "setTranslationY", "usePathForClip", "addSubLayer", "graphicsLayer", "configureOutlineAndClip", "discardContentIfReleasedAndHaveNoParentLayerUsages", "discardDisplayList", "discardDisplayList$ui_graphics_release", "draw", "canvas", "Landroidx/compose/ui/graphics/Canvas;", "parentLayer", "draw$ui_graphics_release", "drawForPersistence", "drawForPersistence$ui_graphics_release", "emulateTrimMemory", "emulateTrimMemory$ui_graphics_release", "obtainAndroidOutline", "obtainPathBounds", "onAddedToParentLayer", "onRemovedFromParentLayer", "record", "block", "record-mL-hObY", "(Landroidx/compose/ui/unit/Density;Landroidx/compose/ui/unit/LayoutDirection;JLkotlin/jvm/functions/Function1;)V", "recordInternal", "recreateDisplayListIfNeeded", "release", "release$ui_graphics_release", "resetOutlineParams", "resolveOutlinePosition", ExifInterface.GPS_DIRECTION_TRUE, "Lkotlin/Function2;", "(Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;", "setPathOutline", "path", "setPosition", "setPosition-VbeCjmY", "(JJ)V", "setRectOutline", "setRectOutline-tz77jQw", "setRoundRectOutline", "cornerRadius", "setRoundRectOutline-TNW_H78", "(JJF)V", "toImageBitmap", "Landroidx/compose/ui/graphics/ImageBitmap;", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "transformCanvas", "androidCanvas", "Landroid/graphics/Canvas;", "updatePathOutline", "drawWithChildTracking", "Companion", "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class GraphicsLayer {
    public static final Companion Companion = new Companion(null);
    private static final LayerSnapshotImpl SnapshotImpl;
    private Outline androidOutline;
    private boolean clip;
    private final GraphicsLayerImpl impl;
    private androidx.compose.ui.graphics.Outline internalOutline;
    private boolean isReleased;
    private final LayerManager layerManager;
    private Path outlinePath;
    private int parentLayerUsages;
    private RectF pathBounds;
    private long pivotOffset;
    private Path roundRectClipPath;
    private float roundRectCornerRadius;
    private long size;
    private CanvasDrawScope softwareDrawScope;
    private Paint softwareLayerPaint;
    private long topLeft;
    private boolean usePathForClip;
    private Density density = DrawContextKt.getDefaultDensity();
    private LayoutDirection layoutDirection = LayoutDirection.Ltr;
    private Function1<? super DrawScope, Unit> drawBlock = new Function1<DrawScope, Unit>() { // from class: androidx.compose.ui.graphics.layer.GraphicsLayer$drawBlock$1
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Unit invoke(DrawScope drawScope) {
            invoke2(drawScope);
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(DrawScope $this$null) {
        }
    };
    private final Function1<DrawScope, Unit> clipDrawBlock = new Function1<DrawScope, Unit>() { // from class: androidx.compose.ui.graphics.layer.GraphicsLayer$clipDrawBlock$1
        /* JADX INFO: Access modifiers changed from: package-private */
        {
            super(1);
        }

        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Unit invoke(DrawScope drawScope) {
            invoke2(drawScope);
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(DrawScope $this$null) {
            Path path;
            boolean z;
            path = GraphicsLayer.this.outlinePath;
            z = GraphicsLayer.this.usePathForClip;
            if (!z || !GraphicsLayer.this.getClip() || path == null) {
                GraphicsLayer.this.drawWithChildTracking($this$null);
                return;
            }
            GraphicsLayer graphicsLayer = GraphicsLayer.this;
            int clipOp$iv = ClipOp.Companion.m4278getIntersectrtfAjoo();
            DrawContext $this$withTransform_u24lambda_u246$iv$iv = $this$null.getDrawContext();
            long previousSize$iv$iv = $this$withTransform_u24lambda_u246$iv$iv.mo4761getSizeNHjbRc();
            $this$withTransform_u24lambda_u246$iv$iv.getCanvas().save();
            try {
                DrawTransform $this$clipPath_KD09W0M_u24lambda_u245$iv = $this$withTransform_u24lambda_u246$iv$iv.getTransform();
                $this$clipPath_KD09W0M_u24lambda_u245$iv.mo4763clipPathmtrdDE(path, clipOp$iv);
                graphicsLayer.drawWithChildTracking($this$null);
            } finally {
                $this$withTransform_u24lambda_u246$iv$iv.getCanvas().restore();
                $this$withTransform_u24lambda_u246$iv$iv.mo4762setSizeuvyYCjk(previousSize$iv$iv);
            }
        }
    };
    private boolean outlineDirty = true;
    private long roundRectOutlineTopLeft = Offset.Companion.m4064getZeroF1C5BW0();
    private long roundRectOutlineSize = Size.Companion.m4125getUnspecifiedNHjbRc();
    private final ChildLayerDependenciesTracker childDependenciesTracker = new ChildLayerDependenciesTracker();

    public static /* synthetic */ void getClip$annotations() {
    }

    public GraphicsLayer(GraphicsLayerImpl impl, LayerManager layerManager) {
        this.impl = impl;
        this.layerManager = layerManager;
        this.impl.setClip(false);
        this.topLeft = IntOffset.Companion.m7012getZeronOccac();
        this.size = IntSize.Companion.m7049getZeroYbymL2g();
        this.pivotOffset = Offset.Companion.m4063getUnspecifiedF1C5BW0();
    }

    public final GraphicsLayerImpl getImpl$ui_graphics_release() {
        return this.impl;
    }

    public final boolean isReleased() {
        return this.isReleased;
    }

    /* renamed from: getCompositingStrategy-ke2Ky5w  reason: not valid java name */
    public final int m4929getCompositingStrategyke2Ky5w() {
        return this.impl.mo4945getCompositingStrategyke2Ky5w();
    }

    /* renamed from: setCompositingStrategy-Wpw9cng  reason: not valid java name */
    public final void m4937setCompositingStrategyWpw9cng(int value) {
        if (!CompositingStrategy.m4916equalsimpl0(this.impl.mo4945getCompositingStrategyke2Ky5w(), value)) {
            this.impl.mo4950setCompositingStrategyWpw9cng(value);
        }
    }

    /* renamed from: getTopLeft-nOcc-ac  reason: not valid java name */
    public final long m4933getTopLeftnOccac() {
        return this.topLeft;
    }

    /* renamed from: setTopLeft--gyyYBs  reason: not valid java name */
    public final void m4942setTopLeftgyyYBs(long value) {
        if (!IntOffset.m7000equalsimpl0(this.topLeft, value)) {
            this.topLeft = value;
            m4923setPositionVbeCjmY(value, this.size);
        }
    }

    /* renamed from: getSize-YbymL2g  reason: not valid java name */
    public final long m4931getSizeYbymL2g() {
        return this.size;
    }

    /* renamed from: setSize-ozmzZPI  reason: not valid java name */
    private final void m4926setSizeozmzZPI(long value) {
        if (!IntSize.m7042equalsimpl0(this.size, value)) {
            this.size = value;
            m4923setPositionVbeCjmY(this.topLeft, value);
            long $this$isUnspecified$iv = this.roundRectOutlineSize;
            if ($this$isUnspecified$iv == InlineClassHelperKt.UnspecifiedPackedFloats) {
                this.outlineDirty = true;
                configureOutlineAndClip();
            }
        }
    }

    public final float getAlpha() {
        return this.impl.getAlpha();
    }

    public final void setAlpha(float value) {
        if (!(this.impl.getAlpha() == value)) {
            this.impl.setAlpha(value);
        }
    }

    /* renamed from: getBlendMode-0nO6VwU  reason: not valid java name */
    public final int m4928getBlendMode0nO6VwU() {
        return this.impl.mo4944getBlendMode0nO6VwU();
    }

    /* renamed from: setBlendMode-s9anfk8  reason: not valid java name */
    public final void m4936setBlendModes9anfk8(int value) {
        if (!BlendMode.m4200equalsimpl0(this.impl.mo4944getBlendMode0nO6VwU(), value)) {
            this.impl.mo4949setBlendModes9anfk8(value);
        }
    }

    public final ColorFilter getColorFilter() {
        return this.impl.getColorFilter();
    }

    public final void setColorFilter(ColorFilter value) {
        if (!Intrinsics.areEqual(this.impl.getColorFilter(), value)) {
            this.impl.setColorFilter(value);
        }
    }

    /* renamed from: getPivotOffset-F1C5BW0  reason: not valid java name */
    public final long m4930getPivotOffsetF1C5BW0() {
        return this.pivotOffset;
    }

    /* renamed from: setPivotOffset-k-4lQ0M  reason: not valid java name */
    public final void m4938setPivotOffsetk4lQ0M(long value) {
        if (!Offset.m4045equalsimpl0(this.pivotOffset, value)) {
            this.pivotOffset = value;
            this.impl.mo4952setPivotOffsetk4lQ0M(value);
        }
    }

    public final float getScaleX() {
        return this.impl.getScaleX();
    }

    public final void setScaleX(float value) {
        if (!(this.impl.getScaleX() == value)) {
            this.impl.setScaleX(value);
        }
    }

    public final float getScaleY() {
        return this.impl.getScaleY();
    }

    public final void setScaleY(float value) {
        if (!(this.impl.getScaleY() == value)) {
            this.impl.setScaleY(value);
        }
    }

    public final float getTranslationX() {
        return this.impl.getTranslationX();
    }

    public final void setTranslationX(float value) {
        if (!(this.impl.getTranslationX() == value)) {
            this.impl.setTranslationX(value);
        }
    }

    public final float getTranslationY() {
        return this.impl.getTranslationY();
    }

    public final void setTranslationY(float value) {
        if (!(this.impl.getTranslationY() == value)) {
            this.impl.setTranslationY(value);
        }
    }

    public final float getShadowElevation() {
        return this.impl.getShadowElevation();
    }

    public final void setShadowElevation(float value) {
        if (!(this.impl.getShadowElevation() == value)) {
            this.impl.setShadowElevation(value);
            this.outlineDirty = true;
            configureOutlineAndClip();
        }
    }

    public final float getRotationX() {
        return this.impl.getRotationX();
    }

    public final void setRotationX(float value) {
        if (!(this.impl.getRotationX() == value)) {
            this.impl.setRotationX(value);
        }
    }

    public final float getRotationY() {
        return this.impl.getRotationY();
    }

    public final void setRotationY(float value) {
        if (!(this.impl.getRotationY() == value)) {
            this.impl.setRotationY(value);
        }
    }

    public final float getRotationZ() {
        return this.impl.getRotationZ();
    }

    public final void setRotationZ(float value) {
        if (!(this.impl.getRotationZ() == value)) {
            this.impl.setRotationZ(value);
        }
    }

    public final float getCameraDistance() {
        return this.impl.getCameraDistance();
    }

    public final void setCameraDistance(float value) {
        if (!(this.impl.getCameraDistance() == value)) {
            this.impl.setCameraDistance(value);
        }
    }

    public final boolean getClip() {
        return this.clip;
    }

    public final void setClip(boolean value) {
        if (this.clip != value) {
            this.clip = value;
            this.outlineDirty = true;
            configureOutlineAndClip();
        }
    }

    public final RenderEffect getRenderEffect() {
        return this.impl.getRenderEffect();
    }

    public final void setRenderEffect(RenderEffect value) {
        if (!Intrinsics.areEqual(this.impl.getRenderEffect(), value)) {
            this.impl.setRenderEffect(value);
        }
    }

    /* renamed from: setPosition-VbeCjmY  reason: not valid java name */
    private final void m4923setPositionVbeCjmY(long topLeft, long size) {
        this.impl.mo4953setPositionH0pRuoY(IntOffset.m7001getXimpl(topLeft), IntOffset.m7002getYimpl(topLeft), size);
    }

    /* renamed from: record-mL-hObY  reason: not valid java name */
    public final void m4934recordmLhObY(Density density, LayoutDirection layoutDirection, long size, Function1<? super DrawScope, Unit> function1) {
        m4926setSizeozmzZPI(size);
        this.density = density;
        this.layoutDirection = layoutDirection;
        this.drawBlock = function1;
        this.impl.setInvalidated(true);
        recordInternal();
    }

    private final void recordInternal() {
        this.impl.record(this.density, this.layoutDirection, this, this.clipDrawBlock);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void drawWithChildTracking(DrawScope $this$drawWithChildTracking) {
        ChildLayerDependenciesTracker this_$iv = this.childDependenciesTracker;
        ChildLayerDependenciesTracker.access$setOldDependency$p(this_$iv, ChildLayerDependenciesTracker.access$getDependency$p(this_$iv));
        MutableScatterSet currentSet$iv = ChildLayerDependenciesTracker.access$getDependenciesSet$p(this_$iv);
        if (currentSet$iv != null && currentSet$iv.isNotEmpty()) {
            MutableScatterSet it$iv = ChildLayerDependenciesTracker.access$getOldDependenciesSet$p(this_$iv);
            if (it$iv == null) {
                it$iv = ScatterSetKt.mutableScatterSetOf();
                ChildLayerDependenciesTracker.access$setOldDependenciesSet$p(this_$iv, it$iv);
            }
            it$iv.addAll(currentSet$iv);
            currentSet$iv.clear();
        }
        ChildLayerDependenciesTracker.access$setTrackingInProgress$p(this_$iv, true);
        this.drawBlock.invoke($this$drawWithChildTracking);
        ChildLayerDependenciesTracker.access$setTrackingInProgress$p(this_$iv, false);
        GraphicsLayer it = ChildLayerDependenciesTracker.access$getOldDependency$p(this_$iv);
        if (it != null) {
            it.onRemovedFromParentLayer();
        }
        MutableScatterSet oldSet$iv = ChildLayerDependenciesTracker.access$getOldDependenciesSet$p(this_$iv);
        if (oldSet$iv != null && oldSet$iv.isNotEmpty()) {
            MutableScatterSet this_$iv$iv = oldSet$iv;
            Object[] elements$iv$iv = this_$iv$iv.elements;
            long[] m$iv$iv$iv = this_$iv$iv.metadata;
            int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
            int i$iv$iv$iv = 0;
            if (0 <= lastIndex$iv$iv$iv) {
                while (true) {
                    long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv];
                    ChildLayerDependenciesTracker this_$iv2 = this_$iv;
                    if ((((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L)) != -9187201950435737472L) {
                        int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                        for (int j$iv$iv$iv = 0; j$iv$iv$iv < bitCount$iv$iv$iv; j$iv$iv$iv++) {
                            long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                            int $i$f$isFull = value$iv$iv$iv$iv < 128 ? 1 : 0;
                            if ($i$f$isFull != 0) {
                                int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv;
                                ((GraphicsLayer) elements$iv$iv[index$iv$iv$iv]).onRemovedFromParentLayer();
                            }
                            slot$iv$iv$iv >>= 8;
                        }
                        if (bitCount$iv$iv$iv != 8) {
                            break;
                        }
                    }
                    if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                        break;
                    }
                    i$iv$iv$iv++;
                    this_$iv = this_$iv2;
                }
            }
            oldSet$iv.clear();
        }
    }

    private final void addSubLayer(GraphicsLayer graphicsLayer) {
        if (this.childDependenciesTracker.onDependencyAdded(graphicsLayer)) {
            graphicsLayer.onAddedToParentLayer();
        }
    }

    private final void transformCanvas(Canvas androidCanvas) {
        Canvas androidCanvas2;
        float left = IntOffset.m7001getXimpl(this.topLeft);
        float top = IntOffset.m7002getYimpl(this.topLeft);
        long arg0$iv = this.size;
        float right = IntOffset.m7001getXimpl(this.topLeft) + ((int) (arg0$iv >> 32));
        long arg0$iv2 = this.size;
        float bottom = IntOffset.m7002getYimpl(this.topLeft) + ((int) (4294967295L & arg0$iv2));
        float layerAlpha = getAlpha();
        ColorFilter layerColorFilter = getColorFilter();
        int layerBlendMode = m4928getBlendMode0nO6VwU();
        boolean useSaveLayer = layerAlpha < 1.0f || !BlendMode.m4200equalsimpl0(layerBlendMode, BlendMode.Companion.m4231getSrcOver0nO6VwU()) || layerColorFilter != null || CompositingStrategy.m4916equalsimpl0(m4929getCompositingStrategyke2Ky5w(), CompositingStrategy.Companion.m4922getOffscreenke2Ky5w());
        if (useSaveLayer) {
            Paint it = this.softwareLayerPaint;
            if (it == null) {
                it = AndroidPaint_androidKt.Paint();
                this.softwareLayerPaint = it;
            }
            Paint it2 = it;
            it2.setAlpha(layerAlpha);
            it2.mo4167setBlendModes9anfk8(layerBlendMode);
            it2.setColorFilter(layerColorFilter);
            Paint paint = it;
            androidCanvas2 = androidCanvas;
            androidCanvas2.saveLayer(left, top, right, bottom, paint.asFrameworkPaint());
        } else {
            androidCanvas2 = androidCanvas;
            androidCanvas2.save();
        }
        androidCanvas2.translate(left, top);
        androidCanvas2.concat(this.impl.calculateMatrix());
    }

    public final void drawForPersistence$ui_graphics_release(androidx.compose.ui.graphics.Canvas canvas) {
        if (AndroidCanvas_androidKt.getNativeCanvas(canvas).isHardwareAccelerated() || this.impl.getSupportsSoftwareRendering()) {
            recreateDisplayListIfNeeded();
            this.impl.draw(canvas);
        }
    }

    private final void recreateDisplayListIfNeeded() {
        if (!this.impl.getHasDisplayList()) {
            try {
                recordInternal();
            } catch (Throwable th) {
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:53:0x015b  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0160  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0165  */
    /* JADX WARN: Removed duplicated region for block: B:61:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void draw$ui_graphics_release(androidx.compose.ui.graphics.Canvas r23, androidx.compose.ui.graphics.layer.GraphicsLayer r24) {
        /*
            Method dump skipped, instructions count: 361
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.graphics.layer.GraphicsLayer.draw$ui_graphics_release(androidx.compose.ui.graphics.Canvas, androidx.compose.ui.graphics.layer.GraphicsLayer):void");
    }

    private final void onAddedToParentLayer() {
        this.parentLayerUsages++;
    }

    private final void onRemovedFromParentLayer() {
        this.parentLayerUsages--;
        discardContentIfReleasedAndHaveNoParentLayerUsages();
    }

    private final RectF obtainPathBounds() {
        RectF rectF = this.pathBounds;
        if (rectF == null) {
            RectF it = new RectF();
            this.pathBounds = it;
            return it;
        }
        return rectF;
    }

    private final void configureOutlineAndClip() {
        long outlineSize$iv;
        if (this.outlineDirty) {
            boolean outlineIsNeeded = this.clip || getShadowElevation() > 0.0f;
            Outline $this$configureOutlineAndClip_u24lambda_u249 = null;
            if (!outlineIsNeeded) {
                this.impl.setClip(false);
                this.impl.mo4951setOutlineO0kMr_c(null, IntSize.Companion.m7049getZeroYbymL2g());
            } else {
                Path tmpPath = this.outlinePath;
                if (tmpPath == null) {
                    this.impl.setClip(this.clip);
                    Size.Companion.m4126getZeroNHjbRc();
                    Outline roundRectOutline = obtainAndroidOutline();
                    long layerSize$iv = IntSizeKt.m7056toSizeozmzZPI(this.size);
                    long rRectTopLeft$iv = this.roundRectOutlineTopLeft;
                    long rRectSize$iv = this.roundRectOutlineSize;
                    if (rRectSize$iv == InlineClassHelperKt.UnspecifiedPackedFloats) {
                        outlineSize$iv = layerSize$iv;
                    } else {
                        outlineSize$iv = rRectSize$iv;
                    }
                    long outlineSize = outlineSize$iv;
                    int bits$iv$iv$iv = (int) (rRectTopLeft$iv >> 32);
                    float $this$fastRoundToInt$iv = Float.intBitsToFloat(bits$iv$iv$iv);
                    int left = Math.round($this$fastRoundToInt$iv);
                    int bits$iv$iv$iv2 = (int) (rRectTopLeft$iv & 4294967295L);
                    float $this$fastRoundToInt$iv2 = Float.intBitsToFloat(bits$iv$iv$iv2);
                    int top = Math.round($this$fastRoundToInt$iv2);
                    int bits$iv$iv$iv3 = (int) (rRectTopLeft$iv >> 32);
                    float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv3);
                    int bits$iv$iv$iv4 = (int) (outlineSize >> 32);
                    float $this$fastRoundToInt$iv3 = Float.intBitsToFloat(bits$iv$iv$iv4) + intBitsToFloat;
                    int right = Math.round($this$fastRoundToInt$iv3);
                    int bits$iv$iv$iv5 = (int) (rRectTopLeft$iv & 4294967295L);
                    float intBitsToFloat2 = Float.intBitsToFloat(bits$iv$iv$iv5);
                    int bits$iv$iv$iv6 = (int) (outlineSize & 4294967295L);
                    float $this$fastRoundToInt$iv4 = intBitsToFloat2 + Float.intBitsToFloat(bits$iv$iv$iv6);
                    int bottom = Math.round($this$fastRoundToInt$iv4);
                    roundRectOutline.setRoundRect(left, top, right, bottom, this.roundRectCornerRadius);
                    roundRectOutline.setAlpha(getAlpha());
                    this.impl.mo4951setOutlineO0kMr_c(roundRectOutline, IntSizeKt.m7052roundToIntSizeuvyYCjk(outlineSize));
                } else {
                    RectF bounds = obtainPathBounds();
                    if (tmpPath instanceof AndroidPath) {
                        ((AndroidPath) tmpPath).getInternalPath().computeBounds(bounds, false);
                        Outline updatePathOutline = updatePathOutline(tmpPath);
                        if (updatePathOutline != null) {
                            $this$configureOutlineAndClip_u24lambda_u249 = updatePathOutline;
                            $this$configureOutlineAndClip_u24lambda_u249.setAlpha(getAlpha());
                        }
                        GraphicsLayerImpl graphicsLayerImpl = this.impl;
                        float $this$fastRoundToInt$iv5 = bounds.width();
                        int width$iv = Math.round($this$fastRoundToInt$iv5);
                        float $this$fastRoundToInt$iv6 = bounds.height();
                        int height$iv = Math.round($this$fastRoundToInt$iv6);
                        graphicsLayerImpl.mo4951setOutlineO0kMr_c($this$configureOutlineAndClip_u24lambda_u249, IntSize.m7039constructorimpl((height$iv & 4294967295L) | (width$iv << 32)));
                        if (!this.usePathForClip || !this.clip) {
                            this.impl.setClip(this.clip);
                        } else {
                            this.impl.setClip(false);
                            this.impl.discardDisplayList();
                        }
                    } else {
                        throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
                    }
                }
            }
        }
        this.outlineDirty = false;
    }

    private final <T> T resolveOutlinePosition(Function2<? super Offset, ? super Size, ? extends T> function2) {
        long outlineSize;
        long layerSize = IntSizeKt.m7056toSizeozmzZPI(this.size);
        long rRectTopLeft = this.roundRectOutlineTopLeft;
        long rRectSize = this.roundRectOutlineSize;
        if (rRectSize == InlineClassHelperKt.UnspecifiedPackedFloats) {
            outlineSize = layerSize;
        } else {
            outlineSize = rRectSize;
        }
        return function2.invoke(Offset.m4037boximpl(rRectTopLeft), Size.m4105boximpl(outlineSize));
    }

    private final Outline updatePathOutline(Path path) {
        Outline resultOutline;
        if (Build.VERSION.SDK_INT > 28 || path.isConvex()) {
            resultOutline = obtainAndroidOutline();
            if (Build.VERSION.SDK_INT >= 30) {
                OutlineVerificationHelper.INSTANCE.setPath(resultOutline, path);
            } else if (path instanceof AndroidPath) {
                resultOutline.setConvexPath(((AndroidPath) path).getInternalPath());
            } else {
                throw new UnsupportedOperationException("Unable to obtain android.graphics.Path");
            }
            this.usePathForClip = !resultOutline.canClip();
        } else {
            Outline outline = this.androidOutline;
            if (outline != null) {
                outline.setEmpty();
            }
            resultOutline = null;
            this.usePathForClip = true;
            this.impl.setInvalidated(true);
        }
        this.outlinePath = path;
        return resultOutline;
    }

    private final Outline obtainAndroidOutline() {
        Outline outline = this.androidOutline;
        if (outline == null) {
            Outline it = new Outline();
            this.androidOutline = it;
            return it;
        }
        return outline;
    }

    public final void release$ui_graphics_release() {
        if (!this.isReleased) {
            this.isReleased = true;
            discardContentIfReleasedAndHaveNoParentLayerUsages();
        }
    }

    private final void discardContentIfReleasedAndHaveNoParentLayerUsages() {
        if (this.isReleased && this.parentLayerUsages == 0) {
            if (this.layerManager != null) {
                this.layerManager.release(this);
            } else {
                discardDisplayList$ui_graphics_release();
            }
        }
    }

    public final void discardDisplayList$ui_graphics_release() {
        MutableScatterSet it$iv;
        ChildLayerDependenciesTracker this_$iv = this.childDependenciesTracker;
        int $i$f$removeDependencies = 0;
        GraphicsLayer it$iv2 = ChildLayerDependenciesTracker.access$getDependency$p(this_$iv);
        if (it$iv2 != null) {
            it$iv2.onRemovedFromParentLayer();
            ChildLayerDependenciesTracker.access$setDependency$p(this_$iv, null);
        }
        ScatterSet it$iv3 = ChildLayerDependenciesTracker.access$getDependenciesSet$p(this_$iv);
        if (it$iv3 != null) {
            int i = 0;
            ScatterSet this_$iv$iv = it$iv3;
            Object[] elements$iv$iv = this_$iv$iv.elements;
            long[] m$iv$iv$iv = this_$iv$iv.metadata;
            int lastIndex$iv$iv$iv = m$iv$iv$iv.length - 2;
            int i$iv$iv$iv = 0;
            if (0 <= lastIndex$iv$iv$iv) {
                while (true) {
                    long slot$iv$iv$iv = m$iv$iv$iv[i$iv$iv$iv];
                    ChildLayerDependenciesTracker this_$iv2 = this_$iv;
                    int $i$f$removeDependencies2 = $i$f$removeDependencies;
                    it$iv = it$iv3;
                    int i2 = i;
                    long $this$maskEmptyOrDeleted$iv$iv$iv$iv = ((~slot$iv$iv$iv) << 7) & slot$iv$iv$iv & (-9187201950435737472L);
                    if ($this$maskEmptyOrDeleted$iv$iv$iv$iv != -9187201950435737472L) {
                        int bitCount$iv$iv$iv = 8 - ((~(i$iv$iv$iv - lastIndex$iv$iv$iv)) >>> 31);
                        for (int j$iv$iv$iv = 0; j$iv$iv$iv < bitCount$iv$iv$iv; j$iv$iv$iv++) {
                            long value$iv$iv$iv$iv = slot$iv$iv$iv & 255;
                            if (value$iv$iv$iv$iv < 128) {
                                int index$iv$iv$iv = (i$iv$iv$iv << 3) + j$iv$iv$iv;
                                GraphicsLayer it = (GraphicsLayer) elements$iv$iv[index$iv$iv$iv];
                                it.onRemovedFromParentLayer();
                            }
                            slot$iv$iv$iv >>= 8;
                        }
                        if (bitCount$iv$iv$iv != 8) {
                            break;
                        }
                    }
                    if (i$iv$iv$iv == lastIndex$iv$iv$iv) {
                        break;
                    }
                    i$iv$iv$iv++;
                    it$iv3 = it$iv;
                    i = i2;
                    this_$iv = this_$iv2;
                    $i$f$removeDependencies = $i$f$removeDependencies2;
                }
            } else {
                it$iv = it$iv3;
            }
            it$iv.clear();
        }
        this.impl.discardDisplayList();
    }

    public final void emulateTrimMemory$ui_graphics_release() {
        this.impl.discardDisplayList();
    }

    public final long getLayerId() {
        return this.impl.getLayerId();
    }

    public final long getOwnerViewId() {
        return this.impl.getOwnerId();
    }

    public final androidx.compose.ui.graphics.Outline getOutline() {
        long outlineSize$iv;
        androidx.compose.ui.graphics.Outline it;
        androidx.compose.ui.graphics.Outline tmpOutline = this.internalOutline;
        Path tmpPath = this.outlinePath;
        if (tmpOutline != null) {
            return tmpOutline;
        }
        if (tmpPath != null) {
            Outline.Generic it2 = new Outline.Generic(tmpPath);
            this.internalOutline = it2;
            return it2;
        }
        long layerSize$iv = IntSizeKt.m7056toSizeozmzZPI(this.size);
        long rRectTopLeft$iv = this.roundRectOutlineTopLeft;
        long rRectSize$iv = this.roundRectOutlineSize;
        if (rRectSize$iv == InlineClassHelperKt.UnspecifiedPackedFloats) {
            outlineSize$iv = layerSize$iv;
        } else {
            outlineSize$iv = rRectSize$iv;
        }
        long outlineSize = outlineSize$iv;
        int bits$iv$iv$iv = (int) (rRectTopLeft$iv >> 32);
        float left = Float.intBitsToFloat(bits$iv$iv$iv);
        int bits$iv$iv$iv2 = (int) (rRectTopLeft$iv & 4294967295L);
        float top = Float.intBitsToFloat(bits$iv$iv$iv2);
        int bits$iv$iv$iv3 = (int) (outlineSize >> 32);
        float right = left + Float.intBitsToFloat(bits$iv$iv$iv3);
        int bits$iv$iv$iv4 = (int) (outlineSize & 4294967295L);
        float bottom = top + Float.intBitsToFloat(bits$iv$iv$iv4);
        float cornerRadius = this.roundRectCornerRadius;
        if (cornerRadius <= 0.0f) {
            it = new Outline.Rectangle(new Rect(left, top, right, bottom));
        } else {
            long v1$iv$iv = Float.floatToRawIntBits(cornerRadius);
            long v1$iv$iv2 = Float.floatToRawIntBits(cornerRadius);
            long v2$iv$iv = (v1$iv$iv << 32) | (v1$iv$iv2 & 4294967295L);
            it = new Outline.Rounded(RoundRectKt.m4102RoundRectgG7oq9Y(left, top, right, bottom, CornerRadius.m4002constructorimpl(v2$iv$iv)));
        }
        this.internalOutline = it;
        return it;
    }

    private final void resetOutlineParams() {
        this.internalOutline = null;
        this.outlinePath = null;
        this.roundRectOutlineSize = Size.Companion.m4125getUnspecifiedNHjbRc();
        this.roundRectOutlineTopLeft = Offset.Companion.m4064getZeroF1C5BW0();
        this.roundRectCornerRadius = 0.0f;
        this.outlineDirty = true;
        this.usePathForClip = false;
    }

    public final void setPathOutline(Path path) {
        resetOutlineParams();
        this.outlinePath = path;
        configureOutlineAndClip();
    }

    /* renamed from: setRoundRectOutline-TNW_H78  reason: not valid java name */
    public final void m4940setRoundRectOutlineTNW_H78(long topLeft, long size, float cornerRadius) {
        if (Offset.m4045equalsimpl0(this.roundRectOutlineTopLeft, topLeft) && Size.m4113equalsimpl0(this.roundRectOutlineSize, size)) {
            if ((this.roundRectCornerRadius == cornerRadius) && this.outlinePath == null) {
                return;
            }
        }
        resetOutlineParams();
        this.roundRectOutlineTopLeft = topLeft;
        this.roundRectOutlineSize = size;
        this.roundRectCornerRadius = cornerRadius;
        configureOutlineAndClip();
    }

    /* renamed from: setRectOutline-tz77jQw$default  reason: not valid java name */
    public static /* synthetic */ void m4924setRectOutlinetz77jQw$default(GraphicsLayer graphicsLayer, long j, long j2, int i, Object obj) {
        if ((i & 1) != 0) {
            j = Offset.Companion.m4064getZeroF1C5BW0();
        }
        if ((i & 2) != 0) {
            j2 = Size.Companion.m4125getUnspecifiedNHjbRc();
        }
        graphicsLayer.m4939setRectOutlinetz77jQw(j, j2);
    }

    /* renamed from: setRectOutline-tz77jQw  reason: not valid java name */
    public final void m4939setRectOutlinetz77jQw(long topLeft, long size) {
        m4940setRoundRectOutlineTNW_H78(topLeft, size, 0.0f);
    }

    /* renamed from: getAmbientShadowColor-0d7_KjU  reason: not valid java name */
    public final long m4927getAmbientShadowColor0d7_KjU() {
        return this.impl.mo4943getAmbientShadowColor0d7_KjU();
    }

    /* renamed from: setAmbientShadowColor-8_81llA  reason: not valid java name */
    public final void m4935setAmbientShadowColor8_81llA(long value) {
        if (!Color.m4290equalsimpl0(value, this.impl.mo4943getAmbientShadowColor0d7_KjU())) {
            this.impl.mo4948setAmbientShadowColor8_81llA(value);
        }
    }

    /* renamed from: getSpotShadowColor-0d7_KjU  reason: not valid java name */
    public final long m4932getSpotShadowColor0d7_KjU() {
        return this.impl.mo4947getSpotShadowColor0d7_KjU();
    }

    /* renamed from: setSpotShadowColor-8_81llA  reason: not valid java name */
    public final void m4941setSpotShadowColor8_81llA(long value) {
        if (!Color.m4290equalsimpl0(value, this.impl.mo4947getSpotShadowColor0d7_KjU())) {
            this.impl.mo4954setSpotShadowColor8_81llA(value);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0031  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object toImageBitmap(kotlin.coroutines.Continuation<? super androidx.compose.ui.graphics.ImageBitmap> r7) {
        /*
            r6 = this;
            boolean r0 = r7 instanceof androidx.compose.ui.graphics.layer.GraphicsLayer$toImageBitmap$1
            if (r0 == 0) goto L14
            r0 = r7
            androidx.compose.ui.graphics.layer.GraphicsLayer$toImageBitmap$1 r0 = (androidx.compose.ui.graphics.layer.GraphicsLayer$toImageBitmap$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.ui.graphics.layer.GraphicsLayer$toImageBitmap$1 r0 = new androidx.compose.ui.graphics.layer.GraphicsLayer$toImageBitmap$1
            r0.<init>(r6, r7)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L31;
                case 1: goto L2c;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException
            java.lang.String r1 = "call to 'resume' before 'invoke' with coroutine"
            r0.<init>(r1)
            throw r0
        L2c:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r1
            goto L41
        L31:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r6
            androidx.compose.ui.graphics.layer.LayerSnapshotImpl r4 = androidx.compose.ui.graphics.layer.GraphicsLayer.SnapshotImpl
            r5 = 1
            r0.label = r5
            java.lang.Object r3 = r4.toBitmap(r3, r0)
            if (r3 != r2) goto L41
            return r2
        L41:
            android.graphics.Bitmap r3 = (android.graphics.Bitmap) r3
            androidx.compose.ui.graphics.ImageBitmap r2 = androidx.compose.ui.graphics.AndroidImageBitmap_androidKt.asImageBitmap(r3)
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.graphics.layer.GraphicsLayer.toImageBitmap(kotlin.coroutines.Continuation):java.lang.Object");
    }

    /* compiled from: AndroidGraphicsLayer.android.kt */
    @Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0005"}, d2 = {"Landroidx/compose/ui/graphics/layer/GraphicsLayer$Companion;", "", "()V", "SnapshotImpl", "Landroidx/compose/ui/graphics/layer/LayerSnapshotImpl;", "ui-graphics_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }
    }

    static {
        LayerSnapshotV21 layerSnapshotV21;
        if (LayerManager.Companion.isRobolectric()) {
            layerSnapshotV21 = LayerSnapshotV21.INSTANCE;
        } else if (Build.VERSION.SDK_INT >= 28) {
            layerSnapshotV21 = LayerSnapshotV28.INSTANCE;
        } else if (SurfaceUtils.INSTANCE.isLockHardwareCanvasAvailable()) {
            layerSnapshotV21 = LayerSnapshotV22.INSTANCE;
        } else {
            layerSnapshotV21 = LayerSnapshotV21.INSTANCE;
        }
        SnapshotImpl = layerSnapshotV21;
    }
}
