package androidx.compose.ui.node;

import androidx.collection.MutableLongList;
import androidx.collection.MutableObjectIntMap;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.geometry.MutableRect;
import androidx.compose.ui.geometry.MutableRectKt;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.geometry.Size;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.graphics.GraphicsLayerScope;
import androidx.compose.ui.graphics.Matrix;
import androidx.compose.ui.graphics.Paint;
import androidx.compose.ui.graphics.ReusableGraphicsLayerScope;
import androidx.compose.ui.graphics.layer.GraphicsLayer;
import androidx.compose.ui.input.pointer.MatrixPositionCalculator;
import androidx.compose.ui.input.pointer.PointerType;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.AlignmentLine;
import androidx.compose.ui.layout.LayoutCoordinates;
import androidx.compose.ui.layout.LayoutCoordinatesKt;
import androidx.compose.ui.layout.LookaheadLayoutCoordinates;
import androidx.compose.ui.layout.Measurable;
import androidx.compose.ui.layout.MeasureResult;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.semantics.SemanticsConfiguration;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntOffsetKt;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.IntSizeKt;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.constraintlayout.core.motion.utils.TypedValues;
import androidx.exifinterface.media.ExifInterface;
import com.itextpdf.kernel.xmp.PdfConst;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.SetsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
/* compiled from: NodeCoordinator.kt */
@Metadata(d1 = {"\u0000¨\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0010\u0007\n\u0002\b\u000b\n\u0002\u0010\u000b\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\"\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0012\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0018\u0002\n\u0002\b\f\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0018\n\u0002\u0010\b\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u001c\n\u0002\u0018\u0002\n\u0002\b-\b \u0018\u0000 ¼\u00022\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u0004:\u0004¼\u0002½\u0002B\r\u0012\u0006\u0010\u0005\u001a\u00020\u0006¢\u0006\u0002\u0010\u0007J$\u0010\u0097\u0001\u001a\u00020\f2\u0007\u0010\u0098\u0001\u001a\u00020\u00002\u0007\u0010\u0099\u0001\u001a\u00020\u00102\u0007\u0010\u009a\u0001\u001a\u00020(H\u0002J2\u0010\u0097\u0001\u001a\u00030\u009b\u00012\u0007\u0010\u0098\u0001\u001a\u00020\u00002\b\u0010\u009c\u0001\u001a\u00030\u009b\u00012\u0007\u0010\u009d\u0001\u001a\u00020(H\u0002ø\u0001\u0000¢\u0006\u0006\b\u009e\u0001\u0010\u009f\u0001J\u001d\u0010 \u0001\u001a\u00020c2\u0006\u0010b\u001a\u00020cH\u0004ø\u0001\u0000¢\u0006\u0006\b¡\u0001\u0010¢\u0001J'\u0010£\u0001\u001a\u00020\u001c2\b\u0010¤\u0001\u001a\u00030\u009b\u00012\u0006\u0010b\u001a\u00020cH\u0004ø\u0001\u0000¢\u0006\u0006\b¥\u0001\u0010¦\u0001J\u001b\u0010§\u0001\u001a\u00020\f2\u0007\u0010¨\u0001\u001a\u00020\n2\t\u0010©\u0001\u001a\u0004\u0018\u00010\u000bJ\u001c\u0010ª\u0001\u001a\u00020\f2\u0007\u0010¨\u0001\u001a\u00020\n2\b\u0010«\u0001\u001a\u00030¬\u0001H\u0004J\u001d\u0010\u00ad\u0001\u001a\u00020\f2\u0007\u0010¨\u0001\u001a\u00020\n2\t\u0010©\u0001\u001a\u0004\u0018\u00010\u000bH\u0002J\t\u0010®\u0001\u001a\u00020\fH&J\u0018\u0010¯\u0001\u001a\u00020\u00002\u0007\u0010°\u0001\u001a\u00020\u0000H\u0000¢\u0006\u0003\b±\u0001J*\u0010²\u0001\u001a\u00030\u009b\u00012\u0007\u0010s\u001a\u00030\u009b\u00012\t\b\u0002\u0010\u009d\u0001\u001a\u00020(H\u0016ø\u0001\u0000¢\u0006\u0006\b³\u0001\u0010´\u0001J\u001b\u0010µ\u0001\u001a\u00020\f2\u0007\u0010¶\u0001\u001a\u00020\u00102\u0007\u0010\u009a\u0001\u001a\u00020(H\u0002J#\u0010·\u0001\u001a\u00020(2\f\u0010¸\u0001\u001a\u0007\u0012\u0002\b\u00030¹\u0001H\u0002ø\u0001\u0000¢\u0006\u0006\bº\u0001\u0010»\u0001J$\u0010¼\u0001\u001a\u0005\u0018\u00010\u0088\u00012\f\u0010¸\u0001\u001a\u0007\u0012\u0002\b\u00030¹\u0001ø\u0001\u0000¢\u0006\u0006\b½\u0001\u0010¾\u0001J\u0015\u0010¿\u0001\u001a\u0005\u0018\u00010\u0088\u00012\u0007\u0010À\u0001\u001a\u00020(H\u0002JD\u0010Á\u0001\u001a\u00020\f2\b\u0010Â\u0001\u001a\u00030Ã\u00012\b\u0010¤\u0001\u001a\u00030\u009b\u00012\b\u0010Ä\u0001\u001a\u00030Å\u00012\b\u0010Æ\u0001\u001a\u00030Ç\u00012\u0007\u0010È\u0001\u001a\u00020(ø\u0001\u0000¢\u0006\u0006\bÉ\u0001\u0010Ê\u0001JF\u0010Ë\u0001\u001a\u00020\f2\b\u0010Â\u0001\u001a\u00030Ã\u00012\b\u0010¤\u0001\u001a\u00030\u009b\u00012\b\u0010Ä\u0001\u001a\u00030Å\u00012\b\u0010Æ\u0001\u001a\u00030Ç\u00012\u0007\u0010È\u0001\u001a\u00020(H\u0016ø\u0001\u0000¢\u0006\u0006\bÌ\u0001\u0010Ê\u0001J\t\u0010Í\u0001\u001a\u00020\fH\u0016J\u001f\u0010Î\u0001\u001a\u00020(2\b\u0010¤\u0001\u001a\u00030\u009b\u0001H\u0004ø\u0001\u0000¢\u0006\u0006\bÏ\u0001\u0010Ð\u0001J\u0007\u0010Ñ\u0001\u001a\u00020(J\u001c\u0010Ò\u0001\u001a\u00030Ó\u00012\u0007\u0010Ô\u0001\u001a\u00020\u00032\u0007\u0010\u009a\u0001\u001a\u00020(H\u0016J)\u0010Õ\u0001\u001a\u00030\u009b\u00012\u0007\u0010Ô\u0001\u001a\u00020\u00032\b\u0010Ö\u0001\u001a\u00030\u009b\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\b×\u0001\u0010Ø\u0001J2\u0010Õ\u0001\u001a\u00030\u009b\u00012\u0007\u0010Ô\u0001\u001a\u00020\u00032\b\u0010Ö\u0001\u001a\u00030\u009b\u00012\u0007\u0010\u009d\u0001\u001a\u00020(H\u0016ø\u0001\u0000¢\u0006\u0006\bÙ\u0001\u0010Ú\u0001J \u0010Û\u0001\u001a\u00030\u009b\u00012\b\u0010Ü\u0001\u001a\u00030\u009b\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\bÝ\u0001\u0010¢\u0001J \u0010Þ\u0001\u001a\u00030\u009b\u00012\b\u0010Ü\u0001\u001a\u00030\u009b\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\bß\u0001\u0010¢\u0001J \u0010à\u0001\u001a\u00030\u009b\u00012\b\u0010Ü\u0001\u001a\u00030\u009b\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\bá\u0001\u0010¢\u0001J \u0010â\u0001\u001a\u00030\u009b\u00012\b\u0010¤\u0001\u001a\u00030\u009b\u0001H\u0002ø\u0001\u0000¢\u0006\u0006\bã\u0001\u0010¢\u0001J\u0007\u0010ä\u0001\u001a\u00020\fJ\u000f\u0010å\u0001\u001a\u00020\fH\u0000¢\u0006\u0003\bæ\u0001J\u0007\u0010ç\u0001\u001a\u00020\fJ\t\u0010è\u0001\u001a\u00020\fH\u0016J\u0007\u0010é\u0001\u001a\u00020\fJ\u001d\u0010ê\u0001\u001a\u00020\f2\b\u0010ë\u0001\u001a\u00030ì\u00012\b\u0010í\u0001\u001a\u00030ì\u0001H\u0014J\u0007\u0010î\u0001\u001a\u00020\fJ\u0007\u0010ï\u0001\u001a\u00020\fJ\u0007\u0010ð\u0001\u001a\u00020\fJ\u0007\u0010ñ\u0001\u001a\u00020\fJ\u001d\u0010ò\u0001\u001a\u00020\f2\u0007\u0010¨\u0001\u001a\u00020\n2\t\u0010©\u0001\u001a\u0004\u0018\u00010\u000bH\u0016J2\u0010ó\u0001\u001a\u00030ô\u00012\u0007\u0010õ\u0001\u001a\u00020>2\u0010\b\u0004\u0010ö\u0001\u001a\t\u0012\u0005\u0012\u00030ô\u000105H\u0084\bø\u0001\u0000¢\u0006\u0006\b÷\u0001\u0010ø\u0001JA\u0010ù\u0001\u001a\u00020\f2\u0006\u0010s\u001a\u00020r2\u0007\u0010\u0093\u0001\u001a\u00020\u001c2\u0019\u0010H\u001a\u0015\u0012\u0004\u0012\u00020F\u0012\u0004\u0012\u00020\f\u0018\u00010E¢\u0006\u0002\bGH\u0014ø\u0001\u0000¢\u0006\u0006\bú\u0001\u0010û\u0001J.\u0010ù\u0001\u001a\u00020\f2\u0006\u0010s\u001a\u00020r2\u0007\u0010\u0093\u0001\u001a\u00020\u001c2\u0006\u0010B\u001a\u00020\u000bH\u0014ø\u0001\u0000¢\u0006\u0006\bú\u0001\u0010ü\u0001JK\u0010ý\u0001\u001a\u00020\f2\u0006\u0010s\u001a\u00020r2\u0007\u0010\u0093\u0001\u001a\u00020\u001c2\u0019\u0010H\u001a\u0015\u0012\u0004\u0012\u00020F\u0012\u0004\u0012\u00020\f\u0018\u00010E¢\u0006\u0002\bG2\b\u0010$\u001a\u0004\u0018\u00010\u000bH\u0002ø\u0001\u0000¢\u0006\u0006\bþ\u0001\u0010ÿ\u0001JI\u0010\u0080\u0002\u001a\u00020\f2\u0006\u0010s\u001a\u00020r2\u0007\u0010\u0093\u0001\u001a\u00020\u001c2\u0019\u0010H\u001a\u0015\u0012\u0004\u0012\u00020F\u0012\u0004\u0012\u00020\f\u0018\u00010E¢\u0006\u0002\bG2\b\u0010B\u001a\u0004\u0018\u00010\u000bø\u0001\u0000¢\u0006\u0006\b\u0081\u0002\u0010ÿ\u0001J,\u0010\u0082\u0002\u001a\u00020\f2\u0007\u0010¶\u0001\u001a\u00020\u00102\u0007\u0010\u009a\u0001\u001a\u00020(2\t\b\u0002\u0010\u0083\u0002\u001a\u00020(H\u0000¢\u0006\u0003\b\u0084\u0002J\u0007\u0010\u0085\u0002\u001a\u00020\fJ\u000f\u0010\u0086\u0002\u001a\u00020\fH\u0010¢\u0006\u0003\b\u0087\u0002J \u0010\u0088\u0002\u001a\u00030\u009b\u00012\b\u0010\u0089\u0002\u001a\u00030\u009b\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\b\u008a\u0002\u0010¢\u0001J\u0007\u0010\u008b\u0002\u001a\u00020(J*\u0010\u008c\u0002\u001a\u00030\u009b\u00012\u0007\u0010s\u001a\u00030\u009b\u00012\t\b\u0002\u0010\u009d\u0001\u001a\u00020(H\u0016ø\u0001\u0000¢\u0006\u0006\b\u008d\u0002\u0010´\u0001J\b\u0010\u008e\u0002\u001a\u00030Ó\u0001J(\u0010\u008f\u0002\u001a\u00020\f2\u0007\u0010Ô\u0001\u001a\u00020\u00032\b\u0010\u0090\u0002\u001a\u00030\u0091\u0002H\u0016ø\u0001\u0000¢\u0006\u0006\b\u0092\u0002\u0010\u0093\u0002J(\u0010\u0094\u0002\u001a\u00020\f2\u0007\u0010\u0098\u0001\u001a\u00020\u00002\b\u0010\u0090\u0002\u001a\u00030\u0091\u0002H\u0002ø\u0001\u0000¢\u0006\u0006\b\u0095\u0002\u0010\u0096\u0002J(\u0010\u0097\u0002\u001a\u00020\f2\u0007\u0010\u0098\u0001\u001a\u00020\u00002\b\u0010\u0090\u0002\u001a\u00030\u0091\u0002H\u0002ø\u0001\u0000¢\u0006\u0006\b\u0098\u0002\u0010\u0096\u0002J\u001f\u0010\u0099\u0002\u001a\u00020\f2\b\u0010\u0090\u0002\u001a\u00030\u0091\u0002H\u0016ø\u0001\u0000¢\u0006\u0006\b\u009a\u0002\u0010\u009b\u0002J-\u0010\u009c\u0002\u001a\u00020\f2\u0019\u0010H\u001a\u0015\u0012\u0004\u0012\u00020F\u0012\u0004\u0012\u00020\f\u0018\u00010E¢\u0006\u0002\bG2\t\b\u0002\u0010\u009d\u0002\u001a\u00020(J\u0014\u0010\u009e\u0002\u001a\u00020(2\t\b\u0002\u0010\u009f\u0002\u001a\u00020(H\u0002JF\u0010 \u0002\u001a\u00020\f\"\u0007\b\u0000\u0010¡\u0002\u0018\u00012\u000f\u0010¸\u0001\u001a\n\u0012\u0005\u0012\u0003H¡\u00020¹\u00012\u0014\u0010ö\u0001\u001a\u000f\u0012\u0005\u0012\u0003H¡\u0002\u0012\u0004\u0012\u00020\f0EH\u0086\bø\u0001\u0000¢\u0006\u0006\b¢\u0002\u0010£\u0002J3\u0010 \u0002\u001a\u00020\f2\b\u0010¤\u0002\u001a\u00030ì\u00012\u0007\u0010À\u0001\u001a\u00020(2\u0014\u0010ö\u0001\u001a\u000f\u0012\u0005\u0012\u00030\u0088\u0001\u0012\u0004\u0012\u00020\f0EH\u0086\bJ \u0010¥\u0002\u001a\u00030\u009b\u00012\b\u0010¦\u0002\u001a\u00030\u009b\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\b§\u0002\u0010¢\u0001J(\u0010¨\u0002\u001a\u00020\f2\u0007\u0010¨\u0001\u001a\u00020\n2\u0013\u0010ö\u0001\u001a\u000e\u0012\u0004\u0012\u00020\n\u0012\u0004\u0012\u00020\f0EH\u0084\bJ\u001f\u0010©\u0002\u001a\u00020(2\b\u0010¤\u0001\u001a\u00030\u009b\u0001H\u0004ø\u0001\u0000¢\u0006\u0006\bª\u0002\u0010Ð\u0001JM\u0010«\u0002\u001a\u00020\f*\u0005\u0018\u00010\u0088\u00012\b\u0010Â\u0001\u001a\u00030Ã\u00012\b\u0010¤\u0001\u001a\u00030\u009b\u00012\b\u0010Ä\u0001\u001a\u00030Å\u00012\b\u0010Æ\u0001\u001a\u00030Ç\u00012\u0007\u0010È\u0001\u001a\u00020(H\u0002ø\u0001\u0000¢\u0006\u0006\b¬\u0002\u0010\u00ad\u0002JV\u0010®\u0002\u001a\u00020\f*\u0005\u0018\u00010\u0088\u00012\b\u0010Â\u0001\u001a\u00030Ã\u00012\b\u0010¤\u0001\u001a\u00030\u009b\u00012\b\u0010Ä\u0001\u001a\u00030Å\u00012\b\u0010Æ\u0001\u001a\u00030Ç\u00012\u0007\u0010È\u0001\u001a\u00020(2\u0007\u0010¯\u0002\u001a\u00020\u001cH\u0002ø\u0001\u0000¢\u0006\u0006\b°\u0002\u0010±\u0002J0\u0010²\u0002\u001a\u00020(*\u0005\u0018\u00010\u0088\u00012\b\u0010¤\u0001\u001a\u00030\u009b\u00012\b\u0010Æ\u0001\u001a\u00030Ç\u0001H\u0002ø\u0001\u0000¢\u0006\u0006\b³\u0002\u0010´\u0002J_\u0010µ\u0002\u001a\u00020\f*\u0005\u0018\u00010\u0088\u00012\b\u0010Â\u0001\u001a\u00030Ã\u00012\b\u0010¤\u0001\u001a\u00030\u009b\u00012\b\u0010Ä\u0001\u001a\u00030Å\u00012\b\u0010Æ\u0001\u001a\u00030Ç\u00012\u0007\u0010È\u0001\u001a\u00020(2\u0007\u0010¯\u0002\u001a\u00020\u001c2\u0007\u0010¶\u0002\u001a\u00020(H\u0002ø\u0001\u0000¢\u0006\u0006\b·\u0002\u0010¸\u0002JV\u0010¹\u0002\u001a\u00020\f*\u0005\u0018\u00010\u0088\u00012\b\u0010Â\u0001\u001a\u00030Ã\u00012\b\u0010¤\u0001\u001a\u00030\u009b\u00012\b\u0010Ä\u0001\u001a\u00030Å\u00012\b\u0010Æ\u0001\u001a\u00030Ç\u00012\u0007\u0010È\u0001\u001a\u00020(2\u0007\u0010¯\u0002\u001a\u00020\u001cH\u0002ø\u0001\u0000¢\u0006\u0006\bº\u0002\u0010±\u0002J\r\u0010»\u0002\u001a\u00020\u0000*\u00020\u0003H\u0002R$\u0010\b\u001a\u0018\u0012\u0004\u0012\u00020\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b\u0012\u0004\u0012\u00020\f\u0018\u00010\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0011\u001a\u00020\u00128VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0013\u0010\u0014R\u0016\u0010\u0015\u001a\u0004\u0018\u00010\u00018VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0016\u0010\u0017R\u0014\u0010\u0018\u001a\u00020\u00038VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u0019\u0010\u001aR\u0014\u0010\u001b\u001a\u00020\u001c8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b\u001d\u0010\u001eR(\u0010\u001f\u001a\u0016\u0012\u0004\u0012\u00020\n\u0012\u0006\u0012\u0004\u0018\u00010\u000b\u0012\u0004\u0012\u00020\f0\t8BX\u0082\u0004¢\u0006\u0006\u001a\u0004\b \u0010!R\u0010\u0010\"\u001a\u0004\u0018\u00010\nX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010#\u001a\u0004\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010$\u001a\u0004\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010%\u001a\u00020\u001c8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b&\u0010\u001eR\u001a\u0010'\u001a\u00020(X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b)\u0010*\"\u0004\b+\u0010,R\u001a\u0010-\u001a\u00020(X\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b.\u0010*\"\u0004\b/\u0010,R\u0014\u00100\u001a\u00020(8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b1\u0010*R\u0014\u00102\u001a\u00020(8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b3\u0010*R\u0014\u00104\u001a\b\u0012\u0004\u0012\u00020\f05X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u00106\u001a\u00020(8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b6\u0010*R\u000e\u00107\u001a\u00020(X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u00108\u001a\u00020(8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b8\u0010*R\u000e\u00109\u001a\u00020\u001cX\u0082\u000e¢\u0006\u0002\n\u0000R\u001e\u0010;\u001a\u00020(2\u0006\u0010:\u001a\u00020(@BX\u0080\u000e¢\u0006\b\n\u0000\u001a\u0004\b<\u0010*R\u001a\u0010=\u001a\u00020>8@X\u0080\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\b?\u0010@R\"\u0010B\u001a\u0004\u0018\u00010A2\b\u0010:\u001a\u0004\u0018\u00010A@BX\u0086\u000e¢\u0006\b\n\u0000\u001a\u0004\bC\u0010DRD\u0010H\u001a\u0015\u0012\u0004\u0012\u00020F\u0012\u0004\u0012\u00020\f\u0018\u00010E¢\u0006\u0002\bG2\u0019\u0010:\u001a\u0015\u0012\u0004\u0012\u00020F\u0012\u0004\u0012\u00020\f\u0018\u00010E¢\u0006\u0002\bG@BX\u0084\u000e¢\u0006\b\n\u0000\u001a\u0004\bI\u0010JR\u000e\u0010K\u001a\u00020LX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010M\u001a\u00020NX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010O\u001a\u0004\u0018\u00010PX\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010Q\u001a\u00020N8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bR\u0010SR\u0014\u0010\u0005\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\bT\u0010UR&\u0010W\u001a\u0004\u0018\u00010V2\b\u0010:\u001a\u0004\u0018\u00010V@dX¦\u000e¢\u0006\f\u001a\u0004\bX\u0010Y\"\u0004\bZ\u0010[R$\u0010]\u001a\u00020\u000e2\u0006\u0010\\\u001a\u00020\u000e8P@PX\u0090\u000e¢\u0006\f\u001a\u0004\b^\u0010_\"\u0004\b`\u0010aR\u0017\u0010b\u001a\u00020c8Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0006\u001a\u0004\bd\u0010@R\u0016\u0010e\u001a\n\u0012\u0004\u0012\u00020g\u0018\u00010fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010h\u001a\u0004\u0018\u00010\u00018VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bi\u0010\u0017R\u0013\u0010j\u001a\u0004\u0018\u00010\u00038F¢\u0006\u0006\u001a\u0004\bk\u0010\u001aR\u0016\u0010l\u001a\u0004\u0018\u00010m8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bn\u0010oR\u0013\u0010p\u001a\u0004\u0018\u00010\u00038F¢\u0006\u0006\u001a\u0004\bq\u0010\u001aR,\u0010s\u001a\u00020r2\u0006\u0010:\u001a\u00020r@TX\u0096\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0010\n\u0002\u0010w\u001a\u0004\bt\u0010@\"\u0004\bu\u0010vR\u001a\u0010x\u001a\b\u0012\u0004\u0012\u00020g0y8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\bz\u0010{R\u0014\u0010|\u001a\u00020\u00108DX\u0084\u0004¢\u0006\u0006\u001a\u0004\b}\u0010~R\u000e\u0010\u007f\u001a\u00020(X\u0082\u000e¢\u0006\u0002\n\u0000R\u001a\u0010\u0080\u0001\u001a\u00030\u0081\u00018Fø\u0001\u0000ø\u0001\u0001¢\u0006\u0007\u001a\u0005\b\u0082\u0001\u0010@R\u0018\u0010\u0083\u0001\u001a\u00030\u0084\u00018BX\u0082\u0004¢\u0006\b\u001a\u0006\b\u0085\u0001\u0010\u0086\u0001R\u0016\u0010\u0087\u0001\u001a\u00030\u0088\u0001X¦\u0004¢\u0006\b\u001a\u0006\b\u0089\u0001\u0010\u008a\u0001R!\u0010\u008b\u0001\u001a\u0004\u0018\u00010\u0000X\u0080\u000e¢\u0006\u0012\n\u0000\u001a\u0006\b\u008c\u0001\u0010\u008d\u0001\"\u0006\b\u008e\u0001\u0010\u008f\u0001R!\u0010\u0090\u0001\u001a\u0004\u0018\u00010\u0000X\u0080\u000e¢\u0006\u0012\n\u0000\u001a\u0006\b\u0091\u0001\u0010\u008d\u0001\"\u0006\b\u0092\u0001\u0010\u008f\u0001R(\u0010\u0093\u0001\u001a\u00020\u001c2\u0006\u0010:\u001a\u00020\u001c@DX\u0086\u000e¢\u0006\u0011\n\u0000\u001a\u0005\b\u0094\u0001\u0010\u001e\"\u0006\b\u0095\u0001\u0010\u0096\u0001\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006¾\u0002"}, d2 = {"Landroidx/compose/ui/node/NodeCoordinator;", "Landroidx/compose/ui/node/LookaheadCapablePlaceable;", "Landroidx/compose/ui/layout/Measurable;", "Landroidx/compose/ui/layout/LayoutCoordinates;", "Landroidx/compose/ui/node/OwnerScope;", "layoutNode", "Landroidx/compose/ui/node/LayoutNode;", "(Landroidx/compose/ui/node/LayoutNode;)V", "_drawBlock", "Lkotlin/Function2;", "Landroidx/compose/ui/graphics/Canvas;", "Landroidx/compose/ui/graphics/layer/GraphicsLayer;", "", "_measureResult", "Landroidx/compose/ui/layout/MeasureResult;", "_rectCache", "Landroidx/compose/ui/geometry/MutableRect;", "alignmentLinesOwner", "Landroidx/compose/ui/node/AlignmentLinesOwner;", "getAlignmentLinesOwner", "()Landroidx/compose/ui/node/AlignmentLinesOwner;", "child", "getChild", "()Landroidx/compose/ui/node/LookaheadCapablePlaceable;", "coordinates", "getCoordinates", "()Landroidx/compose/ui/layout/LayoutCoordinates;", "density", "", "getDensity", "()F", "drawBlock", "getDrawBlock", "()Lkotlin/jvm/functions/Function2;", "drawBlockCanvas", "drawBlockParentLayer", "explicitLayer", "fontScale", "getFontScale", "forceMeasureWithLookaheadConstraints", "", "getForceMeasureWithLookaheadConstraints$ui_release", "()Z", "setForceMeasureWithLookaheadConstraints$ui_release", "(Z)V", "forcePlaceWithLookaheadOffset", "getForcePlaceWithLookaheadOffset$ui_release", "setForcePlaceWithLookaheadOffset$ui_release", "hasMeasureResult", "getHasMeasureResult", "introducesMotionFrameOfReference", "getIntroducesMotionFrameOfReference", "invalidateParentLayer", "Lkotlin/Function0;", "isAttached", "isClipping", "isValidOwnerScope", "lastLayerAlpha", "<set-?>", "lastLayerDrawingWasSkipped", "getLastLayerDrawingWasSkipped$ui_release", "lastMeasurementConstraints", "Landroidx/compose/ui/unit/Constraints;", "getLastMeasurementConstraints-msEJaDk$ui_release", "()J", "Landroidx/compose/ui/node/OwnedLayer;", "layer", "getLayer", "()Landroidx/compose/ui/node/OwnedLayer;", "Lkotlin/Function1;", "Landroidx/compose/ui/graphics/GraphicsLayerScope;", "Lkotlin/ExtensionFunctionType;", "layerBlock", "getLayerBlock", "()Lkotlin/jvm/functions/Function1;", "layerDensity", "Landroidx/compose/ui/unit/Density;", "layerLayoutDirection", "Landroidx/compose/ui/unit/LayoutDirection;", "layerPositionalProperties", "Landroidx/compose/ui/node/LayerPositionalProperties;", "layoutDirection", "getLayoutDirection", "()Landroidx/compose/ui/unit/LayoutDirection;", "getLayoutNode", "()Landroidx/compose/ui/node/LayoutNode;", "Landroidx/compose/ui/node/LookaheadDelegate;", "lookaheadDelegate", "getLookaheadDelegate", "()Landroidx/compose/ui/node/LookaheadDelegate;", "setLookaheadDelegate", "(Landroidx/compose/ui/node/LookaheadDelegate;)V", "value", "measureResult", "getMeasureResult$ui_release", "()Landroidx/compose/ui/layout/MeasureResult;", "setMeasureResult$ui_release", "(Landroidx/compose/ui/layout/MeasureResult;)V", "minimumTouchTargetSize", "Landroidx/compose/ui/geometry/Size;", "getMinimumTouchTargetSize-NH-jbRc", "oldAlignmentLines", "Landroidx/collection/MutableObjectIntMap;", "Landroidx/compose/ui/layout/AlignmentLine;", "parent", "getParent", "parentCoordinates", "getParentCoordinates", "parentData", "", "getParentData", "()Ljava/lang/Object;", "parentLayoutCoordinates", "getParentLayoutCoordinates", "Landroidx/compose/ui/unit/IntOffset;", "position", "getPosition-nOcc-ac", "setPosition--gyyYBs", "(J)V", "J", "providedAlignmentLines", "", "getProvidedAlignmentLines", "()Ljava/util/Set;", "rectCache", "getRectCache", "()Landroidx/compose/ui/geometry/MutableRect;", "released", "size", "Landroidx/compose/ui/unit/IntSize;", "getSize-YbymL2g", "snapshotObserver", "Landroidx/compose/ui/node/OwnerSnapshotObserver;", "getSnapshotObserver", "()Landroidx/compose/ui/node/OwnerSnapshotObserver;", "tail", "Landroidx/compose/ui/Modifier$Node;", "getTail", "()Landroidx/compose/ui/Modifier$Node;", "wrapped", "getWrapped$ui_release", "()Landroidx/compose/ui/node/NodeCoordinator;", "setWrapped$ui_release", "(Landroidx/compose/ui/node/NodeCoordinator;)V", "wrappedBy", "getWrappedBy$ui_release", "setWrappedBy$ui_release", "zIndex", "getZIndex", "setZIndex", "(F)V", "ancestorToLocal", "ancestor", "rect", "clipBounds", "Landroidx/compose/ui/geometry/Offset;", TypedValues.CycleType.S_WAVE_OFFSET, "includeMotionFrameOfReference", "ancestorToLocal-S_NoaFU", "(Landroidx/compose/ui/node/NodeCoordinator;JZ)J", "calculateMinimumTouchTargetPadding", "calculateMinimumTouchTargetPadding-E7KxVPU", "(J)J", "distanceInMinimumTouchTarget", "pointerPosition", "distanceInMinimumTouchTarget-tz77jQw", "(JJ)F", "draw", "canvas", "graphicsLayer", "drawBorder", "paint", "Landroidx/compose/ui/graphics/Paint;", "drawContainedDrawModifiers", "ensureLookaheadDelegateCreated", "findCommonAncestor", "other", "findCommonAncestor$ui_release", "fromParentPosition", "fromParentPosition-8S9VItk", "(JZ)J", "fromParentRect", "bounds", "hasNode", PdfConst.Type, "Landroidx/compose/ui/node/NodeKind;", "hasNode-H91voCI", "(I)Z", "head", "head-H91voCI", "(I)Landroidx/compose/ui/Modifier$Node;", "headNode", "includeTail", "hitTest", "hitTestSource", "Landroidx/compose/ui/node/NodeCoordinator$HitTestSource;", "hitTestResult", "Landroidx/compose/ui/node/HitTestResult;", "pointerType", "Landroidx/compose/ui/input/pointer/PointerType;", "isInLayer", "hitTest-qzLsGqo", "(Landroidx/compose/ui/node/NodeCoordinator$HitTestSource;JLandroidx/compose/ui/node/HitTestResult;IZ)V", "hitTestChild", "hitTestChild-qzLsGqo", "invalidateLayer", "isPointerInBounds", "isPointerInBounds-k-4lQ0M", "(J)Z", "isTransparent", "localBoundingBoxOf", "Landroidx/compose/ui/geometry/Rect;", "sourceCoordinates", "localPositionOf", "relativeToSource", "localPositionOf-R5De75A", "(Landroidx/compose/ui/layout/LayoutCoordinates;J)J", "localPositionOf-S_NoaFU", "(Landroidx/compose/ui/layout/LayoutCoordinates;JZ)J", "localToRoot", "relativeToLocal", "localToRoot-MK-Hz9U", "localToScreen", "localToScreen-MK-Hz9U", "localToWindow", "localToWindow-MK-Hz9U", "offsetFromEdge", "offsetFromEdge-MK-Hz9U", "onAttach", "onCoordinatesUsed", "onCoordinatesUsed$ui_release", "onDetach", "onLayoutModifierNodeChanged", "onLayoutNodeAttach", "onMeasureResultChanged", "width", "", "height", "onMeasured", "onPlaced", "onRelease", "onUnplaced", "performDraw", "performingMeasure", "Landroidx/compose/ui/layout/Placeable;", "constraints", "block", "performingMeasure-K40F9xA", "(JLkotlin/jvm/functions/Function0;)Landroidx/compose/ui/layout/Placeable;", "placeAt", "placeAt-f8xVGno", "(JFLkotlin/jvm/functions/Function1;)V", "(JFLandroidx/compose/ui/graphics/layer/GraphicsLayer;)V", "placeSelf", "placeSelf-MLgxB_4", "(JFLkotlin/jvm/functions/Function1;Landroidx/compose/ui/graphics/layer/GraphicsLayer;)V", "placeSelfApparentToRealOffset", "placeSelfApparentToRealOffset-MLgxB_4", "rectInParent", "clipToMinimumTouchTargetSize", "rectInParent$ui_release", "releaseLayer", "replace", "replace$ui_release", "screenToLocal", "relativeToScreen", "screenToLocal-MK-Hz9U", "shouldSharePointerInputWithSiblings", "toParentPosition", "toParentPosition-8S9VItk", "touchBoundsInRoot", "transformFrom", "matrix", "Landroidx/compose/ui/graphics/Matrix;", "transformFrom-EL8BTi8", "(Landroidx/compose/ui/layout/LayoutCoordinates;[F)V", "transformFromAncestor", "transformFromAncestor-EL8BTi8", "(Landroidx/compose/ui/node/NodeCoordinator;[F)V", "transformToAncestor", "transformToAncestor-EL8BTi8", "transformToScreen", "transformToScreen-58bKbWc", "([F)V", "updateLayerBlock", "forceUpdateLayerParameters", "updateLayerParameters", "invokeOnLayoutChange", "visitNodes", ExifInterface.GPS_DIRECTION_TRUE, "visitNodes-aLcG6gQ", "(ILkotlin/jvm/functions/Function1;)V", "mask", "windowToLocal", "relativeToWindow", "windowToLocal-MK-Hz9U", "withPositionTranslation", "withinLayerBounds", "withinLayerBounds-k-4lQ0M", "hit", "hit-5ShdDok", "(Landroidx/compose/ui/Modifier$Node;Landroidx/compose/ui/node/NodeCoordinator$HitTestSource;JLandroidx/compose/ui/node/HitTestResult;IZ)V", "hitNear", "distanceFromEdge", "hitNear-Fh5PU_I", "(Landroidx/compose/ui/Modifier$Node;Landroidx/compose/ui/node/NodeCoordinator$HitTestSource;JLandroidx/compose/ui/node/HitTestResult;IZF)V", "isInExpandedTouchBounds", "isInExpandedTouchBounds-ThD-n1k", "(Landroidx/compose/ui/Modifier$Node;JI)Z", "outOfBoundsHit", "isHitInMinimumTouchTargetBetter", "outOfBoundsHit-8NAm7pk", "(Landroidx/compose/ui/Modifier$Node;Landroidx/compose/ui/node/NodeCoordinator$HitTestSource;JLandroidx/compose/ui/node/HitTestResult;IZFZ)V", "speculativeHit", "speculativeHit-Fh5PU_I", "toCoordinator", "Companion", "HitTestSource", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public abstract class NodeCoordinator extends LookaheadCapablePlaceable implements Measurable, LayoutCoordinates, OwnerScope {
    public static final int $stable = 0;
    public static final String ExpectAttachedLayoutCoordinates = "LayoutCoordinate operations are only valid when isAttached is true";
    public static final String UnmeasuredError = "Asking for measurement result of unmeasured layout modifier";
    private Function2<? super Canvas, ? super GraphicsLayer, Unit> _drawBlock;
    private MeasureResult _measureResult;
    private MutableRect _rectCache;
    private Canvas drawBlockCanvas;
    private GraphicsLayer drawBlockParentLayer;
    private GraphicsLayer explicitLayer;
    private boolean forceMeasureWithLookaheadConstraints;
    private boolean forcePlaceWithLookaheadOffset;
    private boolean isClipping;
    private boolean lastLayerDrawingWasSkipped;
    private OwnedLayer layer;
    private Function1<? super GraphicsLayerScope, Unit> layerBlock;
    private LayerPositionalProperties layerPositionalProperties;
    private final LayoutNode layoutNode;
    private MutableObjectIntMap<AlignmentLine> oldAlignmentLines;
    private boolean released;
    private NodeCoordinator wrapped;
    private NodeCoordinator wrappedBy;
    private float zIndex;
    public static final Companion Companion = new Companion(null);
    private static final Function1<NodeCoordinator, Unit> onCommitAffectingLayerParams = new Function1<NodeCoordinator, Unit>() { // from class: androidx.compose.ui.node.NodeCoordinator$Companion$onCommitAffectingLayerParams$1
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Unit invoke(NodeCoordinator nodeCoordinator) {
            invoke2(nodeCoordinator);
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(NodeCoordinator coordinator) {
            if (coordinator.isValidOwnerScope()) {
                boolean positionalPropertiesChanged = NodeCoordinator.updateLayerParameters$default(coordinator, false, 1, null);
                if (positionalPropertiesChanged) {
                    LayoutNode layoutNode = coordinator.getLayoutNode();
                    LayoutNodeLayoutDelegate layoutDelegate = layoutNode.getLayoutDelegate$ui_release();
                    if (layoutDelegate.getChildrenAccessingCoordinatesDuringPlacement() > 0) {
                        if (layoutDelegate.getCoordinatesAccessedDuringModifierPlacement() || layoutDelegate.getCoordinatesAccessedDuringPlacement()) {
                            LayoutNode.requestRelayout$ui_release$default(layoutNode, false, 1, null);
                        }
                        layoutDelegate.getMeasurePassDelegate$ui_release().notifyChildrenUsingCoordinatesWhilePlacing();
                    }
                    Owner owner = LayoutNodeKt.requireOwner(layoutNode);
                    owner.getRectManager().onLayoutLayerPositionalPropertiesChanged(layoutNode);
                    owner.requestOnPositionedCallback(layoutNode);
                }
            }
        }
    };
    private static final Function1<NodeCoordinator, Unit> onCommitAffectingLayer = new Function1<NodeCoordinator, Unit>() { // from class: androidx.compose.ui.node.NodeCoordinator$Companion$onCommitAffectingLayer$1
        @Override // kotlin.jvm.functions.Function1
        public /* bridge */ /* synthetic */ Unit invoke(NodeCoordinator nodeCoordinator) {
            invoke2(nodeCoordinator);
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2(NodeCoordinator coordinator) {
            OwnedLayer layer = coordinator.getLayer();
            if (layer != null) {
                layer.invalidate();
            }
        }
    };
    private static final ReusableGraphicsLayerScope graphicsLayerScope = new ReusableGraphicsLayerScope();
    private static final LayerPositionalProperties tmpLayerPositionalProperties = new LayerPositionalProperties();
    private static final float[] tmpMatrix = Matrix.m4519constructorimpl$default(null, 1, null);
    private static final HitTestSource PointerInputSource = new HitTestSource() { // from class: androidx.compose.ui.node.NodeCoordinator$Companion$PointerInputSource$1
        @Override // androidx.compose.ui.node.NodeCoordinator.HitTestSource
        /* renamed from: entityType-OLwlOKw  reason: not valid java name */
        public int mo5894entityTypeOLwlOKw() {
            return NodeKind.m5898constructorimpl(16);
        }

        @Override // androidx.compose.ui.node.NodeCoordinator.HitTestSource
        public boolean interceptOutOfBoundsChildEvents(Modifier.Node node) {
            int kind$iv;
            int kind$iv2;
            MutableVector mutableVector;
            int kind$iv3 = NodeKind.m5898constructorimpl(16);
            MutableVector mutableVector2 = null;
            Modifier.Node node2 = node;
            while (node2 != null) {
                int i = 1;
                if (node2 instanceof PointerInputModifierNode) {
                    PointerInputModifierNode it = (PointerInputModifierNode) node2;
                    if (it.interceptOutOfBoundsChildEvents()) {
                        return true;
                    }
                    kind$iv = kind$iv3;
                } else {
                    Modifier.Node this_$iv$iv = node2;
                    Modifier.Node this_$iv$iv2 = (this_$iv$iv.getKindSet$ui_release() & kind$iv3) != 0 ? 1 : null;
                    if (this_$iv$iv2 == null || !(node2 instanceof DelegatingNode)) {
                        kind$iv = kind$iv3;
                    } else {
                        int count$iv = 0;
                        DelegatingNode this_$iv$iv3 = (DelegatingNode) node2;
                        Modifier.Node node$iv$iv = this_$iv$iv3.getDelegate$ui_release();
                        while (node$iv$iv != null) {
                            Modifier.Node next$iv = node$iv$iv;
                            if (((next$iv.getKindSet$ui_release() & kind$iv3) != 0 ? i : 0) == 0) {
                                kind$iv2 = kind$iv3;
                            } else {
                                count$iv++;
                                if (count$iv == i) {
                                    node2 = next$iv;
                                    kind$iv2 = kind$iv3;
                                } else {
                                    if (mutableVector2 != null) {
                                        kind$iv2 = kind$iv3;
                                        mutableVector = mutableVector2;
                                    } else {
                                        kind$iv2 = kind$iv3;
                                        mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                    }
                                    mutableVector2 = mutableVector;
                                    Modifier.Node theNode$iv = node2;
                                    if (theNode$iv != null) {
                                        if (mutableVector2 != null) {
                                            mutableVector2.add(theNode$iv);
                                        }
                                        node2 = null;
                                    }
                                    if (mutableVector2 != null) {
                                        mutableVector2.add(next$iv);
                                    }
                                }
                            }
                            node$iv$iv = node$iv$iv.getChild$ui_release();
                            kind$iv3 = kind$iv2;
                            i = 1;
                        }
                        kind$iv = kind$iv3;
                        if (count$iv == 1) {
                            kind$iv3 = kind$iv;
                        }
                    }
                }
                node2 = DelegatableNodeKt.pop(mutableVector2);
                kind$iv3 = kind$iv;
            }
            return false;
        }

        @Override // androidx.compose.ui.node.NodeCoordinator.HitTestSource
        public boolean shouldHitTestChildren(LayoutNode parentLayoutNode) {
            return true;
        }

        @Override // androidx.compose.ui.node.NodeCoordinator.HitTestSource
        /* renamed from: childHitTest-qzLsGqo  reason: not valid java name */
        public void mo5893childHitTestqzLsGqo(LayoutNode layoutNode, long pointerPosition, HitTestResult hitTestResult, int pointerType, boolean isInLayer) {
            layoutNode.m5814hitTest6fMxITs$ui_release(pointerPosition, hitTestResult, pointerType, isInLayer);
        }
    };
    private static final HitTestSource SemanticsSource = new HitTestSource() { // from class: androidx.compose.ui.node.NodeCoordinator$Companion$SemanticsSource$1
        @Override // androidx.compose.ui.node.NodeCoordinator.HitTestSource
        /* renamed from: entityType-OLwlOKw */
        public int mo5894entityTypeOLwlOKw() {
            return NodeKind.m5898constructorimpl(8);
        }

        @Override // androidx.compose.ui.node.NodeCoordinator.HitTestSource
        public boolean interceptOutOfBoundsChildEvents(Modifier.Node node) {
            return false;
        }

        @Override // androidx.compose.ui.node.NodeCoordinator.HitTestSource
        public boolean shouldHitTestChildren(LayoutNode parentLayoutNode) {
            SemanticsConfiguration semanticsConfiguration = parentLayoutNode.getSemanticsConfiguration();
            boolean z = false;
            if (semanticsConfiguration != null && semanticsConfiguration.isClearingSemantics()) {
                z = true;
            }
            return !z;
        }

        @Override // androidx.compose.ui.node.NodeCoordinator.HitTestSource
        /* renamed from: childHitTest-qzLsGqo */
        public void mo5893childHitTestqzLsGqo(LayoutNode layoutNode, long pointerPosition, HitTestResult hitTestResult, int pointerType, boolean isInLayer) {
            layoutNode.m5815hitTestSemantics6fMxITs$ui_release(pointerPosition, hitTestResult, pointerType, isInLayer);
        }
    };
    private Density layerDensity = getLayoutNode().getDensity();
    private LayoutDirection layerLayoutDirection = getLayoutNode().getLayoutDirection();
    private float lastLayerAlpha = 0.8f;
    private long position = IntOffset.Companion.m7012getZeronOccac();
    private final Function0<Unit> invalidateParentLayer = new Function0<Unit>() { // from class: androidx.compose.ui.node.NodeCoordinator$invalidateParentLayer$1
        /* JADX INFO: Access modifiers changed from: package-private */
        {
            super(0);
        }

        @Override // kotlin.jvm.functions.Function0
        public /* bridge */ /* synthetic */ Unit invoke() {
            invoke2();
            return Unit.INSTANCE;
        }

        /* renamed from: invoke  reason: avoid collision after fix types in other method */
        public final void invoke2() {
            NodeCoordinator wrappedBy$ui_release = NodeCoordinator.this.getWrappedBy$ui_release();
            if (wrappedBy$ui_release != null) {
                wrappedBy$ui_release.invalidateLayer();
            }
        }
    };

    /* compiled from: NodeCoordinator.kt */
    @Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\b`\u0018\u00002\u00020\u0001J:\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\f\u001a\u00020\rH&ø\u0001\u0000¢\u0006\u0004\b\u000e\u0010\u000fJ\u0019\u0010\u0010\u001a\u0006\u0012\u0002\b\u00030\u0011H&ø\u0001\u0001ø\u0001\u0000¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\r2\u0006\u0010\u0015\u001a\u00020\u0016H&J\u0010\u0010\u0017\u001a\u00020\r2\u0006\u0010\u0018\u001a\u00020\u0005H&ø\u0001\u0002\u0082\u0002\u0011\n\u0005\b¡\u001e0\u0001\n\u0002\b!\n\u0004\b!0\u0001¨\u0006\u0019À\u0006\u0001"}, d2 = {"Landroidx/compose/ui/node/NodeCoordinator$HitTestSource;", "", "childHitTest", "", "layoutNode", "Landroidx/compose/ui/node/LayoutNode;", "pointerPosition", "Landroidx/compose/ui/geometry/Offset;", "hitTestResult", "Landroidx/compose/ui/node/HitTestResult;", "pointerType", "Landroidx/compose/ui/input/pointer/PointerType;", "isInLayer", "", "childHitTest-qzLsGqo", "(Landroidx/compose/ui/node/LayoutNode;JLandroidx/compose/ui/node/HitTestResult;IZ)V", "entityType", "Landroidx/compose/ui/node/NodeKind;", "entityType-OLwlOKw", "()I", "interceptOutOfBoundsChildEvents", "node", "Landroidx/compose/ui/Modifier$Node;", "shouldHitTestChildren", "parentLayoutNode", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public interface HitTestSource {
        /* renamed from: childHitTest-qzLsGqo */
        void mo5893childHitTestqzLsGqo(LayoutNode layoutNode, long j, HitTestResult hitTestResult, int i, boolean z);

        /* renamed from: entityType-OLwlOKw */
        int mo5894entityTypeOLwlOKw();

        boolean interceptOutOfBoundsChildEvents(Modifier.Node node);

        boolean shouldHitTestChildren(LayoutNode layoutNode);
    }

    public abstract void ensureLookaheadDelegateCreated();

    public abstract LookaheadDelegate getLookaheadDelegate();

    public abstract Modifier.Node getTail();

    protected abstract void setLookaheadDelegate(LookaheadDelegate lookaheadDelegate);

    @Override // androidx.compose.ui.node.LookaheadCapablePlaceable, androidx.compose.ui.node.MeasureScopeWithLayoutNode
    public LayoutNode getLayoutNode() {
        return this.layoutNode;
    }

    public NodeCoordinator(LayoutNode layoutNode) {
        this.layoutNode = layoutNode;
    }

    public final boolean getForcePlaceWithLookaheadOffset$ui_release() {
        return this.forcePlaceWithLookaheadOffset;
    }

    public final void setForcePlaceWithLookaheadOffset$ui_release(boolean z) {
        this.forcePlaceWithLookaheadOffset = z;
    }

    public final boolean getForceMeasureWithLookaheadConstraints$ui_release() {
        return this.forceMeasureWithLookaheadConstraints;
    }

    public final void setForceMeasureWithLookaheadConstraints$ui_release(boolean z) {
        this.forceMeasureWithLookaheadConstraints = z;
    }

    public final NodeCoordinator getWrapped$ui_release() {
        return this.wrapped;
    }

    public final void setWrapped$ui_release(NodeCoordinator nodeCoordinator) {
        this.wrapped = nodeCoordinator;
    }

    public final NodeCoordinator getWrappedBy$ui_release() {
        return this.wrappedBy;
    }

    public final void setWrappedBy$ui_release(NodeCoordinator nodeCoordinator) {
        this.wrappedBy = nodeCoordinator;
    }

    @Override // androidx.compose.ui.layout.IntrinsicMeasureScope
    public LayoutDirection getLayoutDirection() {
        return getLayoutNode().getLayoutDirection();
    }

    @Override // androidx.compose.ui.unit.Density
    public float getDensity() {
        return getLayoutNode().getDensity().getDensity();
    }

    @Override // androidx.compose.ui.unit.FontScaling
    public float getFontScale() {
        return getLayoutNode().getDensity().getFontScale();
    }

    @Override // androidx.compose.ui.node.LookaheadCapablePlaceable
    public LookaheadCapablePlaceable getParent() {
        return this.wrappedBy;
    }

    @Override // androidx.compose.ui.node.LookaheadCapablePlaceable
    public LayoutCoordinates getCoordinates() {
        return this;
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public boolean getIntroducesMotionFrameOfReference() {
        return isPlacedUnderMotionFrameOfReference();
    }

    public final Modifier.Node headNode(boolean includeTail) {
        Modifier.Node tail;
        if (getLayoutNode().getOuterCoordinator$ui_release() == this) {
            return getLayoutNode().getNodes$ui_release().getHead$ui_release();
        }
        NodeCoordinator nodeCoordinator = this.wrappedBy;
        if (includeTail) {
            if (nodeCoordinator == null || (tail = nodeCoordinator.getTail()) == null) {
                return null;
            }
            return tail.getChild$ui_release();
        } else if (nodeCoordinator != null) {
            return nodeCoordinator.getTail();
        } else {
            return null;
        }
    }

    public final void visitNodes(int mask, boolean includeTail, Function1<? super Modifier.Node, Unit> function1) {
        Modifier.Node stopNode = getTail();
        if (!includeTail && (stopNode = stopNode.getParent$ui_release()) == null) {
            return;
        }
        for (Modifier.Node node = headNode(includeTail); node != null && (node.getAggregateChildKindSet$ui_release() & mask) != 0; node = node.getChild$ui_release()) {
            if ((node.getKindSet$ui_release() & mask) != 0) {
                function1.invoke(node);
            }
            if (node == stopNode) {
                return;
            }
        }
    }

    /* renamed from: visitNodes-aLcG6gQ */
    public final /* synthetic */ <T> void m5891visitNodesaLcG6gQ(int type, Function1<? super T, Unit> function1) {
        boolean z;
        boolean includeTail$iv;
        NodeCoordinator this_$iv;
        int mask$iv;
        boolean z2;
        boolean includeTail$iv2;
        NodeCoordinator this_$iv2;
        int mask$iv2;
        boolean includeTail$iv3;
        NodeCoordinator this_$iv3;
        int mask$iv3;
        Object obj;
        boolean z3 = false;
        boolean includeTail$iv4 = NodeKindKt.m5907getIncludeSelfInTraversalH91voCI(type);
        NodeCoordinator this_$iv4 = this;
        int mask$iv4 = type;
        Modifier.Node stopNode$iv = this_$iv4.getTail();
        if (includeTail$iv4 || (stopNode$iv = stopNode$iv.getParent$ui_release()) != null) {
            Modifier.Node node$iv = this_$iv4.headNode(includeTail$iv4);
            while (node$iv != null && (node$iv.getAggregateChildKindSet$ui_release() & mask$iv4) != 0) {
                if ((node$iv.getKindSet$ui_release() & mask$iv4) != 0) {
                    Object it = node$iv;
                    Object stack$iv = null;
                    Object node$iv2 = it;
                    while (node$iv2 != null) {
                        Intrinsics.reifiedOperationMarker(3, ExifInterface.GPS_DIRECTION_TRUE);
                        if (node$iv2 instanceof Object) {
                            function1.invoke(node$iv2);
                            z2 = z3;
                            includeTail$iv2 = includeTail$iv4;
                            this_$iv2 = this_$iv4;
                            mask$iv2 = mask$iv4;
                        } else {
                            Modifier.Node this_$iv$iv = (Modifier.Node) node$iv2;
                            z2 = z3;
                            if (!((this_$iv$iv.getKindSet$ui_release() & type) != 0) || !(node$iv2 instanceof DelegatingNode)) {
                                includeTail$iv2 = includeTail$iv4;
                                this_$iv2 = this_$iv4;
                                mask$iv2 = mask$iv4;
                            } else {
                                int count$iv = 0;
                                DelegatingNode this_$iv$iv2 = (DelegatingNode) node$iv2;
                                Modifier.Node node$iv$iv = this_$iv$iv2.getDelegate$ui_release();
                                while (node$iv$iv != null) {
                                    Modifier.Node next$iv = node$iv$iv;
                                    if (!((next$iv.getKindSet$ui_release() & type) != 0)) {
                                        includeTail$iv3 = includeTail$iv4;
                                        this_$iv3 = this_$iv4;
                                        mask$iv3 = mask$iv4;
                                    } else {
                                        count$iv++;
                                        includeTail$iv3 = includeTail$iv4;
                                        if (count$iv == 1) {
                                            node$iv2 = next$iv;
                                            this_$iv3 = this_$iv4;
                                            mask$iv3 = mask$iv4;
                                        } else {
                                            Object obj2 = (MutableVector) stack$iv;
                                            if (obj2 != null) {
                                                this_$iv3 = this_$iv4;
                                                mask$iv3 = mask$iv4;
                                                obj = obj2;
                                            } else {
                                                this_$iv3 = this_$iv4;
                                                mask$iv3 = mask$iv4;
                                                obj = new MutableVector(new Modifier.Node[16], 0);
                                                MutableVector mutableVector = (MutableVector) obj;
                                            }
                                            stack$iv = obj;
                                            Modifier.Node theNode$iv = (Modifier.Node) node$iv2;
                                            if (theNode$iv != null) {
                                                MutableVector mutableVector2 = (MutableVector) stack$iv;
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(theNode$iv);
                                                }
                                                node$iv2 = null;
                                            }
                                            MutableVector mutableVector3 = (MutableVector) stack$iv;
                                            if (mutableVector3 != null) {
                                                mutableVector3.add(next$iv);
                                            }
                                        }
                                    }
                                    node$iv$iv = node$iv$iv.getChild$ui_release();
                                    includeTail$iv4 = includeTail$iv3;
                                    this_$iv4 = this_$iv3;
                                    mask$iv4 = mask$iv3;
                                }
                                includeTail$iv2 = includeTail$iv4;
                                this_$iv2 = this_$iv4;
                                mask$iv2 = mask$iv4;
                                if (count$iv == 1) {
                                    z3 = z2;
                                    includeTail$iv4 = includeTail$iv2;
                                    this_$iv4 = this_$iv2;
                                    mask$iv4 = mask$iv2;
                                }
                            }
                        }
                        node$iv2 = DelegatableNodeKt.pop((MutableVector) stack$iv);
                        z3 = z2;
                        includeTail$iv4 = includeTail$iv2;
                        this_$iv4 = this_$iv2;
                        mask$iv4 = mask$iv2;
                    }
                    z = z3;
                    includeTail$iv = includeTail$iv4;
                    this_$iv = this_$iv4;
                    mask$iv = mask$iv4;
                } else {
                    z = z3;
                    includeTail$iv = includeTail$iv4;
                    this_$iv = this_$iv4;
                    mask$iv = mask$iv4;
                }
                if (node$iv == stopNode$iv) {
                    return;
                }
                node$iv = node$iv.getChild$ui_release();
                z3 = z;
                includeTail$iv4 = includeTail$iv;
                this_$iv4 = this_$iv;
                mask$iv4 = mask$iv;
            }
        }
    }

    /* renamed from: hasNode-H91voCI */
    private final boolean m5868hasNodeH91voCI(int type) {
        Modifier.Node headNode = headNode(NodeKindKt.m5907getIncludeSelfInTraversalH91voCI(type));
        return headNode != null && DelegatableNodeKt.m5757has64DMado(headNode, type);
    }

    /* renamed from: head-H91voCI */
    public final Modifier.Node m5884headH91voCI(int type) {
        boolean includeTail$iv = NodeKindKt.m5907getIncludeSelfInTraversalH91voCI(type);
        Modifier.Node stopNode$iv = getTail();
        if (includeTail$iv || (stopNode$iv = stopNode$iv.getParent$ui_release()) != null) {
            for (Modifier.Node node$iv = headNode(includeTail$iv); node$iv != null && (node$iv.getAggregateChildKindSet$ui_release() & type) != 0; node$iv = node$iv.getChild$ui_release()) {
                if ((node$iv.getKindSet$ui_release() & type) != 0) {
                    Modifier.Node it = node$iv;
                    return it;
                } else if (node$iv == stopNode$iv) {
                    return null;
                }
            }
            return null;
        }
        return null;
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: getSize-YbymL2g */
    public final long mo5645getSizeYbymL2g() {
        return m5696getMeasuredSizeYbymL2g();
    }

    protected final Function1<GraphicsLayerScope, Unit> getLayerBlock() {
        return this.layerBlock;
    }

    public final boolean isTransparent() {
        if (this.layer == null || this.lastLayerAlpha > 0.0f) {
            NodeCoordinator nodeCoordinator = this.wrappedBy;
            if (nodeCoordinator != null) {
                return nodeCoordinator.isTransparent();
            }
            return false;
        }
        return true;
    }

    @Override // androidx.compose.ui.node.LookaheadCapablePlaceable
    public AlignmentLinesOwner getAlignmentLinesOwner() {
        return getLayoutNode().getLayoutDelegate$ui_release().getAlignmentLinesOwner$ui_release();
    }

    @Override // androidx.compose.ui.node.LookaheadCapablePlaceable
    public LookaheadCapablePlaceable getChild() {
        return this.wrapped;
    }

    @Override // androidx.compose.ui.node.LookaheadCapablePlaceable
    public void replace$ui_release() {
        GraphicsLayer explicitLayer = this.explicitLayer;
        if (explicitLayer != null) {
            mo5698placeAtf8xVGno(mo5832getPositionnOccac(), this.zIndex, explicitLayer);
        } else {
            mo5638placeAtf8xVGno(mo5832getPositionnOccac(), this.zIndex, this.layerBlock);
        }
    }

    @Override // androidx.compose.ui.node.LookaheadCapablePlaceable
    public boolean getHasMeasureResult() {
        return this._measureResult != null;
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public boolean isAttached() {
        return getTail().isAttached();
    }

    @Override // androidx.compose.ui.node.LookaheadCapablePlaceable
    public MeasureResult getMeasureResult$ui_release() {
        MeasureResult measureResult = this._measureResult;
        if (measureResult != null) {
            return measureResult;
        }
        throw new IllegalStateException(UnmeasuredError.toString());
    }

    /* JADX WARN: Code restructure failed: missing block: B:46:0x0035, code lost:
        if (r1.isNotEmpty() == false) goto L26;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void setMeasureResult$ui_release(androidx.compose.ui.layout.MeasureResult r11) {
        /*
            r10 = this;
            androidx.compose.ui.layout.MeasureResult r0 = r10._measureResult
            if (r11 == r0) goto L9a
            r10._measureResult = r11
            if (r0 == 0) goto L1c
            int r1 = r11.getWidth()
            int r2 = r0.getWidth()
            if (r1 != r2) goto L1c
            int r1 = r11.getHeight()
            int r2 = r0.getHeight()
            if (r1 == r2) goto L27
        L1c:
            int r1 = r11.getWidth()
            int r2 = r11.getHeight()
            r10.onMeasureResultChanged(r1, r2)
        L27:
            androidx.collection.MutableObjectIntMap<androidx.compose.ui.layout.AlignmentLine> r1 = r10.oldAlignmentLines
            if (r1 == 0) goto L37
            androidx.collection.MutableObjectIntMap<androidx.compose.ui.layout.AlignmentLine> r1 = r10.oldAlignmentLines
            kotlin.jvm.internal.Intrinsics.checkNotNull(r1)
            boolean r1 = r1.isNotEmpty()
            if (r1 != 0) goto L41
        L37:
            java.util.Map r1 = r11.getAlignmentLines()
            boolean r1 = r1.isEmpty()
            if (r1 != 0) goto L9a
        L41:
            androidx.collection.MutableObjectIntMap<androidx.compose.ui.layout.AlignmentLine> r1 = r10.oldAlignmentLines
            java.util.Map r2 = r11.getAlignmentLines()
            boolean r1 = androidx.compose.ui.node.NodeCoordinatorKt.access$compareEquals(r1, r2)
            if (r1 != 0) goto L9a
            androidx.compose.ui.node.AlignmentLinesOwner r1 = r10.getAlignmentLinesOwner()
            androidx.compose.ui.node.AlignmentLines r1 = r1.getAlignmentLines()
            r1.onAlignmentsChanged()
            androidx.collection.MutableObjectIntMap<androidx.compose.ui.layout.AlignmentLine> r1 = r10.oldAlignmentLines
            if (r1 != 0) goto L66
            androidx.collection.MutableObjectIntMap r1 = androidx.collection.ObjectIntMapKt.mutableObjectIntMapOf()
            r2 = r1
            r3 = 0
            r10.oldAlignmentLines = r2
        L66:
            r1.clear()
            java.util.Map r2 = r11.getAlignmentLines()
            r3 = 0
            java.util.Set r4 = r2.entrySet()
            java.util.Iterator r4 = r4.iterator()
        L78:
            boolean r5 = r4.hasNext()
            if (r5 == 0) goto L99
            java.lang.Object r5 = r4.next()
            java.util.Map$Entry r5 = (java.util.Map.Entry) r5
            r6 = r5
            r7 = 0
            java.lang.Object r8 = r6.getKey()
            java.lang.Object r9 = r6.getValue()
            java.lang.Number r9 = (java.lang.Number) r9
            int r9 = r9.intValue()
            r1.set(r8, r9)
            goto L78
        L99:
        L9a:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.node.NodeCoordinator.setMeasureResult$ui_release(androidx.compose.ui.layout.MeasureResult):void");
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public Set<AlignmentLine> getProvidedAlignmentLines() {
        Set set = null;
        for (NodeCoordinator coordinator = this; coordinator != null; coordinator = coordinator.wrapped) {
            MeasureResult measureResult = coordinator._measureResult;
            Map alignmentLines = measureResult != null ? measureResult.getAlignmentLines() : null;
            boolean z = false;
            if (alignmentLines != null && (!alignmentLines.isEmpty())) {
                z = true;
            }
            if (z) {
                if (set == null) {
                    Set set2 = new LinkedHashSet();
                    set = set2;
                }
                set.addAll(alignmentLines.keySet());
            }
        }
        return set == null ? SetsKt.emptySet() : set;
    }

    protected void onMeasureResultChanged(int width, int height) {
        NodeCoordinator nodeCoordinator;
        OwnedLayer layer;
        OwnedLayer layer2;
        OwnedLayer layer3;
        OwnedLayer layer4;
        int count$iv$iv;
        MutableVector mutableVector;
        OwnedLayer layer5 = this.layer;
        if (layer5 != null) {
            layer5.mo5954resizeozmzZPI(IntSize.m7039constructorimpl((width << 32) | (height & 4294967295L)));
        } else if (getLayoutNode().isPlaced() && (nodeCoordinator = this.wrappedBy) != null) {
            nodeCoordinator.invalidateLayer();
        }
        m5699setMeasuredSizeozmzZPI(IntSize.m7039constructorimpl((4294967295L & height) | (width << 32)));
        OwnedLayer ownedLayer = null;
        if (this.layerBlock != null) {
            updateLayerParameters(false);
        }
        int m5898constructorimpl = NodeKind.m5898constructorimpl(4);
        boolean includeTail$iv$iv = NodeKindKt.m5907getIncludeSelfInTraversalH91voCI(m5898constructorimpl);
        Modifier.Node stopNode$iv$iv = getTail();
        if (includeTail$iv$iv || (stopNode$iv$iv = stopNode$iv$iv.getParent$ui_release()) != null) {
            Modifier.Node node$iv$iv = headNode(includeTail$iv$iv);
            while (node$iv$iv != null && (node$iv$iv.getAggregateChildKindSet$ui_release() & m5898constructorimpl) != 0) {
                if ((node$iv$iv.getKindSet$ui_release() & m5898constructorimpl) == 0) {
                    layer = layer5;
                    layer2 = ownedLayer;
                } else {
                    Modifier.Node it$iv = node$iv$iv;
                    MutableVector mutableVector2 = null;
                    Modifier.Node node = it$iv;
                    while (node != null) {
                        if (node instanceof DrawModifierNode) {
                            DrawModifierNode it = (DrawModifierNode) node;
                            it.onMeasureResultChanged();
                            layer3 = layer5;
                        } else {
                            Modifier.Node this_$iv$iv$iv = node;
                            if (((this_$iv$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0 ? 1 : 0) == 0 || !(node instanceof DelegatingNode)) {
                                layer3 = layer5;
                            } else {
                                int count$iv$iv2 = 0;
                                DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node;
                                Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                while (node$iv$iv$iv != null) {
                                    Modifier.Node next$iv$iv = node$iv$iv$iv;
                                    if (!((next$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0)) {
                                        layer4 = layer5;
                                    } else {
                                        count$iv$iv2++;
                                        if (count$iv$iv2 == 1) {
                                            node = next$iv$iv;
                                            layer4 = layer5;
                                        } else {
                                            if (mutableVector2 != null) {
                                                count$iv$iv = count$iv$iv2;
                                                layer4 = layer5;
                                                mutableVector = mutableVector2;
                                            } else {
                                                count$iv$iv = count$iv$iv2;
                                                layer4 = layer5;
                                                mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                            }
                                            Modifier.Node theNode$iv$iv = node;
                                            if (theNode$iv$iv != null) {
                                                if (mutableVector != null) {
                                                    mutableVector.add(theNode$iv$iv);
                                                }
                                                node = null;
                                            }
                                            if (mutableVector != null) {
                                                mutableVector.add(next$iv$iv);
                                            }
                                            mutableVector2 = mutableVector;
                                            count$iv$iv2 = count$iv$iv;
                                        }
                                    }
                                    node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                    layer5 = layer4;
                                }
                                layer3 = layer5;
                                if (count$iv$iv2 == 1) {
                                    layer5 = layer3;
                                }
                            }
                        }
                        node = DelegatableNodeKt.pop(mutableVector2);
                        layer5 = layer3;
                    }
                    layer = layer5;
                    layer2 = null;
                }
                if (node$iv$iv == stopNode$iv$iv) {
                    break;
                }
                node$iv$iv = node$iv$iv.getChild$ui_release();
                ownedLayer = layer2;
                layer5 = layer;
            }
        }
        Owner owner$ui_release = getLayoutNode().getOwner$ui_release();
        if (owner$ui_release != null) {
            owner$ui_release.onLayoutChange(getLayoutNode());
        }
    }

    @Override // androidx.compose.ui.node.LookaheadCapablePlaceable
    /* renamed from: getPosition-nOcc-ac */
    public long mo5832getPositionnOccac() {
        return this.position;
    }

    /* renamed from: setPosition--gyyYBs */
    protected void m5889setPositiongyyYBs(long j) {
        this.position = j;
    }

    public final float getZIndex() {
        return this.zIndex;
    }

    protected final void setZIndex(float f) {
        this.zIndex = f;
    }

    /* JADX WARN: Type inference failed for: r2v5, types: [T, java.lang.Object] */
    @Override // androidx.compose.ui.layout.Measured, androidx.compose.ui.layout.IntrinsicMeasurable
    public Object getParentData() {
        NodeChain this_$iv;
        int $i$f$tailToHead$ui_release;
        Modifier.Node node$iv;
        NodeChain this_$iv2;
        int $i$f$tailToHead$ui_release2;
        Modifier.Node node$iv2;
        NodeChain this_$iv3;
        int $i$f$tailToHead$ui_release3;
        Modifier.Node node$iv3;
        int count$iv;
        MutableVector mutableVector;
        int i = 64;
        if (getLayoutNode().getNodes$ui_release().m5859hasH91voCI$ui_release(NodeKind.m5898constructorimpl(64))) {
            Modifier.Node thisNode = getTail();
            Ref.ObjectRef data = new Ref.ObjectRef();
            NodeChain this_$iv4 = getLayoutNode().getNodes$ui_release();
            int $i$f$tailToHead$ui_release4 = 0;
            Modifier.Node node$iv4 = this_$iv4.getTail$ui_release();
            while (node$iv4 != null) {
                Modifier.Node node = node$iv4;
                int kind$iv = (node.getKindSet$ui_release() & NodeKind.m5898constructorimpl(i)) != 0 ? 1 : 0;
                if (kind$iv == 0) {
                    this_$iv = this_$iv4;
                    $i$f$tailToHead$ui_release = $i$f$tailToHead$ui_release4;
                    node$iv = node$iv4;
                } else {
                    int m5898constructorimpl = NodeKind.m5898constructorimpl(i);
                    MutableVector mutableVector2 = null;
                    Modifier.Node node2 = node;
                    while (node2 != null) {
                        if (node2 instanceof ParentDataModifierNode) {
                            ParentDataModifierNode it = (ParentDataModifierNode) node2;
                            data.element = it.modifyParentData(getLayoutNode().getDensity(), data.element);
                            this_$iv2 = this_$iv4;
                            $i$f$tailToHead$ui_release2 = $i$f$tailToHead$ui_release4;
                            node$iv2 = node$iv4;
                        } else {
                            Modifier.Node this_$iv$iv = node2;
                            if (!((this_$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) || !(node2 instanceof DelegatingNode)) {
                                this_$iv2 = this_$iv4;
                                $i$f$tailToHead$ui_release2 = $i$f$tailToHead$ui_release4;
                                node$iv2 = node$iv4;
                            } else {
                                int count$iv2 = 0;
                                DelegatingNode this_$iv$iv2 = (DelegatingNode) node2;
                                Modifier.Node node$iv$iv = this_$iv$iv2.getDelegate$ui_release();
                                while (node$iv$iv != null) {
                                    Modifier.Node next$iv = node$iv$iv;
                                    if (!((next$iv.getKindSet$ui_release() & m5898constructorimpl) != 0)) {
                                        this_$iv3 = this_$iv4;
                                        $i$f$tailToHead$ui_release3 = $i$f$tailToHead$ui_release4;
                                        node$iv3 = node$iv4;
                                    } else {
                                        count$iv2++;
                                        this_$iv3 = this_$iv4;
                                        if (count$iv2 == 1) {
                                            node2 = next$iv;
                                            $i$f$tailToHead$ui_release3 = $i$f$tailToHead$ui_release4;
                                            node$iv3 = node$iv4;
                                        } else {
                                            if (mutableVector2 != null) {
                                                count$iv = count$iv2;
                                                $i$f$tailToHead$ui_release3 = $i$f$tailToHead$ui_release4;
                                                node$iv3 = node$iv4;
                                                mutableVector = mutableVector2;
                                            } else {
                                                count$iv = count$iv2;
                                                $i$f$tailToHead$ui_release3 = $i$f$tailToHead$ui_release4;
                                                node$iv3 = node$iv4;
                                                mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                            }
                                            mutableVector2 = mutableVector;
                                            Modifier.Node theNode$iv = node2;
                                            if (theNode$iv != null) {
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(theNode$iv);
                                                }
                                                node2 = null;
                                            }
                                            if (mutableVector2 != null) {
                                                mutableVector2.add(next$iv);
                                            }
                                            count$iv2 = count$iv;
                                        }
                                    }
                                    node$iv$iv = node$iv$iv.getChild$ui_release();
                                    this_$iv4 = this_$iv3;
                                    $i$f$tailToHead$ui_release4 = $i$f$tailToHead$ui_release3;
                                    node$iv4 = node$iv3;
                                }
                                this_$iv2 = this_$iv4;
                                $i$f$tailToHead$ui_release2 = $i$f$tailToHead$ui_release4;
                                node$iv2 = node$iv4;
                                if (count$iv2 == 1) {
                                    this_$iv4 = this_$iv2;
                                    $i$f$tailToHead$ui_release4 = $i$f$tailToHead$ui_release2;
                                    node$iv4 = node$iv2;
                                }
                            }
                        }
                        node2 = DelegatableNodeKt.pop(mutableVector2);
                        this_$iv4 = this_$iv2;
                        $i$f$tailToHead$ui_release4 = $i$f$tailToHead$ui_release2;
                        node$iv4 = node$iv2;
                    }
                    this_$iv = this_$iv4;
                    $i$f$tailToHead$ui_release = $i$f$tailToHead$ui_release4;
                    node$iv = node$iv4;
                }
                if (node != thisNode) {
                }
                node$iv4 = node$iv.getParent$ui_release();
                this_$iv4 = this_$iv;
                $i$f$tailToHead$ui_release4 = $i$f$tailToHead$ui_release;
                i = 64;
            }
            return data.element;
        }
        return null;
    }

    public final void onCoordinatesUsed$ui_release() {
        getLayoutNode().getLayoutDelegate$ui_release().onCoordinatesUsed();
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public final LayoutCoordinates getParentLayoutCoordinates() {
        boolean value$iv = isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException(ExpectAttachedLayoutCoordinates);
        }
        onCoordinatesUsed$ui_release();
        return getLayoutNode().getOuterCoordinator$ui_release().wrappedBy;
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public final LayoutCoordinates getParentCoordinates() {
        boolean value$iv = isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException(ExpectAttachedLayoutCoordinates);
        }
        onCoordinatesUsed$ui_release();
        return this.wrappedBy;
    }

    protected final MutableRect getRectCache() {
        MutableRect mutableRect = this._rectCache;
        if (mutableRect == null) {
            MutableRect it = new MutableRect(0.0f, 0.0f, 0.0f, 0.0f);
            this._rectCache = it;
            return it;
        }
        return mutableRect;
    }

    public final OwnerSnapshotObserver getSnapshotObserver() {
        return LayoutNodeKt.requireOwner(getLayoutNode()).getSnapshotObserver();
    }

    /* renamed from: getLastMeasurementConstraints-msEJaDk$ui_release */
    public final long m5882getLastMeasurementConstraintsmsEJaDk$ui_release() {
        return m5697getMeasurementConstraintsmsEJaDk();
    }

    /* renamed from: performingMeasure-K40F9xA */
    protected final Placeable m5887performingMeasureK40F9xA(long constraints, Function0<? extends Placeable> function0) {
        m5700setMeasurementConstraintsBRTryo0(constraints);
        return function0.invoke();
    }

    public final void onMeasured() {
        Modifier.Node stopNode$iv$iv;
        boolean z;
        int type$iv;
        NodeCoordinator this_$iv;
        boolean z2;
        NodeCoordinator this_$iv2;
        boolean z3;
        Modifier.Node node;
        MutableVector mutableVector;
        NodeCoordinator nodeCoordinator = this;
        if (nodeCoordinator.m5868hasNodeH91voCI(NodeKind.m5898constructorimpl(128))) {
            Snapshot.Companion this_$iv3 = Snapshot.Companion;
            Snapshot previousSnapshot$iv = this_$iv3.getCurrentThreadSnapshot();
            Function1 observer$iv = previousSnapshot$iv != null ? previousSnapshot$iv.getReadObserver() : null;
            Snapshot newSnapshot$iv = this_$iv3.makeCurrentNonObservable(previousSnapshot$iv);
            boolean z4 = false;
            try {
                int type$iv2 = NodeKind.m5898constructorimpl(128);
                NodeCoordinator this_$iv4 = this;
                boolean z5 = false;
                boolean includeTail$iv$iv = NodeKindKt.m5907getIncludeSelfInTraversalH91voCI(type$iv2);
                if (includeTail$iv$iv) {
                    stopNode$iv$iv = this_$iv4.getTail();
                } else {
                    stopNode$iv$iv = this_$iv4.getTail().getParent$ui_release();
                    if (stopNode$iv$iv == null) {
                        Unit unit = Unit.INSTANCE;
                    }
                }
                Modifier.Node node$iv$iv = this_$iv4.headNode(includeTail$iv$iv);
                while (node$iv$iv != null && (node$iv$iv.getAggregateChildKindSet$ui_release() & type$iv2) != 0) {
                    if ((node$iv$iv.getKindSet$ui_release() & type$iv2) == 0) {
                        z = z4;
                        type$iv = type$iv2;
                        this_$iv = this_$iv4;
                        z2 = z5;
                    } else {
                        Object it$iv = node$iv$iv;
                        MutableVector mutableVector2 = null;
                        z = z4;
                        Object obj = it$iv;
                        while (obj != null) {
                            int type$iv3 = type$iv2;
                            if (obj instanceof LayoutAwareModifierNode) {
                                LayoutAwareModifierNode it = (LayoutAwareModifierNode) obj;
                                this_$iv2 = this_$iv4;
                                z3 = z5;
                                it.mo632onRemeasuredozmzZPI(nodeCoordinator.m5696getMeasuredSizeYbymL2g());
                            } else {
                                this_$iv2 = this_$iv4;
                                z3 = z5;
                                Modifier.Node this_$iv$iv$iv = obj;
                                int kindSet$ui_release = this_$iv$iv$iv.getKindSet$ui_release() & type$iv3;
                                int i = 1;
                                if ((kindSet$ui_release != 0 ? 1 : 0) != 0 && (obj instanceof DelegatingNode)) {
                                    int count$iv$iv = 0;
                                    DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) obj;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (((next$iv$iv.getKindSet$ui_release() & type$iv3) != 0 ? i : 0) != 0) {
                                            count$iv$iv++;
                                            if (count$iv$iv == i) {
                                                obj = next$iv$iv;
                                            } else {
                                                if (mutableVector2 != null) {
                                                    node = obj;
                                                    mutableVector = mutableVector2;
                                                } else {
                                                    node = obj;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                }
                                                Modifier.Node theNode$iv$iv = node;
                                                if (theNode$iv$iv != null) {
                                                    if (mutableVector != null) {
                                                        mutableVector.add(theNode$iv$iv);
                                                    }
                                                    node = null;
                                                }
                                                if (mutableVector != null) {
                                                    mutableVector.add(next$iv$iv);
                                                }
                                                mutableVector2 = mutableVector;
                                                obj = node;
                                            }
                                        }
                                        node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                        i = 1;
                                    }
                                    Modifier.Node node2 = obj;
                                    if (count$iv$iv == 1) {
                                        nodeCoordinator = this;
                                        type$iv2 = type$iv3;
                                        this_$iv4 = this_$iv2;
                                        z5 = z3;
                                        obj = node2;
                                    }
                                }
                            }
                            obj = DelegatableNodeKt.pop(mutableVector2);
                            nodeCoordinator = this;
                            type$iv2 = type$iv3;
                            this_$iv4 = this_$iv2;
                            z5 = z3;
                        }
                        type$iv = type$iv2;
                        this_$iv = this_$iv4;
                        z2 = z5;
                    }
                    if (node$iv$iv == stopNode$iv$iv) {
                        break;
                    }
                    node$iv$iv = node$iv$iv.getChild$ui_release();
                    nodeCoordinator = this;
                    z4 = z;
                    type$iv2 = type$iv;
                    this_$iv4 = this_$iv;
                    z5 = z2;
                }
                Unit unit2 = Unit.INSTANCE;
            } finally {
                this_$iv3.restoreNonObservable(previousSnapshot$iv, newSnapshot$iv, observer$iv);
            }
        }
    }

    public final void onUnplaced() {
        int type$iv;
        NodeCoordinator this_$iv;
        boolean z;
        NodeCoordinator this_$iv2;
        boolean z2;
        NodeCoordinator this_$iv3;
        boolean z3;
        int count$iv$iv;
        MutableVector mutableVector;
        if (!m5868hasNodeH91voCI(NodeKind.m5898constructorimpl(1048576))) {
            return;
        }
        int count$iv$iv2 = NodeKind.m5898constructorimpl(1048576);
        NodeCoordinator this_$iv4 = this;
        boolean z4 = false;
        boolean includeTail$iv$iv = NodeKindKt.m5907getIncludeSelfInTraversalH91voCI(count$iv$iv2);
        Modifier.Node stopNode$iv$iv = this_$iv4.getTail();
        if (includeTail$iv$iv || (stopNode$iv$iv = stopNode$iv$iv.getParent$ui_release()) != null) {
            Modifier.Node node$iv$iv = this_$iv4.headNode(includeTail$iv$iv);
            while (node$iv$iv != null && (node$iv$iv.getAggregateChildKindSet$ui_release() & count$iv$iv2) != 0) {
                if ((node$iv$iv.getKindSet$ui_release() & count$iv$iv2) == 0) {
                    type$iv = count$iv$iv2;
                    this_$iv = this_$iv4;
                    z = z4;
                } else {
                    Modifier.Node it$iv = node$iv$iv;
                    MutableVector mutableVector2 = null;
                    Modifier.Node node = it$iv;
                    while (node != null) {
                        int type$iv2 = count$iv$iv2;
                        if (node instanceof OnUnplacedModifierNode) {
                            OnUnplacedModifierNode it = (OnUnplacedModifierNode) node;
                            it.onUnplaced();
                            this_$iv2 = this_$iv4;
                            z2 = z4;
                        } else {
                            Modifier.Node this_$iv$iv$iv = node;
                            if (((this_$iv$iv$iv.getKindSet$ui_release() & type$iv2) != 0 ? 1 : 0) == 0 || !(node instanceof DelegatingNode)) {
                                this_$iv2 = this_$iv4;
                                z2 = z4;
                            } else {
                                int count$iv$iv3 = 0;
                                DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node;
                                Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                while (node$iv$iv$iv != null) {
                                    Modifier.Node next$iv$iv = node$iv$iv$iv;
                                    if (!((next$iv$iv.getKindSet$ui_release() & type$iv2) != 0)) {
                                        this_$iv3 = this_$iv4;
                                        z3 = z4;
                                    } else {
                                        count$iv$iv3++;
                                        this_$iv3 = this_$iv4;
                                        if (count$iv$iv3 == 1) {
                                            node = next$iv$iv;
                                            z3 = z4;
                                        } else {
                                            if (mutableVector2 != null) {
                                                count$iv$iv = count$iv$iv3;
                                                z3 = z4;
                                                mutableVector = mutableVector2;
                                            } else {
                                                count$iv$iv = count$iv$iv3;
                                                z3 = z4;
                                                mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                            }
                                            mutableVector2 = mutableVector;
                                            Modifier.Node theNode$iv$iv = node;
                                            if (theNode$iv$iv != null) {
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(theNode$iv$iv);
                                                }
                                                node = null;
                                            }
                                            if (mutableVector2 != null) {
                                                mutableVector2.add(next$iv$iv);
                                            }
                                            count$iv$iv3 = count$iv$iv;
                                        }
                                    }
                                    node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                    this_$iv4 = this_$iv3;
                                    z4 = z3;
                                }
                                this_$iv2 = this_$iv4;
                                z2 = z4;
                                if (count$iv$iv3 == 1) {
                                    count$iv$iv2 = type$iv2;
                                    this_$iv4 = this_$iv2;
                                    z4 = z2;
                                }
                            }
                        }
                        node = DelegatableNodeKt.pop(mutableVector2);
                        count$iv$iv2 = type$iv2;
                        this_$iv4 = this_$iv2;
                        z4 = z2;
                    }
                    type$iv = count$iv$iv2;
                    this_$iv = this_$iv4;
                    z = z4;
                }
                if (node$iv$iv == stopNode$iv$iv) {
                    return;
                }
                node$iv$iv = node$iv$iv.getChild$ui_release();
                count$iv$iv2 = type$iv;
                this_$iv4 = this_$iv;
                z4 = z;
            }
        }
    }

    @Override // androidx.compose.ui.layout.Placeable
    /* renamed from: placeAt-f8xVGno */
    public void mo5638placeAtf8xVGno(long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1) {
        if (this.forcePlaceWithLookaheadOffset) {
            LookaheadDelegate lookaheadDelegate = getLookaheadDelegate();
            Intrinsics.checkNotNull(lookaheadDelegate);
            m5874placeSelfMLgxB_4(lookaheadDelegate.mo5832getPositionnOccac(), zIndex, function1, null);
            return;
        }
        m5874placeSelfMLgxB_4(position, zIndex, function1, null);
    }

    @Override // androidx.compose.ui.layout.Placeable
    /* renamed from: placeAt-f8xVGno */
    public void mo5698placeAtf8xVGno(long position, float zIndex, GraphicsLayer layer) {
        if (this.forcePlaceWithLookaheadOffset) {
            LookaheadDelegate lookaheadDelegate = getLookaheadDelegate();
            Intrinsics.checkNotNull(lookaheadDelegate);
            m5874placeSelfMLgxB_4(lookaheadDelegate.mo5832getPositionnOccac(), zIndex, null, layer);
            return;
        }
        m5874placeSelfMLgxB_4(position, zIndex, null, layer);
    }

    /* renamed from: placeSelf-MLgxB_4 */
    private final void m5874placeSelfMLgxB_4(long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1, GraphicsLayer explicitLayer) {
        if (explicitLayer != null) {
            boolean value$iv = function1 == null;
            if (!value$iv) {
                InlineClassHelperKt.throwIllegalArgumentException("both ways to create layers shouldn't be used together");
            }
            if (this.explicitLayer != explicitLayer) {
                this.explicitLayer = null;
                updateLayerBlock$default(this, null, false, 2, null);
                this.explicitLayer = explicitLayer;
            }
            if (this.layer == null) {
                OwnedLayer $this$placeSelf_MLgxB_4_u24lambda_u2415 = Owner.createLayer$default(LayoutNodeKt.requireOwner(getLayoutNode()), getDrawBlock(), this.invalidateParentLayer, explicitLayer, false, 8, null);
                $this$placeSelf_MLgxB_4_u24lambda_u2415.mo5954resizeozmzZPI(m5696getMeasuredSizeYbymL2g());
                $this$placeSelf_MLgxB_4_u24lambda_u2415.mo5953movegyyYBs(position);
                this.layer = $this$placeSelf_MLgxB_4_u24lambda_u2415;
                getLayoutNode().setInnerLayerCoordinatorIsDirty$ui_release(true);
                this.invalidateParentLayer.invoke();
            }
        } else {
            if (this.explicitLayer != null) {
                this.explicitLayer = null;
                updateLayerBlock$default(this, null, false, 2, null);
            }
            updateLayerBlock$default(this, function1, false, 2, null);
        }
        if (!IntOffset.m7000equalsimpl0(mo5832getPositionnOccac(), position)) {
            m5889setPositiongyyYBs(position);
            getLayoutNode().getLayoutDelegate$ui_release().getMeasurePassDelegate$ui_release().notifyChildrenUsingCoordinatesWhilePlacing();
            OwnedLayer layer = this.layer;
            if (layer != null) {
                layer.mo5953movegyyYBs(position);
            } else {
                NodeCoordinator nodeCoordinator = this.wrappedBy;
                if (nodeCoordinator != null) {
                    nodeCoordinator.invalidateLayer();
                }
            }
            invalidateAlignmentLinesFromPositionChange(this);
            Owner owner$ui_release = getLayoutNode().getOwner$ui_release();
            if (owner$ui_release != null) {
                owner$ui_release.onLayoutChange(getLayoutNode());
            }
        }
        this.zIndex = zIndex;
        if (!isPlacingForAlignment$ui_release()) {
            captureRulers$ui_release(getMeasureResult$ui_release());
        }
    }

    public final void releaseLayer() {
        if (this.layer != null) {
            if (this.explicitLayer != null) {
                this.explicitLayer = null;
            }
            updateLayerBlock$default(this, null, false, 2, null);
            LayoutNode.requestRelayout$ui_release$default(getLayoutNode(), false, 1, null);
        }
    }

    /* renamed from: placeSelfApparentToRealOffset-MLgxB_4 */
    public final void m5888placeSelfApparentToRealOffsetMLgxB_4(long position, float zIndex, Function1<? super GraphicsLayerScope, Unit> function1, GraphicsLayer layer) {
        m5874placeSelfMLgxB_4(IntOffset.m7005plusqkQi6aY(position, m5695getApparentToRealOffsetnOccac()), zIndex, function1, layer);
    }

    public final void draw(Canvas canvas, GraphicsLayer graphicsLayer) {
        OwnedLayer layer = this.layer;
        if (layer != null) {
            layer.drawLayer(canvas, graphicsLayer);
            return;
        }
        float x = IntOffset.m7001getXimpl(mo5832getPositionnOccac());
        float y = IntOffset.m7002getYimpl(mo5832getPositionnOccac());
        canvas.translate(x, y);
        drawContainedDrawModifiers(canvas, graphicsLayer);
        canvas.translate(-x, -y);
    }

    public final void drawContainedDrawModifiers(Canvas canvas, GraphicsLayer graphicsLayer) {
        Modifier.Node head = m5884headH91voCI(NodeKind.m5898constructorimpl(4));
        if (head == null) {
            performDraw(canvas, graphicsLayer);
            return;
        }
        LayoutNodeDrawScope drawScope = getLayoutNode().getMDrawScope$ui_release();
        drawScope.m5827draweZhPAX0$ui_release(canvas, IntSizeKt.m7056toSizeozmzZPI(mo5645getSizeYbymL2g()), this, head, graphicsLayer);
    }

    public void performDraw(Canvas canvas, GraphicsLayer graphicsLayer) {
        NodeCoordinator nodeCoordinator = this.wrapped;
        if (nodeCoordinator != null) {
            nodeCoordinator.draw(canvas, graphicsLayer);
        }
    }

    public final void onPlaced() {
        int type$iv;
        NodeCoordinator this_$iv;
        boolean z;
        int type$iv2;
        NodeCoordinator this_$iv2;
        boolean z2;
        NodeCoordinator this_$iv3;
        boolean z3;
        MutableVector mutableVector;
        int type$iv3 = NodeKind.m5898constructorimpl(128);
        NodeCoordinator this_$iv4 = this;
        boolean z4 = false;
        boolean includeTail$iv$iv = NodeKindKt.m5907getIncludeSelfInTraversalH91voCI(type$iv3);
        Modifier.Node stopNode$iv$iv = this_$iv4.getTail();
        if (includeTail$iv$iv || (stopNode$iv$iv = stopNode$iv$iv.getParent$ui_release()) != null) {
            Modifier.Node node$iv$iv = this_$iv4.headNode(includeTail$iv$iv);
            while (node$iv$iv != null && (node$iv$iv.getAggregateChildKindSet$ui_release() & type$iv3) != 0) {
                if ((node$iv$iv.getKindSet$ui_release() & type$iv3) == 0) {
                    type$iv = type$iv3;
                    this_$iv = this_$iv4;
                    z = z4;
                } else {
                    Modifier.Node it$iv = node$iv$iv;
                    MutableVector mutableVector2 = null;
                    Modifier.Node node = it$iv;
                    while (node != null) {
                        if (node instanceof LayoutAwareModifierNode) {
                            LayoutAwareModifierNode it = (LayoutAwareModifierNode) node;
                            type$iv2 = type$iv3;
                            it.onPlaced(this);
                            this_$iv2 = this_$iv4;
                            z2 = z4;
                        } else {
                            type$iv2 = type$iv3;
                            Modifier.Node this_$iv$iv$iv = node;
                            int kindSet$ui_release = this_$iv$iv$iv.getKindSet$ui_release() & type$iv2;
                            int i = 1;
                            if ((kindSet$ui_release != 0 ? 1 : 0) == 0 || !(node instanceof DelegatingNode)) {
                                this_$iv2 = this_$iv4;
                                z2 = z4;
                            } else {
                                int count$iv$iv = 0;
                                DelegatingNode this_$iv$iv$iv2 = (DelegatingNode) node;
                                Modifier.Node node$iv$iv$iv = this_$iv$iv$iv2.getDelegate$ui_release();
                                while (node$iv$iv$iv != null) {
                                    Modifier.Node next$iv$iv = node$iv$iv$iv;
                                    if (((next$iv$iv.getKindSet$ui_release() & type$iv2) != 0 ? i : 0) == 0) {
                                        this_$iv3 = this_$iv4;
                                        z3 = z4;
                                    } else {
                                        count$iv$iv++;
                                        if (count$iv$iv == i) {
                                            node = next$iv$iv;
                                            this_$iv3 = this_$iv4;
                                            z3 = z4;
                                        } else {
                                            if (mutableVector2 != null) {
                                                this_$iv3 = this_$iv4;
                                                z3 = z4;
                                                mutableVector = mutableVector2;
                                            } else {
                                                this_$iv3 = this_$iv4;
                                                z3 = z4;
                                                mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                            }
                                            mutableVector2 = mutableVector;
                                            Modifier.Node theNode$iv$iv = node;
                                            if (theNode$iv$iv != null) {
                                                if (mutableVector2 != null) {
                                                    mutableVector2.add(theNode$iv$iv);
                                                }
                                                node = null;
                                            }
                                            if (mutableVector2 != null) {
                                                mutableVector2.add(next$iv$iv);
                                            }
                                        }
                                    }
                                    node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                    this_$iv4 = this_$iv3;
                                    z4 = z3;
                                    i = 1;
                                }
                                this_$iv2 = this_$iv4;
                                z2 = z4;
                                if (count$iv$iv == 1) {
                                    type$iv3 = type$iv2;
                                    this_$iv4 = this_$iv2;
                                    z4 = z2;
                                }
                            }
                        }
                        node = DelegatableNodeKt.pop(mutableVector2);
                        type$iv3 = type$iv2;
                        this_$iv4 = this_$iv2;
                        z4 = z2;
                    }
                    type$iv = type$iv3;
                    this_$iv = this_$iv4;
                    z = z4;
                }
                if (node$iv$iv == stopNode$iv$iv) {
                    return;
                }
                node$iv$iv = node$iv$iv.getChild$ui_release();
                type$iv3 = type$iv;
                this_$iv4 = this_$iv;
                z4 = z;
            }
        }
    }

    private final Function2<Canvas, GraphicsLayer, Unit> getDrawBlock() {
        Function2 block = this._drawBlock;
        if (block == null) {
            final Function0 drawBlockCallToDrawModifiers = new Function0<Unit>() { // from class: androidx.compose.ui.node.NodeCoordinator$drawBlock$drawBlockCallToDrawModifiers$1
                /* JADX INFO: Access modifiers changed from: package-private */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public /* bridge */ /* synthetic */ Unit invoke() {
                    invoke2();
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2() {
                    Canvas canvas;
                    GraphicsLayer graphicsLayer;
                    NodeCoordinator nodeCoordinator = NodeCoordinator.this;
                    canvas = NodeCoordinator.this.drawBlockCanvas;
                    Intrinsics.checkNotNull(canvas);
                    graphicsLayer = NodeCoordinator.this.drawBlockParentLayer;
                    nodeCoordinator.drawContainedDrawModifiers(canvas, graphicsLayer);
                }
            };
            Function2 block2 = new Function2<Canvas, GraphicsLayer, Unit>() { // from class: androidx.compose.ui.node.NodeCoordinator$drawBlock$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(2);
                }

                @Override // kotlin.jvm.functions.Function2
                public /* bridge */ /* synthetic */ Unit invoke(Canvas canvas, GraphicsLayer graphicsLayer) {
                    invoke2(canvas, graphicsLayer);
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2(Canvas canvas, GraphicsLayer parentLayer) {
                    OwnerSnapshotObserver snapshotObserver;
                    Function1 function1;
                    boolean isPlaced = NodeCoordinator.this.getLayoutNode().isPlaced();
                    NodeCoordinator nodeCoordinator = NodeCoordinator.this;
                    if (isPlaced) {
                        nodeCoordinator.drawBlockCanvas = canvas;
                        NodeCoordinator.this.drawBlockParentLayer = parentLayer;
                        snapshotObserver = NodeCoordinator.this.getSnapshotObserver();
                        function1 = NodeCoordinator.onCommitAffectingLayer;
                        snapshotObserver.observeReads$ui_release(NodeCoordinator.this, function1, drawBlockCallToDrawModifiers);
                        NodeCoordinator.this.lastLayerDrawingWasSkipped = false;
                        return;
                    }
                    nodeCoordinator.lastLayerDrawingWasSkipped = true;
                }
            };
            this._drawBlock = block2;
            return block2;
        }
        return block;
    }

    public static /* synthetic */ void updateLayerBlock$default(NodeCoordinator nodeCoordinator, Function1 function1, boolean z, int i, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: updateLayerBlock");
        }
        if ((i & 2) != 0) {
            z = false;
        }
        nodeCoordinator.updateLayerBlock(function1, z);
    }

    public final void updateLayerBlock(Function1<? super GraphicsLayerScope, Unit> function1, boolean forceUpdateLayerParameters) {
        Owner owner$ui_release;
        boolean value$iv = function1 == null || this.explicitLayer == null;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalArgumentException("layerBlock can't be provided when explicitLayer is provided");
        }
        LayoutNode layoutNode = getLayoutNode();
        boolean updateParameters = (!forceUpdateLayerParameters && this.layerBlock == function1 && Intrinsics.areEqual(this.layerDensity, layoutNode.getDensity()) && this.layerLayoutDirection == layoutNode.getLayoutDirection()) ? false : true;
        this.layerDensity = layoutNode.getDensity();
        this.layerLayoutDirection = layoutNode.getLayoutDirection();
        if (layoutNode.isAttached() && function1 != null) {
            this.layerBlock = function1;
            if (this.layer == null) {
                OwnedLayer $this$updateLayerBlock_u24lambda_u2418 = Owner.createLayer$default(LayoutNodeKt.requireOwner(layoutNode), getDrawBlock(), this.invalidateParentLayer, null, layoutNode.getForceUseOldLayers(), 4, null);
                $this$updateLayerBlock_u24lambda_u2418.mo5954resizeozmzZPI(m5696getMeasuredSizeYbymL2g());
                $this$updateLayerBlock_u24lambda_u2418.mo5953movegyyYBs(mo5832getPositionnOccac());
                this.layer = $this$updateLayerBlock_u24lambda_u2418;
                updateLayerParameters$default(this, false, 1, null);
                layoutNode.setInnerLayerCoordinatorIsDirty$ui_release(true);
                this.invalidateParentLayer.invoke();
                return;
            } else if (updateParameters) {
                boolean positionalPropertiesChanged = updateLayerParameters$default(this, false, 1, null);
                if (positionalPropertiesChanged) {
                    LayoutNodeKt.requireOwner(layoutNode).getRectManager().onLayoutLayerPositionalPropertiesChanged(layoutNode);
                    return;
                }
                return;
            } else {
                return;
            }
        }
        this.layerBlock = null;
        OwnedLayer it = this.layer;
        if (it != null) {
            it.destroy();
            layoutNode.setInnerLayerCoordinatorIsDirty$ui_release(true);
            this.invalidateParentLayer.invoke();
            if (isAttached() && layoutNode.isPlaced() && (owner$ui_release = layoutNode.getOwner$ui_release()) != null) {
                owner$ui_release.onLayoutChange(layoutNode);
            }
        }
        this.layer = null;
        this.lastLayerDrawingWasSkipped = false;
    }

    public static /* synthetic */ boolean updateLayerParameters$default(NodeCoordinator nodeCoordinator, boolean z, int i, Object obj) {
        if (obj == null) {
            if ((i & 1) != 0) {
                z = true;
            }
            return nodeCoordinator.updateLayerParameters(z);
        }
        throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: updateLayerParameters");
    }

    private final boolean updateLayerParameters(boolean invokeOnLayoutChange) {
        Owner owner$ui_release;
        if (this.explicitLayer != null) {
            return false;
        }
        OwnedLayer layer = this.layer;
        if (layer != null) {
            final Function1 layerBlock = this.layerBlock;
            if (layerBlock != null) {
                graphicsLayerScope.reset();
                graphicsLayerScope.setGraphicsDensity$ui_release(getLayoutNode().getDensity());
                graphicsLayerScope.setLayoutDirection$ui_release(getLayoutNode().getLayoutDirection());
                graphicsLayerScope.m4601setSizeuvyYCjk(IntSizeKt.m7056toSizeozmzZPI(mo5645getSizeYbymL2g()));
                getSnapshotObserver().observeReads$ui_release(this, onCommitAffectingLayerParams, new Function0<Unit>() { // from class: androidx.compose.ui.node.NodeCoordinator$updateLayerParameters$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    /* JADX WARN: Multi-variable type inference failed */
                    {
                        super(0);
                    }

                    @Override // kotlin.jvm.functions.Function0
                    public /* bridge */ /* synthetic */ Unit invoke() {
                        invoke2();
                        return Unit.INSTANCE;
                    }

                    /* renamed from: invoke  reason: avoid collision after fix types in other method */
                    public final void invoke2() {
                        ReusableGraphicsLayerScope reusableGraphicsLayerScope;
                        ReusableGraphicsLayerScope reusableGraphicsLayerScope2;
                        Function1<GraphicsLayerScope, Unit> function1 = layerBlock;
                        reusableGraphicsLayerScope = NodeCoordinator.graphicsLayerScope;
                        function1.invoke(reusableGraphicsLayerScope);
                        reusableGraphicsLayerScope2 = NodeCoordinator.graphicsLayerScope;
                        reusableGraphicsLayerScope2.updateOutline$ui_release();
                    }
                });
                LayerPositionalProperties it = this.layerPositionalProperties;
                if (it == null) {
                    it = new LayerPositionalProperties();
                    this.layerPositionalProperties = it;
                }
                tmpLayerPositionalProperties.copyFrom(it);
                it.copyFrom(graphicsLayerScope);
                layer.updateLayerProperties(graphicsLayerScope);
                boolean wasClipping = this.isClipping;
                this.isClipping = graphicsLayerScope.getClip();
                this.lastLayerAlpha = graphicsLayerScope.getAlpha();
                boolean positionalPropertiesChanged = true ^ tmpLayerPositionalProperties.hasSameValuesAs(it);
                if (invokeOnLayoutChange && ((positionalPropertiesChanged || wasClipping != this.isClipping) && (owner$ui_release = getLayoutNode().getOwner$ui_release()) != null)) {
                    owner$ui_release.onLayoutChange(getLayoutNode());
                }
                return positionalPropertiesChanged;
            }
            InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("updateLayerParameters requires a non-null layerBlock");
            throw new KotlinNothingValueException();
        }
        boolean value$iv = this.layerBlock == null;
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException("null layer with a non-null layerBlock");
        }
        return false;
    }

    public final boolean getLastLayerDrawingWasSkipped$ui_release() {
        return this.lastLayerDrawingWasSkipped;
    }

    public final OwnedLayer getLayer() {
        return this.layer;
    }

    @Override // androidx.compose.ui.node.OwnerScope
    public boolean isValidOwnerScope() {
        return (this.layer == null || this.released || !getLayoutNode().isAttached()) ? false : true;
    }

    /* renamed from: getMinimumTouchTargetSize-NH-jbRc */
    public final long m5883getMinimumTouchTargetSizeNHjbRc() {
        Density $this$getMinimumTouchTargetSize_NH_jbRc_u24lambda_u2423 = this.layerDensity;
        return $this$getMinimumTouchTargetSize_NH_jbRc_u24lambda_u2423.mo645toSizeXkaWNTQ(getLayoutNode().getViewConfiguration().mo5821getMinimumTouchTargetSizeMYxV2XQ());
    }

    public final void onAttach() {
        if (this.layer == null && this.layerBlock != null) {
            OwnedLayer $this$onAttach_u24lambda_u2424 = Owner.createLayer$default(LayoutNodeKt.requireOwner(getLayoutNode()), getDrawBlock(), this.invalidateParentLayer, this.explicitLayer, false, 8, null);
            $this$onAttach_u24lambda_u2424.mo5954resizeozmzZPI(m5696getMeasuredSizeYbymL2g());
            $this$onAttach_u24lambda_u2424.mo5953movegyyYBs(mo5832getPositionnOccac());
            $this$onAttach_u24lambda_u2424.invalidate();
            this.layer = $this$onAttach_u24lambda_u2424;
        }
    }

    public final void onDetach() {
        OwnedLayer ownedLayer = this.layer;
        if (ownedLayer != null) {
            ownedLayer.destroy();
        }
        this.layer = null;
    }

    /* renamed from: hitTest-qzLsGqo */
    public final void m5885hitTestqzLsGqo(HitTestSource hitTestSource, long pointerPosition, HitTestResult hitTestResult, int pointerType, boolean isInLayer) {
        boolean z;
        Modifier.Node head = m5884headH91voCI(hitTestSource.mo5894entityTypeOLwlOKw());
        boolean isHitInMinimumTouchTargetBetter = false;
        if (!m5892withinLayerBoundsk4lQ0M(pointerPosition)) {
            if (PointerType.m5583equalsimpl0(pointerType, PointerType.Companion.m5590getTouchT8wyACA())) {
                float distanceFromEdge = m5880distanceInMinimumTouchTargettz77jQw(pointerPosition, m5883getMinimumTouchTargetSizeNHjbRc());
                if (((Integer.MAX_VALUE & Float.floatToRawIntBits(distanceFromEdge)) < 2139095040) && hitTestResult.isHitInMinimumTouchTargetBetter(distanceFromEdge, false)) {
                    m5870hitNearFh5PU_I(head, hitTestSource, pointerPosition, hitTestResult, pointerType, false, distanceFromEdge);
                }
            }
        } else if (head == null) {
            mo5803hitTestChildqzLsGqo(hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer);
        } else if (m5886isPointerInBoundsk4lQ0M(pointerPosition)) {
            m5869hit5ShdDok(head, hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer);
        } else {
            float distanceFromEdge2 = !PointerType.m5583equalsimpl0(pointerType, PointerType.Companion.m5590getTouchT8wyACA()) ? Float.POSITIVE_INFINITY : m5880distanceInMinimumTouchTargettz77jQw(pointerPosition, m5883getMinimumTouchTargetSizeNHjbRc());
            float $this$fastIsFinite$iv = distanceFromEdge2;
            if (!((Integer.MAX_VALUE & Float.floatToRawIntBits($this$fastIsFinite$iv)) < 2139095040)) {
                z = isInLayer;
            } else {
                z = isInLayer;
                if (hitTestResult.isHitInMinimumTouchTargetBetter(distanceFromEdge2, z)) {
                    isHitInMinimumTouchTargetBetter = true;
                }
            }
            m5873outOfBoundsHit8NAm7pk(head, hitTestSource, pointerPosition, hitTestResult, pointerType, z, distanceFromEdge2, isHitInMinimumTouchTargetBetter);
        }
    }

    /* renamed from: hit-5ShdDok */
    private final void m5869hit5ShdDok(Modifier.Node $this$hit_u2d5ShdDok, HitTestSource hitTestSource, long pointerPosition, HitTestResult hitTestResult, int pointerType, boolean isInLayer) {
        long DistanceAndFlags;
        Modifier.Node m5896nextUntilhw7D004;
        if ($this$hit_u2d5ShdDok != null) {
            int startDepth$iv$iv$iv = hitTestResult.hitDepth;
            hitTestResult.removeNodesInRange(hitTestResult.hitDepth + 1, hitTestResult.size());
            hitTestResult.hitDepth++;
            hitTestResult.values.add($this$hit_u2d5ShdDok);
            MutableLongList mutableLongList = hitTestResult.distanceFromEdgeAndFlags;
            DistanceAndFlags = HitTestResultKt.DistanceAndFlags(-1.0f, isInLayer, false);
            mutableLongList.add(DistanceAndFlags);
            m5896nextUntilhw7D004 = NodeCoordinatorKt.m5896nextUntilhw7D004($this$hit_u2d5ShdDok, hitTestSource.mo5894entityTypeOLwlOKw(), NodeKind.m5898constructorimpl(2));
            m5869hit5ShdDok(m5896nextUntilhw7D004, hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer);
            hitTestResult.hitDepth = startDepth$iv$iv$iv;
            return;
        }
        mo5803hitTestChildqzLsGqo(hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer);
    }

    /* renamed from: outOfBoundsHit-8NAm7pk */
    public final void m5873outOfBoundsHit8NAm7pk(final Modifier.Node $this$outOfBoundsHit_u2d8NAm7pk, final HitTestSource hitTestSource, final long pointerPosition, final HitTestResult hitTestResult, final int pointerType, final boolean isInLayer, final float distanceFromEdge, final boolean isHitInMinimumTouchTargetBetter) {
        if ($this$outOfBoundsHit_u2d8NAm7pk == null) {
            mo5803hitTestChildqzLsGqo(hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer);
        } else if (m5871isInExpandedTouchBoundsThDn1k($this$outOfBoundsHit_u2d8NAm7pk, pointerPosition, pointerType)) {
            hitTestResult.hitExpandedTouchBounds($this$outOfBoundsHit_u2d8NAm7pk, isInLayer, new Function0<Unit>() { // from class: androidx.compose.ui.node.NodeCoordinator$outOfBoundsHit$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public /* bridge */ /* synthetic */ Unit invoke() {
                    invoke2();
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2() {
                    Modifier.Node m5896nextUntilhw7D004;
                    NodeCoordinator nodeCoordinator = NodeCoordinator.this;
                    m5896nextUntilhw7D004 = NodeCoordinatorKt.m5896nextUntilhw7D004($this$outOfBoundsHit_u2d8NAm7pk, hitTestSource.mo5894entityTypeOLwlOKw(), NodeKind.m5898constructorimpl(2));
                    nodeCoordinator.m5873outOfBoundsHit8NAm7pk(m5896nextUntilhw7D004, hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer, distanceFromEdge, isHitInMinimumTouchTargetBetter);
                }
            });
        } else if (isHitInMinimumTouchTargetBetter) {
            m5870hitNearFh5PU_I($this$outOfBoundsHit_u2d8NAm7pk, hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer, distanceFromEdge);
        } else {
            m5875speculativeHitFh5PU_I($this$outOfBoundsHit_u2d8NAm7pk, hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer, distanceFromEdge);
        }
    }

    /* renamed from: hitNear-Fh5PU_I */
    private final void m5870hitNearFh5PU_I(Modifier.Node $this$hitNear_u2dFh5PU_I, HitTestSource hitTestSource, long pointerPosition, HitTestResult hitTestResult, int pointerType, boolean isInLayer, float distanceFromEdge) {
        long DistanceAndFlags;
        Modifier.Node m5896nextUntilhw7D004;
        if ($this$hitNear_u2dFh5PU_I != null) {
            int startDepth$iv$iv = hitTestResult.hitDepth;
            hitTestResult.removeNodesInRange(hitTestResult.hitDepth + 1, hitTestResult.size());
            hitTestResult.hitDepth++;
            hitTestResult.values.add($this$hitNear_u2dFh5PU_I);
            MutableLongList mutableLongList = hitTestResult.distanceFromEdgeAndFlags;
            DistanceAndFlags = HitTestResultKt.DistanceAndFlags(distanceFromEdge, isInLayer, false);
            mutableLongList.add(DistanceAndFlags);
            m5896nextUntilhw7D004 = NodeCoordinatorKt.m5896nextUntilhw7D004($this$hitNear_u2dFh5PU_I, hitTestSource.mo5894entityTypeOLwlOKw(), NodeKind.m5898constructorimpl(2));
            m5873outOfBoundsHit8NAm7pk(m5896nextUntilhw7D004, hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer, distanceFromEdge, true);
            hitTestResult.hitDepth = startDepth$iv$iv;
            return;
        }
        mo5803hitTestChildqzLsGqo(hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer);
    }

    /* renamed from: speculativeHit-Fh5PU_I */
    private final void m5875speculativeHitFh5PU_I(final Modifier.Node $this$speculativeHit_u2dFh5PU_I, final HitTestSource hitTestSource, final long pointerPosition, final HitTestResult hitTestResult, final int pointerType, final boolean isInLayer, final float distanceFromEdge) {
        Modifier.Node m5896nextUntilhw7D004;
        if ($this$speculativeHit_u2dFh5PU_I == null) {
            mo5803hitTestChildqzLsGqo(hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer);
        } else if (!hitTestSource.interceptOutOfBoundsChildEvents($this$speculativeHit_u2dFh5PU_I)) {
            m5896nextUntilhw7D004 = NodeCoordinatorKt.m5896nextUntilhw7D004($this$speculativeHit_u2dFh5PU_I, hitTestSource.mo5894entityTypeOLwlOKw(), NodeKind.m5898constructorimpl(2));
            m5873outOfBoundsHit8NAm7pk(m5896nextUntilhw7D004, hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer, distanceFromEdge, false);
        } else {
            hitTestResult.speculativeHit($this$speculativeHit_u2dFh5PU_I, distanceFromEdge, isInLayer, new Function0<Unit>() { // from class: androidx.compose.ui.node.NodeCoordinator$speculativeHit$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(0);
                }

                @Override // kotlin.jvm.functions.Function0
                public /* bridge */ /* synthetic */ Unit invoke() {
                    invoke2();
                    return Unit.INSTANCE;
                }

                /* renamed from: invoke  reason: avoid collision after fix types in other method */
                public final void invoke2() {
                    Modifier.Node m5896nextUntilhw7D0042;
                    NodeCoordinator nodeCoordinator = NodeCoordinator.this;
                    m5896nextUntilhw7D0042 = NodeCoordinatorKt.m5896nextUntilhw7D004($this$speculativeHit_u2dFh5PU_I, hitTestSource.mo5894entityTypeOLwlOKw(), NodeKind.m5898constructorimpl(2));
                    nodeCoordinator.m5873outOfBoundsHit8NAm7pk(m5896nextUntilhw7D0042, hitTestSource, pointerPosition, hitTestResult, pointerType, isInLayer, distanceFromEdge, false);
                }
            });
        }
    }

    /* renamed from: isInExpandedTouchBounds-ThD-n1k */
    private final boolean m5871isInExpandedTouchBoundsThDn1k(Modifier.Node $this$isInExpandedTouchBounds_u2dThD_u2dn1k, long pointerPosition, int pointerType) {
        MutableVector mutableVector;
        if ($this$isInExpandedTouchBounds_u2dThD_u2dn1k == null) {
            return false;
        }
        if (PointerType.m5583equalsimpl0(pointerType, PointerType.Companion.m5589getStylusT8wyACA()) || PointerType.m5583equalsimpl0(pointerType, PointerType.Companion.m5587getEraserT8wyACA())) {
            int kind$iv = NodeKind.m5898constructorimpl(16);
            MutableVector mutableVector2 = null;
            Modifier.Node node = $this$isInExpandedTouchBounds_u2dThD_u2dn1k;
            while (node != null) {
                int i = 1;
                if (node instanceof PointerInputModifierNode) {
                    PointerInputModifierNode it = (PointerInputModifierNode) node;
                    long expansion = it.mo1442getTouchBoundsExpansionRZrCHBk();
                    int bits$iv$iv$iv = (int) (pointerPosition >> 32);
                    if (Float.intBitsToFloat(bits$iv$iv$iv) >= (-TouchBoundsExpansion.m5978computeLeftimpl$ui_release(expansion, getLayoutDirection()))) {
                        int bits$iv$iv$iv2 = (int) (pointerPosition >> 32);
                        if (Float.intBitsToFloat(bits$iv$iv$iv2) < getMeasuredWidth() + TouchBoundsExpansion.m5979computeRightimpl$ui_release(expansion, getLayoutDirection())) {
                            int bits$iv$iv$iv3 = (int) (pointerPosition & 4294967295L);
                            if (Float.intBitsToFloat(bits$iv$iv$iv3) >= (-TouchBoundsExpansion.m5986getTopimpl(expansion))) {
                                int bits$iv$iv$iv4 = (int) (pointerPosition & 4294967295L);
                                if (Float.intBitsToFloat(bits$iv$iv$iv4) < getMeasuredHeight() + TouchBoundsExpansion.m5983getBottomimpl(expansion)) {
                                    return true;
                                }
                            }
                        }
                    }
                    return false;
                }
                int kind$iv2 = kind$iv;
                Modifier.Node this_$iv$iv = node;
                Modifier.Node this_$iv$iv2 = (this_$iv$iv.getKindSet$ui_release() & kind$iv2) != 0 ? 1 : null;
                if (this_$iv$iv2 != null && (node instanceof DelegatingNode)) {
                    int count$iv = 0;
                    DelegatingNode this_$iv$iv3 = (DelegatingNode) node;
                    Modifier.Node node$iv$iv = this_$iv$iv3.getDelegate$ui_release();
                    while (node$iv$iv != null) {
                        Modifier.Node next$iv = node$iv$iv;
                        if (((next$iv.getKindSet$ui_release() & kind$iv2) != 0 ? i : 0) != 0) {
                            count$iv++;
                            if (count$iv == i) {
                                node = next$iv;
                            } else {
                                if (mutableVector2 != null) {
                                    mutableVector = mutableVector2;
                                } else {
                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                }
                                mutableVector2 = mutableVector;
                                Modifier.Node theNode$iv = node;
                                if (theNode$iv != null) {
                                    if (mutableVector2 != null) {
                                        mutableVector2.add(theNode$iv);
                                    }
                                    node = null;
                                }
                                if (mutableVector2 != null) {
                                    mutableVector2.add(next$iv);
                                }
                            }
                        }
                        node$iv$iv = node$iv$iv.getChild$ui_release();
                        i = 1;
                    }
                    if (count$iv == 1) {
                        kind$iv = kind$iv2;
                    }
                }
                node = DelegatableNodeKt.pop(mutableVector2);
                kind$iv = kind$iv2;
            }
            return false;
        }
        return false;
    }

    /* renamed from: hitTestChild-qzLsGqo */
    public void mo5803hitTestChildqzLsGqo(HitTestSource hitTestSource, long pointerPosition, HitTestResult hitTestResult, int pointerType, boolean isInLayer) {
        NodeCoordinator wrapped = this.wrapped;
        if (wrapped != null) {
            long positionInWrapped = m5867fromParentPosition8S9VItk$default(wrapped, pointerPosition, false, 2, null);
            wrapped.m5885hitTestqzLsGqo(hitTestSource, positionInWrapped, hitTestResult, pointerType, isInLayer);
        }
    }

    public final Rect touchBoundsInRoot() {
        if (!isAttached()) {
            return Rect.Companion.getZero();
        }
        LayoutCoordinates root = LayoutCoordinatesKt.findRootCoordinates(this);
        MutableRect bounds = getRectCache();
        long padding = m5879calculateMinimumTouchTargetPaddingE7KxVPU(m5883getMinimumTouchTargetSizeNHjbRc());
        int bits$iv$iv$iv = (int) (padding >> 32);
        bounds.setLeft(-Float.intBitsToFloat(bits$iv$iv$iv));
        int bits$iv$iv$iv2 = (int) (padding & 4294967295L);
        bounds.setTop(-Float.intBitsToFloat(bits$iv$iv$iv2));
        int bits$iv$iv$iv3 = (int) (padding >> 32);
        bounds.setRight(getMeasuredWidth() + Float.intBitsToFloat(bits$iv$iv$iv3));
        int bits$iv$iv$iv4 = (int) (4294967295L & padding);
        bounds.setBottom(getMeasuredHeight() + Float.intBitsToFloat(bits$iv$iv$iv4));
        NodeCoordinator coordinator = this;
        while (coordinator != root) {
            coordinator.rectInParent$ui_release(bounds, false, true);
            if (bounds.isEmpty()) {
                return Rect.Companion.getZero();
            }
            NodeCoordinator nodeCoordinator = coordinator.wrappedBy;
            Intrinsics.checkNotNull(nodeCoordinator);
            coordinator = nodeCoordinator;
        }
        return MutableRectKt.toRect(bounds);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: screenToLocal-MK-Hz9U */
    public long mo5651screenToLocalMKHz9U(long relativeToScreen) {
        boolean value$iv = isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException(ExpectAttachedLayoutCoordinates);
        }
        Owner owner = LayoutNodeKt.requireOwner(getLayoutNode());
        long positionInRoot = owner.mo5593screenToLocalMKHz9U(relativeToScreen);
        LayoutCoordinates root = LayoutCoordinatesKt.findRootCoordinates(this);
        return mo5646localPositionOfR5De75A(root, positionInRoot);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: localToScreen-MK-Hz9U */
    public long mo5649localToScreenMKHz9U(long relativeToLocal) {
        boolean value$iv = isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException(ExpectAttachedLayoutCoordinates);
        }
        long positionInRoot = mo5648localToRootMKHz9U(relativeToLocal);
        Owner owner = LayoutNodeKt.requireOwner(getLayoutNode());
        return owner.mo5592localToScreenMKHz9U(positionInRoot);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: windowToLocal-MK-Hz9U */
    public long mo5654windowToLocalMKHz9U(long relativeToWindow) {
        boolean value$iv = isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException(ExpectAttachedLayoutCoordinates);
        }
        LayoutCoordinates root = LayoutCoordinatesKt.findRootCoordinates(this);
        long positionInRoot = Offset.m4052minusMKHz9U(LayoutNodeKt.requireOwner(getLayoutNode()).mo5956calculateLocalPositionMKHz9U(relativeToWindow), LayoutCoordinatesKt.positionInRoot(root));
        return mo5646localPositionOfR5De75A(root, positionInRoot);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: localToWindow-MK-Hz9U */
    public long mo5650localToWindowMKHz9U(long relativeToLocal) {
        long positionInRoot = mo5648localToRootMKHz9U(relativeToLocal);
        Owner owner = LayoutNodeKt.requireOwner(getLayoutNode());
        return owner.mo5957calculatePositionInWindowMKHz9U(positionInRoot);
    }

    private final NodeCoordinator toCoordinator(LayoutCoordinates $this$toCoordinator) {
        NodeCoordinator coordinator;
        LookaheadLayoutCoordinates lookaheadLayoutCoordinates = $this$toCoordinator instanceof LookaheadLayoutCoordinates ? (LookaheadLayoutCoordinates) $this$toCoordinator : null;
        if (lookaheadLayoutCoordinates == null || (coordinator = lookaheadLayoutCoordinates.getCoordinator()) == null) {
            Intrinsics.checkNotNull($this$toCoordinator, "null cannot be cast to non-null type androidx.compose.ui.node.NodeCoordinator");
            return (NodeCoordinator) $this$toCoordinator;
        }
        return coordinator;
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: localPositionOf-R5De75A */
    public long mo5646localPositionOfR5De75A(LayoutCoordinates sourceCoordinates, long relativeToSource) {
        return mo5647localPositionOfS_NoaFU(sourceCoordinates, relativeToSource, true);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: localPositionOf-S_NoaFU */
    public long mo5647localPositionOfS_NoaFU(LayoutCoordinates sourceCoordinates, long relativeToSource, boolean includeMotionFrameOfReference) {
        if (sourceCoordinates instanceof LookaheadLayoutCoordinates) {
            ((LookaheadLayoutCoordinates) sourceCoordinates).getCoordinator().onCoordinatesUsed$ui_release();
            long arg0$iv = sourceCoordinates.mo5647localPositionOfS_NoaFU(this, Offset.m4040constructorimpl(relativeToSource ^ (-9223372034707292160L)), includeMotionFrameOfReference);
            return Offset.m4040constructorimpl((-9223372034707292160L) ^ arg0$iv);
        }
        NodeCoordinator nodeCoordinator = toCoordinator(sourceCoordinates);
        nodeCoordinator.onCoordinatesUsed$ui_release();
        NodeCoordinator commonAncestor = findCommonAncestor$ui_release(nodeCoordinator);
        long position = relativeToSource;
        NodeCoordinator coordinator = nodeCoordinator;
        while (coordinator != commonAncestor) {
            position = coordinator.m5890toParentPosition8S9VItk(position, includeMotionFrameOfReference);
            NodeCoordinator nodeCoordinator2 = coordinator.wrappedBy;
            Intrinsics.checkNotNull(nodeCoordinator2);
            coordinator = nodeCoordinator2;
        }
        return m5866ancestorToLocalS_NoaFU(commonAncestor, position, includeMotionFrameOfReference);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: transformFrom-EL8BTi8 */
    public void mo5652transformFromEL8BTi8(LayoutCoordinates sourceCoordinates, float[] matrix) {
        NodeCoordinator coordinator = toCoordinator(sourceCoordinates);
        coordinator.onCoordinatesUsed$ui_release();
        NodeCoordinator commonAncestor = findCommonAncestor$ui_release(coordinator);
        Matrix.m4528resetimpl(matrix);
        coordinator.m5878transformToAncestorEL8BTi8(commonAncestor, matrix);
        m5877transformFromAncestorEL8BTi8(commonAncestor, matrix);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: transformToScreen-58bKbWc */
    public void mo5653transformToScreen58bKbWc(float[] matrix) {
        Owner owner = LayoutNodeKt.requireOwner(getLayoutNode());
        NodeCoordinator rootCoordinator = toCoordinator(LayoutCoordinatesKt.findRootCoordinates(this));
        m5878transformToAncestorEL8BTi8(rootCoordinator, matrix);
        if (owner instanceof MatrixPositionCalculator) {
            ((MatrixPositionCalculator) owner).mo5441localToScreen58bKbWc(matrix);
            return;
        }
        long screenPosition = LayoutCoordinatesKt.positionOnScreen(rootCoordinator);
        if (!((9223372034707292159L & screenPosition) != androidx.compose.ui.geometry.InlineClassHelperKt.UnspecifiedPackedFloats)) {
            return;
        }
        int bits$iv$iv$iv = (int) (screenPosition >> 32);
        int bits$iv$iv$iv2 = (int) (4294967295L & screenPosition);
        Matrix.m4540translateimpl(matrix, Float.intBitsToFloat(bits$iv$iv$iv), Float.intBitsToFloat(bits$iv$iv$iv2), 0.0f);
    }

    /* renamed from: transformToAncestor-EL8BTi8 */
    private final void m5878transformToAncestorEL8BTi8(NodeCoordinator ancestor, float[] matrix) {
        NodeCoordinator wrapper = this;
        while (!Intrinsics.areEqual(wrapper, ancestor)) {
            OwnedLayer ownedLayer = wrapper.layer;
            if (ownedLayer != null) {
                ownedLayer.mo5955transform58bKbWc(matrix);
            }
            long position = wrapper.mo5832getPositionnOccac();
            if (!IntOffset.m7000equalsimpl0(position, IntOffset.Companion.m7012getZeronOccac())) {
                Matrix.m4528resetimpl(tmpMatrix);
                Matrix.m4541translateimpl$default(tmpMatrix, IntOffset.m7001getXimpl(position), IntOffset.m7002getYimpl(position), 0.0f, 4, null);
                Matrix.m4538timesAssign58bKbWc(matrix, tmpMatrix);
            }
            NodeCoordinator nodeCoordinator = wrapper.wrappedBy;
            Intrinsics.checkNotNull(nodeCoordinator);
            wrapper = nodeCoordinator;
        }
    }

    /* renamed from: transformFromAncestor-EL8BTi8 */
    private final void m5877transformFromAncestorEL8BTi8(NodeCoordinator ancestor, float[] matrix) {
        if (!Intrinsics.areEqual(ancestor, this)) {
            NodeCoordinator nodeCoordinator = this.wrappedBy;
            Intrinsics.checkNotNull(nodeCoordinator);
            nodeCoordinator.m5877transformFromAncestorEL8BTi8(ancestor, matrix);
            if (!IntOffset.m7000equalsimpl0(mo5832getPositionnOccac(), IntOffset.Companion.m7012getZeronOccac())) {
                Matrix.m4528resetimpl(tmpMatrix);
                Matrix.m4541translateimpl$default(tmpMatrix, -IntOffset.m7001getXimpl(mo5832getPositionnOccac()), -IntOffset.m7002getYimpl(mo5832getPositionnOccac()), 0.0f, 4, null);
                Matrix.m4538timesAssign58bKbWc(matrix, tmpMatrix);
            }
            OwnedLayer ownedLayer = this.layer;
            if (ownedLayer != null) {
                ownedLayer.mo5950inverseTransform58bKbWc(matrix);
            }
        }
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    public Rect localBoundingBoxOf(LayoutCoordinates sourceCoordinates, boolean clipBounds) {
        boolean value$iv = isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException(ExpectAttachedLayoutCoordinates);
        }
        boolean value$iv2 = sourceCoordinates.isAttached();
        if (!value$iv2) {
            InlineClassHelperKt.throwIllegalStateException("LayoutCoordinates " + sourceCoordinates + " is not attached!");
        }
        NodeCoordinator srcCoordinator = toCoordinator(sourceCoordinates);
        srcCoordinator.onCoordinatesUsed$ui_release();
        NodeCoordinator commonAncestor = findCommonAncestor$ui_release(srcCoordinator);
        MutableRect bounds = getRectCache();
        bounds.setLeft(0.0f);
        bounds.setTop(0.0f);
        long arg0$iv = sourceCoordinates.mo5645getSizeYbymL2g();
        bounds.setRight((int) (arg0$iv >> 32));
        long arg0$iv2 = sourceCoordinates.mo5645getSizeYbymL2g();
        bounds.setBottom((int) (4294967295L & arg0$iv2));
        NodeCoordinator coordinator = srcCoordinator;
        while (coordinator != commonAncestor) {
            boolean clipBounds2 = clipBounds;
            rectInParent$ui_release$default(coordinator, bounds, clipBounds2, false, 4, null);
            if (bounds.isEmpty()) {
                return Rect.Companion.getZero();
            }
            NodeCoordinator nodeCoordinator = coordinator.wrappedBy;
            Intrinsics.checkNotNull(nodeCoordinator);
            coordinator = nodeCoordinator;
            clipBounds = clipBounds2;
        }
        ancestorToLocal(commonAncestor, bounds, clipBounds);
        return MutableRectKt.toRect(bounds);
    }

    /* renamed from: ancestorToLocal-S_NoaFU */
    private final long m5866ancestorToLocalS_NoaFU(NodeCoordinator ancestor, long offset, boolean includeMotionFrameOfReference) {
        if (ancestor == this) {
            return offset;
        }
        NodeCoordinator wrappedBy = this.wrappedBy;
        if (wrappedBy == null || Intrinsics.areEqual(ancestor, wrappedBy)) {
            return m5881fromParentPosition8S9VItk(offset, includeMotionFrameOfReference);
        }
        return m5881fromParentPosition8S9VItk(wrappedBy.m5866ancestorToLocalS_NoaFU(ancestor, offset, includeMotionFrameOfReference), includeMotionFrameOfReference);
    }

    private final void ancestorToLocal(NodeCoordinator ancestor, MutableRect rect, boolean clipBounds) {
        if (ancestor == this) {
            return;
        }
        NodeCoordinator nodeCoordinator = this.wrappedBy;
        if (nodeCoordinator != null) {
            nodeCoordinator.ancestorToLocal(ancestor, rect, clipBounds);
        }
        fromParentRect(rect, clipBounds);
    }

    @Override // androidx.compose.ui.layout.LayoutCoordinates
    /* renamed from: localToRoot-MK-Hz9U */
    public long mo5648localToRootMKHz9U(long relativeToLocal) {
        boolean value$iv = isAttached();
        if (!value$iv) {
            InlineClassHelperKt.throwIllegalStateException(ExpectAttachedLayoutCoordinates);
        }
        onCoordinatesUsed$ui_release();
        long position = relativeToLocal;
        for (NodeCoordinator coordinator = this; coordinator != null; coordinator = coordinator.wrappedBy) {
            position = m5876toParentPosition8S9VItk$default(coordinator, position, false, 2, null);
        }
        return position;
    }

    protected final void withPositionTranslation(Canvas canvas, Function1<? super Canvas, Unit> function1) {
        float x = IntOffset.m7001getXimpl(mo5832getPositionnOccac());
        float y = IntOffset.m7002getYimpl(mo5832getPositionnOccac());
        canvas.translate(x, y);
        function1.invoke(canvas);
        canvas.translate(-x, -y);
    }

    /* renamed from: toParentPosition-8S9VItk$default */
    public static /* synthetic */ long m5876toParentPosition8S9VItk$default(NodeCoordinator nodeCoordinator, long j, boolean z, int i, Object obj) {
        if (obj == null) {
            if ((i & 2) != 0) {
                z = true;
            }
            return nodeCoordinator.m5890toParentPosition8S9VItk(j, z);
        }
        throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: toParentPosition-8S9VItk");
    }

    /* renamed from: toParentPosition-8S9VItk */
    public long m5890toParentPosition8S9VItk(long position, boolean includeMotionFrameOfReference) {
        OwnedLayer layer = this.layer;
        long targetPosition = layer != null ? layer.mo5952mapOffset8S9VItk(position, false) : position;
        if (!includeMotionFrameOfReference && isPlacedUnderMotionFrameOfReference()) {
            return targetPosition;
        }
        return IntOffsetKt.m7016plusNvtHpc(targetPosition, mo5832getPositionnOccac());
    }

    /* renamed from: fromParentPosition-8S9VItk$default */
    public static /* synthetic */ long m5867fromParentPosition8S9VItk$default(NodeCoordinator nodeCoordinator, long j, boolean z, int i, Object obj) {
        if (obj == null) {
            if ((i & 2) != 0) {
                z = true;
            }
            return nodeCoordinator.m5881fromParentPosition8S9VItk(j, z);
        }
        throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: fromParentPosition-8S9VItk");
    }

    /* renamed from: fromParentPosition-8S9VItk */
    public long m5881fromParentPosition8S9VItk(long position, boolean includeMotionFrameOfReference) {
        long relativeToPosition;
        if (!includeMotionFrameOfReference && isPlacedUnderMotionFrameOfReference()) {
            relativeToPosition = position;
        } else {
            relativeToPosition = IntOffsetKt.m7014minusNvtHpc(position, mo5832getPositionnOccac());
        }
        OwnedLayer layer = this.layer;
        return layer != null ? layer.mo5952mapOffset8S9VItk(relativeToPosition, true) : relativeToPosition;
    }

    public final void drawBorder(Canvas canvas, Paint paint) {
        long arg0$iv = m5696getMeasuredSizeYbymL2g();
        long arg0$iv2 = m5696getMeasuredSizeYbymL2g();
        int $i$f$unpackInt2 = (int) (4294967295L & arg0$iv2);
        canvas.drawRect(0.5f, 0.5f, ((int) (arg0$iv >> 32)) - 0.5f, $i$f$unpackInt2 - 0.5f, paint);
    }

    public final void onLayoutNodeAttach() {
        updateLayerBlock(this.layerBlock, true);
        OwnedLayer ownedLayer = this.layer;
        if (ownedLayer != null) {
            ownedLayer.invalidate();
        }
    }

    public final void onRelease() {
        this.released = true;
        this.invalidateParentLayer.invoke();
        releaseLayer();
    }

    public static /* synthetic */ void rectInParent$ui_release$default(NodeCoordinator nodeCoordinator, MutableRect mutableRect, boolean z, boolean z2, int i, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: rectInParent");
        }
        if ((i & 4) != 0) {
            z2 = false;
        }
        nodeCoordinator.rectInParent$ui_release(mutableRect, z, z2);
    }

    public final void rectInParent$ui_release(MutableRect bounds, boolean clipBounds, boolean clipToMinimumTouchTargetSize) {
        OwnedLayer layer = this.layer;
        if (layer != null) {
            if (this.isClipping) {
                if (clipToMinimumTouchTargetSize) {
                    long minTouch = m5883getMinimumTouchTargetSizeNHjbRc();
                    int bits$iv$iv$iv = (int) (minTouch >> 32);
                    float horz = Float.intBitsToFloat(bits$iv$iv$iv) / 2.0f;
                    int bits$iv$iv$iv2 = (int) (minTouch & 4294967295L);
                    float vert = Float.intBitsToFloat(bits$iv$iv$iv2) / 2.0f;
                    long arg0$iv = mo5645getSizeYbymL2g();
                    long arg0$iv2 = mo5645getSizeYbymL2g();
                    bounds.intersect(-horz, -vert, ((int) (arg0$iv >> 32)) + horz, ((int) (arg0$iv2 & 4294967295L)) + vert);
                } else if (clipBounds) {
                    long arg0$iv3 = mo5645getSizeYbymL2g();
                    long arg0$iv4 = mo5645getSizeYbymL2g();
                    bounds.intersect(0.0f, 0.0f, (int) (arg0$iv3 >> 32), (int) (arg0$iv4 & 4294967295L));
                }
                if (bounds.isEmpty()) {
                    return;
                }
            }
            layer.mapBounds(bounds, false);
        }
        int x = IntOffset.m7001getXimpl(mo5832getPositionnOccac());
        bounds.setLeft(bounds.getLeft() + x);
        bounds.setRight(bounds.getRight() + x);
        int y = IntOffset.m7002getYimpl(mo5832getPositionnOccac());
        bounds.setTop(bounds.getTop() + y);
        bounds.setBottom(bounds.getBottom() + y);
    }

    private final void fromParentRect(MutableRect bounds, boolean clipBounds) {
        int x = IntOffset.m7001getXimpl(mo5832getPositionnOccac());
        bounds.setLeft(bounds.getLeft() - x);
        bounds.setRight(bounds.getRight() - x);
        int y = IntOffset.m7002getYimpl(mo5832getPositionnOccac());
        bounds.setTop(bounds.getTop() - y);
        bounds.setBottom(bounds.getBottom() - y);
        OwnedLayer layer = this.layer;
        if (layer != null) {
            layer.mapBounds(bounds, true);
            if (this.isClipping && clipBounds) {
                long arg0$iv = mo5645getSizeYbymL2g();
                long arg0$iv2 = mo5645getSizeYbymL2g();
                bounds.intersect(0.0f, 0.0f, (int) (arg0$iv >> 32), (int) (4294967295L & arg0$iv2));
                if (bounds.isEmpty()) {
                }
            }
        }
    }

    /* renamed from: withinLayerBounds-k-4lQ0M */
    public final boolean m5892withinLayerBoundsk4lQ0M(long pointerPosition) {
        long v$iv = androidx.compose.ui.geometry.InlineClassHelperKt.DualFloatInfinityBase ^ (pointerPosition & androidx.compose.ui.geometry.InlineClassHelperKt.DualFloatInfinityBase);
        if (((v$iv - androidx.compose.ui.geometry.InlineClassHelperKt.Uint64Low32) & (-9223372034707292160L)) == 0) {
            OwnedLayer layer = this.layer;
            return layer == null || !this.isClipping || layer.mo5951isInLayerk4lQ0M(pointerPosition);
        }
        return false;
    }

    /* renamed from: isPointerInBounds-k-4lQ0M */
    protected final boolean m5886isPointerInBoundsk4lQ0M(long pointerPosition) {
        int bits$iv$iv$iv = (int) (pointerPosition >> 32);
        float x = Float.intBitsToFloat(bits$iv$iv$iv);
        int bits$iv$iv$iv2 = (int) (4294967295L & pointerPosition);
        float y = Float.intBitsToFloat(bits$iv$iv$iv2);
        return x >= 0.0f && y >= 0.0f && x < ((float) getMeasuredWidth()) && y < ((float) getMeasuredHeight());
    }

    public void invalidateLayer() {
        OwnedLayer layer = this.layer;
        if (layer != null) {
            layer.invalidate();
            return;
        }
        NodeCoordinator nodeCoordinator = this.wrappedBy;
        if (nodeCoordinator != null) {
            nodeCoordinator.invalidateLayer();
        }
    }

    public void onLayoutModifierNodeChanged() {
        OwnedLayer ownedLayer = this.layer;
        if (ownedLayer != null) {
            ownedLayer.invalidate();
        }
    }

    public final NodeCoordinator findCommonAncestor$ui_release(NodeCoordinator other) {
        LayoutNode ancestor1 = other.getLayoutNode();
        LayoutNode ancestor2 = getLayoutNode();
        if (ancestor1 == ancestor2) {
            Modifier.Node otherNode = other.getTail();
            DelegatableNode $this$visitLocalAncestors$iv = getTail();
            int m5898constructorimpl = NodeKind.m5898constructorimpl(2);
            boolean value$iv$iv = $this$visitLocalAncestors$iv.getNode().isAttached();
            if (!value$iv$iv) {
                InlineClassHelperKt.throwIllegalStateException("visitLocalAncestors called on an unattached node");
            }
            for (Modifier.Node next$iv = $this$visitLocalAncestors$iv.getNode().getParent$ui_release(); next$iv != null; next$iv = next$iv.getParent$ui_release()) {
                if ((next$iv.getKindSet$ui_release() & m5898constructorimpl) != 0) {
                    Modifier.Node it = next$iv;
                    if (it == otherNode) {
                        return other;
                    }
                }
            }
            return this;
        }
        while (ancestor1.getDepth$ui_release() > ancestor2.getDepth$ui_release()) {
            LayoutNode parent$ui_release = ancestor1.getParent$ui_release();
            Intrinsics.checkNotNull(parent$ui_release);
            ancestor1 = parent$ui_release;
        }
        while (ancestor2.getDepth$ui_release() > ancestor1.getDepth$ui_release()) {
            LayoutNode parent$ui_release2 = ancestor2.getParent$ui_release();
            Intrinsics.checkNotNull(parent$ui_release2);
            ancestor2 = parent$ui_release2;
        }
        while (ancestor1 != ancestor2) {
            LayoutNode parent1 = ancestor1.getParent$ui_release();
            LayoutNode parent2 = ancestor2.getParent$ui_release();
            if (parent1 == null || parent2 == null) {
                throw new IllegalArgumentException("layouts are not part of the same hierarchy");
            }
            ancestor1 = parent1;
            ancestor2 = parent2;
        }
        return ancestor2 == getLayoutNode() ? this : ancestor1 == other.getLayoutNode() ? other : ancestor1.getInnerCoordinator$ui_release();
    }

    public final boolean shouldSharePointerInputWithSiblings() {
        int type$iv;
        int type$iv2;
        int count$iv$iv;
        MutableVector mutableVector;
        Modifier.Node start = headNode(NodeKindKt.m5907getIncludeSelfInTraversalH91voCI(NodeKind.m5898constructorimpl(16)));
        if (start != null && start.isAttached()) {
            Modifier.Node $this$visitSelfAndLocalDescendants_u2d6rFNWt0$iv = start;
            int type$iv3 = NodeKind.m5898constructorimpl(16);
            boolean value$iv$iv$iv = $this$visitSelfAndLocalDescendants_u2d6rFNWt0$iv.getNode().isAttached();
            if (!value$iv$iv$iv) {
                InlineClassHelperKt.throwIllegalStateException("visitLocalDescendants called on an unattached node");
            }
            Modifier.Node self$iv$iv = $this$visitSelfAndLocalDescendants_u2d6rFNWt0$iv.getNode();
            if ((self$iv$iv.getAggregateChildKindSet$ui_release() & type$iv3) == 0) {
                return false;
            }
            Modifier.Node next$iv$iv = self$iv$iv;
            while (next$iv$iv != null) {
                if ((next$iv$iv.getKindSet$ui_release() & type$iv3) != 0) {
                    Modifier.Node it$iv = next$iv$iv;
                    MutableVector mutableVector2 = null;
                    Modifier.Node node = it$iv;
                    while (node != null) {
                        Modifier.Node start2 = start;
                        if (node instanceof PointerInputModifierNode) {
                            PointerInputModifierNode it = (PointerInputModifierNode) node;
                            if (it.sharePointerInputWithSiblings()) {
                                return true;
                            }
                            type$iv = type$iv3;
                        } else {
                            Modifier.Node this_$iv$iv$iv = node;
                            Modifier.Node this_$iv$iv$iv2 = (this_$iv$iv$iv.getKindSet$ui_release() & type$iv3) != 0 ? 1 : null;
                            if (this_$iv$iv$iv2 == null || !(node instanceof DelegatingNode)) {
                                type$iv = type$iv3;
                            } else {
                                int count$iv$iv2 = 0;
                                DelegatingNode this_$iv$iv$iv3 = (DelegatingNode) node;
                                Modifier.Node node$iv$iv$iv = this_$iv$iv$iv3.getDelegate$ui_release();
                                while (node$iv$iv$iv != null) {
                                    Modifier.Node next$iv$iv2 = node$iv$iv$iv;
                                    if (!((next$iv$iv2.getKindSet$ui_release() & type$iv3) != 0)) {
                                        type$iv2 = type$iv3;
                                    } else {
                                        count$iv$iv2++;
                                        type$iv2 = type$iv3;
                                        if (count$iv$iv2 == 1) {
                                            node = next$iv$iv2;
                                        } else {
                                            if (mutableVector2 != null) {
                                                count$iv$iv = count$iv$iv2;
                                                mutableVector = mutableVector2;
                                            } else {
                                                count$iv$iv = count$iv$iv2;
                                                mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                            }
                                            Modifier.Node theNode$iv$iv = node;
                                            if (theNode$iv$iv != null) {
                                                if (mutableVector != null) {
                                                    mutableVector.add(theNode$iv$iv);
                                                }
                                                node = null;
                                            }
                                            if (mutableVector != null) {
                                                mutableVector.add(next$iv$iv2);
                                            }
                                            mutableVector2 = mutableVector;
                                            count$iv$iv2 = count$iv$iv;
                                        }
                                    }
                                    node$iv$iv$iv = node$iv$iv$iv.getChild$ui_release();
                                    type$iv3 = type$iv2;
                                }
                                type$iv = type$iv3;
                                if (count$iv$iv2 == 1) {
                                    start = start2;
                                    type$iv3 = type$iv;
                                }
                            }
                        }
                        node = DelegatableNodeKt.pop(mutableVector2);
                        start = start2;
                        type$iv3 = type$iv;
                    }
                    continue;
                }
                next$iv$iv = next$iv$iv.getChild$ui_release();
                start = start;
                type$iv3 = type$iv3;
            }
            return false;
        }
        return false;
    }

    /* renamed from: offsetFromEdge-MK-Hz9U */
    private final long m5872offsetFromEdgeMKHz9U(long pointerPosition) {
        int bits$iv$iv$iv = (int) (pointerPosition >> 32);
        float x = Float.intBitsToFloat(bits$iv$iv$iv);
        float horizontal = Math.max(0.0f, x < 0.0f ? -x : x - getMeasuredWidth());
        int bits$iv$iv$iv2 = (int) (pointerPosition & 4294967295L);
        float y = Float.intBitsToFloat(bits$iv$iv$iv2);
        float vertical = Math.max(0.0f, y < 0.0f ? -y : y - getMeasuredHeight());
        long v1$iv$iv = Float.floatToRawIntBits(horizontal);
        long v2$iv$iv = Float.floatToRawIntBits(vertical);
        return Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }

    /* renamed from: calculateMinimumTouchTargetPadding-E7KxVPU */
    protected final long m5879calculateMinimumTouchTargetPaddingE7KxVPU(long minimumTouchTargetSize) {
        int bits$iv$iv$iv = (int) (minimumTouchTargetSize >> 32);
        float widthDiff = Float.intBitsToFloat(bits$iv$iv$iv) - getMeasuredWidth();
        int bits$iv$iv$iv2 = (int) (minimumTouchTargetSize & 4294967295L);
        float heightDiff = Float.intBitsToFloat(bits$iv$iv$iv2) - getMeasuredHeight();
        float width$iv = Math.max(0.0f, widthDiff / 2.0f);
        float height$iv = Math.max(0.0f, heightDiff / 2.0f);
        long v1$iv$iv = Float.floatToRawIntBits(width$iv);
        long v2$iv$iv = Float.floatToRawIntBits(height$iv);
        return Size.m4108constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }

    /* renamed from: distanceInMinimumTouchTarget-tz77jQw */
    public final float m5880distanceInMinimumTouchTargettz77jQw(long pointerPosition, long minimumTouchTargetSize) {
        int bits$iv$iv$iv = (int) (minimumTouchTargetSize >> 32);
        if (getMeasuredWidth() >= Float.intBitsToFloat(bits$iv$iv$iv)) {
            int bits$iv$iv$iv2 = (int) (minimumTouchTargetSize & 4294967295L);
            if (getMeasuredHeight() >= Float.intBitsToFloat(bits$iv$iv$iv2)) {
                return Float.POSITIVE_INFINITY;
            }
        }
        long value$iv$iv$iv = m5879calculateMinimumTouchTargetPaddingE7KxVPU(minimumTouchTargetSize);
        int bits$iv$iv$iv$iv = (int) (value$iv$iv$iv >> 32);
        float width = Float.intBitsToFloat(bits$iv$iv$iv$iv);
        int bits$iv$iv$iv$iv2 = (int) (value$iv$iv$iv & 4294967295L);
        float height = Float.intBitsToFloat(bits$iv$iv$iv$iv2);
        long offsetFromEdge = m5872offsetFromEdgeMKHz9U(pointerPosition);
        if (width > 0.0f || height > 0.0f) {
            int bits$iv$iv$iv3 = (int) (offsetFromEdge >> 32);
            if (Float.intBitsToFloat(bits$iv$iv$iv3) <= width) {
                int bits$iv$iv$iv4 = (int) (offsetFromEdge & 4294967295L);
                if (Float.intBitsToFloat(bits$iv$iv$iv4) <= height) {
                    return Offset.m4047getDistanceSquaredimpl(offsetFromEdge);
                }
            }
        }
        return Float.POSITIVE_INFINITY;
    }

    /* compiled from: NodeCoordinator.kt */
    @Metadata(d1 = {"\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\b\u0080\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002R\u000e\u0010\u0003\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u0011\u0010\u0005\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\t\u001a\u00020\u0006¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\bR\u000e\u0010\u000b\u001a\u00020\u0004X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\f\u001a\u00020\rX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u000e\u001a\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u00110\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u001a\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0010\u0012\u0004\u0012\u00020\u00110\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\u0015\u001a\u00020\u0016X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u0017\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006\u0018"}, d2 = {"Landroidx/compose/ui/node/NodeCoordinator$Companion;", "", "()V", "ExpectAttachedLayoutCoordinates", "", "PointerInputSource", "Landroidx/compose/ui/node/NodeCoordinator$HitTestSource;", "getPointerInputSource", "()Landroidx/compose/ui/node/NodeCoordinator$HitTestSource;", "SemanticsSource", "getSemanticsSource", "UnmeasuredError", "graphicsLayerScope", "Landroidx/compose/ui/graphics/ReusableGraphicsLayerScope;", "onCommitAffectingLayer", "Lkotlin/Function1;", "Landroidx/compose/ui/node/NodeCoordinator;", "", "onCommitAffectingLayerParams", "tmpLayerPositionalProperties", "Landroidx/compose/ui/node/LayerPositionalProperties;", "tmpMatrix", "Landroidx/compose/ui/graphics/Matrix;", "[F", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        public final HitTestSource getPointerInputSource() {
            return NodeCoordinator.PointerInputSource;
        }

        public final HitTestSource getSemanticsSource() {
            return NodeCoordinator.SemanticsSource;
        }
    }
}
