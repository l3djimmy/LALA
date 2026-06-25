package androidx.compose.ui.platform;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Point;
import android.os.Build;
import android.os.SystemClock;
import android.os.Trace;
import android.util.LongSparseArray;
import android.util.SparseArray;
import android.view.FocusFinder;
import android.view.MotionEvent;
import android.view.ScrollCaptureTarget;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewStructure;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.AnimationUtils;
import android.view.autofill.AutofillManager;
import android.view.autofill.AutofillValue;
import android.view.inputmethod.EditorInfo;
import android.view.inputmethod.InputConnection;
import android.view.translation.ViewTranslationRequest;
import android.view.translation.ViewTranslationResponse;
import androidx.autofill.HintConstants;
import androidx.collection.IntObjectMapKt;
import androidx.collection.MutableIntObjectMap;
import androidx.collection.MutableObjectList;
import androidx.compose.runtime.MutableState;
import androidx.compose.runtime.SnapshotStateKt;
import androidx.compose.runtime.State;
import androidx.compose.runtime.collection.MutableVector;
import androidx.compose.runtime.snapshots.Snapshot;
import androidx.compose.ui.ComposeUiFlags;
import androidx.compose.ui.Modifier;
import androidx.compose.ui.SessionMutex;
import androidx.compose.ui.autofill.AndroidAutofill;
import androidx.compose.ui.autofill.AndroidAutofillManager;
import androidx.compose.ui.autofill.AndroidAutofill_androidKt;
import androidx.compose.ui.autofill.Autofill;
import androidx.compose.ui.autofill.AutofillCallback;
import androidx.compose.ui.autofill.AutofillTree;
import androidx.compose.ui.autofill.PlatformAutofillManagerImpl;
import androidx.compose.ui.contentcapture.AndroidContentCaptureManager;
import androidx.compose.ui.draganddrop.AndroidDragAndDropManager;
import androidx.compose.ui.draganddrop.ComposeDragShadowBuilder;
import androidx.compose.ui.draganddrop.DragAndDropTransferData;
import androidx.compose.ui.focus.FocusDirection;
import androidx.compose.ui.focus.FocusInteropUtils_androidKt;
import androidx.compose.ui.focus.FocusOwner;
import androidx.compose.ui.focus.FocusOwnerImpl;
import androidx.compose.ui.focus.FocusOwnerImplKt;
import androidx.compose.ui.focus.FocusTargetNode;
import androidx.compose.ui.geometry.Offset;
import androidx.compose.ui.geometry.Rect;
import androidx.compose.ui.graphics.AndroidGraphicsContext_androidKt;
import androidx.compose.ui.graphics.CanvasHolder;
import androidx.compose.ui.graphics.GraphicsContext;
import androidx.compose.ui.graphics.Matrix;
import androidx.compose.ui.graphics.RectHelper_androidKt;
import androidx.compose.ui.graphics.drawscope.DrawScope;
import androidx.compose.ui.graphics.layer.GraphicsLayer;
import androidx.compose.ui.hapticfeedback.HapticFeedback;
import androidx.compose.ui.hapticfeedback.PlatformHapticFeedback;
import androidx.compose.ui.input.InputMode;
import androidx.compose.ui.input.InputModeManager;
import androidx.compose.ui.input.InputModeManagerImpl;
import androidx.compose.ui.input.key.Key;
import androidx.compose.ui.input.key.KeyEvent;
import androidx.compose.ui.input.key.KeyEventType;
import androidx.compose.ui.input.key.KeyEvent_androidKt;
import androidx.compose.ui.input.key.KeyInputModifierKt;
import androidx.compose.ui.input.pointer.MatrixPositionCalculator;
import androidx.compose.ui.input.pointer.MotionEventAdapter;
import androidx.compose.ui.input.pointer.PointerIcon;
import androidx.compose.ui.input.pointer.PointerIconService;
import androidx.compose.ui.input.pointer.PointerInputEvent;
import androidx.compose.ui.input.pointer.PointerInputEventData;
import androidx.compose.ui.input.pointer.PointerInputEventProcessor;
import androidx.compose.ui.input.pointer.PointerInputEventProcessorKt;
import androidx.compose.ui.input.pointer.PointerKeyboardModifiers;
import androidx.compose.ui.input.pointer.SuspendingPointerInputModifierNode;
import androidx.compose.ui.input.rotary.RotaryInputModifierKt;
import androidx.compose.ui.input.rotary.RotaryScrollEvent;
import androidx.compose.ui.internal.InlineClassHelperKt;
import androidx.compose.ui.layout.Placeable;
import androidx.compose.ui.layout.PlaceableKt;
import androidx.compose.ui.layout.RootMeasurePolicy;
import androidx.compose.ui.modifier.ModifierLocalManager;
import androidx.compose.ui.node.DelegatableNode;
import androidx.compose.ui.node.DelegatableNodeKt;
import androidx.compose.ui.node.DelegatingNode;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.node.LayoutNodeDrawScope;
import androidx.compose.ui.node.MeasureAndLayoutDelegate;
import androidx.compose.ui.node.ModifierNodeElement;
import androidx.compose.ui.node.NodeKind;
import androidx.compose.ui.node.OwnedLayer;
import androidx.compose.ui.node.Owner;
import androidx.compose.ui.node.OwnerSnapshotObserver;
import androidx.compose.ui.node.PointerInputModifierNode;
import androidx.compose.ui.node.RootForTest;
import androidx.compose.ui.platform.AndroidComposeView;
import androidx.compose.ui.scrollcapture.ScrollCapture;
import androidx.compose.ui.semantics.EmptySemanticsElement;
import androidx.compose.ui.semantics.EmptySemanticsModifier;
import androidx.compose.ui.semantics.SemanticsOwner;
import androidx.compose.ui.spatial.RectManager;
import androidx.compose.ui.text.font.Font;
import androidx.compose.ui.text.font.FontFamily;
import androidx.compose.ui.text.font.FontFamilyResolver_androidKt;
import androidx.compose.ui.text.input.TextInputService;
import androidx.compose.ui.text.input.TextInputServiceAndroid;
import androidx.compose.ui.unit.AndroidDensity_androidKt;
import androidx.compose.ui.unit.Constraints;
import androidx.compose.ui.unit.Density;
import androidx.compose.ui.unit.DensityKt;
import androidx.compose.ui.unit.IntOffset;
import androidx.compose.ui.unit.IntOffsetKt;
import androidx.compose.ui.unit.IntSize;
import androidx.compose.ui.unit.LayoutDirection;
import androidx.compose.ui.viewinterop.AndroidViewHolder;
import androidx.core.app.NotificationCompat;
import androidx.core.view.AccessibilityDelegateCompat;
import androidx.core.view.InputDeviceCompat;
import androidx.core.view.ViewCompat;
import androidx.core.view.ViewConfigurationCompat;
import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.ViewTreeLifecycleOwner;
import androidx.savedstate.SavedStateRegistryOwner;
import androidx.savedstate.ViewTreeSavedStateRegistryOwner;
import com.google.android.gms.common.internal.ServiceSpecificExtraArgs;
import com.itextpdf.layout.properties.Property;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;
import kotlin.Deprecated;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.ReplaceWith;
import kotlin.ULong;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.MutablePropertyReference0Impl;
import kotlin.jvm.internal.Ref;
/* compiled from: AndroidComposeView.android.kt */
@Metadata(d1 = {"\u0000Í\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0015\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0011\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b#\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0016\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u001d\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\r\n\u0002\u0018\u0002\n\u0002\b\u0019\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\f*\u00034Õ\u0001\b\u0000\u0018\u0000 ®\u00042\u00020\u00012\u00020\u00022\u00020\u00032\u00020\u00042\u00020\u0005:\u0004®\u0004¯\u0004B\u0015\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\b\u001a\u00020\t¢\u0006\u0002\u0010\nJ\u001b\u0010¯\u0002\u001a\u00020E2\b\u0010\u0096\u0002\u001a\u00030°\u00022\b\u0010±\u0002\u001a\u00030«\u0001J&\u0010²\u0002\u001a\u00020E2\u0007\u0010³\u0002\u001a\u00020V2\b\u0010´\u0002\u001a\u00030µ\u00022\b\u0010¶\u0002\u001a\u00030·\u0002H\u0002J\u0015\u0010¸\u0002\u001a\u00020E2\n\u0010¹\u0002\u001a\u0005\u0018\u00010\u0097\u0002H\u0016J!\u0010¸\u0002\u001a\u00020E2\n\u0010¹\u0002\u001a\u0005\u0018\u00010\u0097\u00022\n\u0010º\u0002\u001a\u0005\u0018\u00010»\u0002H\u0016J\u001e\u0010¸\u0002\u001a\u00020E2\n\u0010¹\u0002\u001a\u0005\u0018\u00010\u0097\u00022\u0007\u0010¼\u0002\u001a\u00020VH\u0016J*\u0010¸\u0002\u001a\u00020E2\n\u0010¹\u0002\u001a\u0005\u0018\u00010\u0097\u00022\u0007\u0010¼\u0002\u001a\u00020V2\n\u0010º\u0002\u001a\u0005\u0018\u00010»\u0002H\u0016J'\u0010¸\u0002\u001a\u00020E2\n\u0010¹\u0002\u001a\u0005\u0018\u00010\u0097\u00022\u0007\u0010½\u0002\u001a\u00020V2\u0007\u0010¾\u0002\u001a\u00020VH\u0016J\u0019\u0010'\u001a\u00020E2\u000f\u0010¿\u0002\u001a\n\u0012\u0005\u0012\u00030Á\u00020À\u0002H\u0016J\t\u0010Â\u0002\u001a\u00020zH\u0002J\u0010\u0010Ã\u0002\u001a\u00020EH\u0086@¢\u0006\u0003\u0010Ä\u0002J\u0010\u0010Å\u0002\u001a\u00020EH\u0086@¢\u0006\u0003\u0010Ä\u0002J \u0010Æ\u0002\u001a\u00030\u0098\u00012\b\u0010Ç\u0002\u001a\u00030\u0098\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\bÈ\u0002\u0010É\u0002J \u0010Ê\u0002\u001a\u00030\u0098\u00012\b\u0010Ë\u0002\u001a\u00030\u0098\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\bÌ\u0002\u0010É\u0002J\u0012\u0010Í\u0002\u001a\u00020z2\u0007\u0010Î\u0002\u001a\u00020VH\u0016J\u0012\u0010Ï\u0002\u001a\u00020z2\u0007\u0010Î\u0002\u001a\u00020VH\u0016J\u0012\u0010Ð\u0002\u001a\u00020E2\u0007\u0010Ñ\u0002\u001a\u00020\u0001H\u0002J\"\u0010Ò\u0002\u001a\u00030Ó\u00022\u0007\u0010Ô\u0002\u001a\u00020VH\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0006\bÕ\u0002\u0010Ö\u0002Jq\u0010×\u0002\u001a\u00020`2B\u0010Ø\u0002\u001a=\u0012\u0017\u0012\u00150Ú\u0002¢\u0006\u000f\bÛ\u0002\u0012\n\bÜ\u0002\u0012\u0005\b\b(Ý\u0002\u0012\u0019\u0012\u0017\u0018\u00010Þ\u0002¢\u0006\u000f\bÛ\u0002\u0012\n\bÜ\u0002\u0012\u0005\b\b(ß\u0002\u0012\u0004\u0012\u00020E0Ù\u00022\r\u0010à\u0002\u001a\b\u0012\u0004\u0012\u00020E0g2\n\u0010á\u0002\u001a\u0005\u0018\u00010Þ\u00022\u0007\u0010â\u0002\u001a\u00020zH\u0016J\t\u0010ã\u0002\u001a\u00020EH\u0016J\u0013\u0010ä\u0002\u001a\u00020E2\b\u0010Ý\u0002\u001a\u00030å\u0002H\u0014J\u0013\u0010æ\u0002\u001a\u00020z2\b\u0010ç\u0002\u001a\u00030Ì\u0001H\u0016J\u0013\u0010è\u0002\u001a\u00020z2\b\u0010é\u0002\u001a\u00030Ì\u0001H\u0016J\u0013\u0010ê\u0002\u001a\u00020z2\b\u0010é\u0002\u001a\u00030ë\u0002H\u0016J\u0013\u0010ì\u0002\u001a\u00020z2\b\u0010é\u0002\u001a\u00030ë\u0002H\u0016J\t\u0010í\u0002\u001a\u00020EH\u0002J\u0013\u0010î\u0002\u001a\u00020E2\b\u0010ï\u0002\u001a\u00030ð\u0002H\u0016J\u0013\u0010ñ\u0002\u001a\u00020z2\b\u0010ç\u0002\u001a\u00030Ì\u0001H\u0016J\u001b\u0010ò\u0002\u001a\u00020E2\b\u0010\u0096\u0002\u001a\u00030°\u00022\b\u0010Ý\u0002\u001a\u00030å\u0002J\u0015\u0010ó\u0002\u001a\u0005\u0018\u00010\u0097\u00022\u0007\u0010Î\u0002\u001a\u00020VH\u0002J\u001f\u0010ô\u0002\u001a\u0005\u0018\u00010\u0097\u00022\u0007\u0010õ\u0002\u001a\u00020V2\b\u0010ö\u0002\u001a\u00030\u0097\u0002H\u0002J\u0013\u0010÷\u0002\u001a\u0005\u0018\u00010\u0097\u00022\u0007\u0010õ\u0002\u001a\u00020VJ!\u0010ø\u0002\u001a\u0005\u0018\u00010\u0097\u00022\n\u0010ù\u0002\u001a\u0005\u0018\u00010\u0097\u00022\u0007\u0010Î\u0002\u001a\u00020VH\u0016J\u0012\u0010ú\u0002\u001a\u00020E2\u0007\u0010û\u0002\u001a\u00020zH\u0016J\u001c\u0010ü\u0002\u001a\u00020E2\b\u0010±\u0002\u001a\u00030«\u00012\u0007\u0010ý\u0002\u001a\u00020zH\u0016J\"\u0010þ\u0002\u001a\u0005\u0018\u00010ÿ\u00022\b\u0010\u0080\u0003\u001a\u00030\u0081\u0003H\u0016ø\u0001\u0000¢\u0006\u0006\b\u0082\u0003\u0010\u0083\u0003J\u0013\u0010\u0084\u0003\u001a\u00020E2\b\u0010\u0085\u0003\u001a\u00030\u0086\u0003H\u0016J\t\u0010\u0087\u0003\u001a\u00020VH\u0016J#\u0010\u0088\u0003\u001a\u00030\u0089\u00032\b\u0010ç\u0002\u001a\u00030Ì\u0001H\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0006\b\u008a\u0003\u0010\u008b\u0003J\u0013\u0010\u008c\u0003\u001a\u00020z2\b\u0010é\u0002\u001a\u00030Ì\u0001H\u0002J\u001d\u0010\u008d\u0003\u001a\u00020z2\b\u0010é\u0002\u001a\u00030Ì\u00012\b\u0010\u008e\u0003\u001a\u00030Ì\u0001H\u0002J\t\u0010\u008f\u0003\u001a\u00020EH\u0016J\t\u0010\u0090\u0003\u001a\u00020EH\u0016J\u0013\u0010\u0091\u0003\u001a\u00020E2\b\u0010\u0092\u0003\u001a\u00030«\u0001H\u0002J\u0013\u0010\u0093\u0003\u001a\u00020E2\b\u0010\u0092\u0003\u001a\u00030«\u0001H\u0002J\u0013\u0010\u0094\u0003\u001a\u00020z2\b\u0010é\u0002\u001a\u00030Ì\u0001H\u0002J\u0013\u0010\u0095\u0003\u001a\u00020z2\b\u0010é\u0002\u001a\u00030Ì\u0001H\u0002J\u0013\u0010\u0096\u0003\u001a\u00020z2\b\u0010ç\u0002\u001a\u00030Ì\u0001H\u0002J\u0013\u0010\u0097\u0003\u001a\u00020z2\b\u0010é\u0002\u001a\u00030Ì\u0001H\u0002J \u0010\u0098\u0003\u001a\u00030\u0098\u00012\b\u0010Ë\u0002\u001a\u00030\u0098\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\b\u0099\u0003\u0010É\u0002J\u001f\u0010\u0098\u0003\u001a\u00020E2\b\u0010\u009a\u0003\u001a\u00030\u0090\u0002H\u0016ø\u0001\u0000¢\u0006\u0006\b\u009b\u0003\u0010\u009c\u0003J)\u0010\u009d\u0003\u001a\u00020E2\b\u0010±\u0002\u001a\u00030«\u00012\b\u0010\u009e\u0003\u001a\u00030¾\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\b\u009f\u0003\u0010 \u0003J\u0012\u0010\u009d\u0003\u001a\u00020E2\u0007\u0010¡\u0003\u001a\u00020zH\u0016J\t\u0010¢\u0003\u001a\u00020EH\u0016J!\u0010£\u0003\u001a\u00020E2\u0007\u0010¤\u0003\u001a\u00020`2\u0007\u0010¥\u0003\u001a\u00020zH\u0000¢\u0006\u0003\b¦\u0003J\t\u0010§\u0003\u001a\u00020EH\u0014J\t\u0010¨\u0003\u001a\u00020zH\u0016J\t\u0010©\u0003\u001a\u00020EH\u0002J\u0012\u0010ª\u0003\u001a\u00020E2\u0007\u0010«\u0003\u001a\u00020DH\u0014J\u0016\u0010¬\u0003\u001a\u0005\u0018\u00010\u00ad\u00032\b\u0010®\u0003\u001a\u00030¯\u0003H\u0016J0\u0010°\u0003\u001a\u00020E2\b\u0010±\u0003\u001a\u00030²\u00032\b\u0010³\u0003\u001a\u00030\u0093\u00022\u0011\u0010´\u0003\u001a\f\u0012\u0007\u0012\u0005\u0018\u00010¶\u00030µ\u0003H\u0017J\u0013\u0010·\u0003\u001a\u00020E2\b\u0010\u0092\u0003\u001a\u00030«\u0001H\u0016J\t\u0010¸\u0003\u001a\u00020EH\u0014J\u0013\u0010¹\u0003\u001a\u00020E2\b\u0010Ý\u0002\u001a\u00030å\u0002H\u0014J\t\u0010º\u0003\u001a\u00020EH\u0016J\f\u0010»\u0003\u001a\u0005\u0018\u00010¼\u0003H\u0002J'\u0010½\u0003\u001a\u00020E2\u0007\u0010¾\u0003\u001a\u00020z2\u0007\u0010Î\u0002\u001a\u00020V2\n\u0010¿\u0003\u001a\u0005\u0018\u00010\u0086\u0003H\u0014J\u0018\u0010À\u0003\u001a\u00020E2\r\u0010\u0096\u0002\u001a\b0\u0097\u0002j\u0003`Á\u0003H\u0016J6\u0010Â\u0003\u001a\u00020E2\u0007\u0010Ã\u0003\u001a\u00020z2\u0007\u0010Ä\u0003\u001a\u00020V2\u0007\u0010Å\u0003\u001a\u00020V2\u0007\u0010Æ\u0003\u001a\u00020V2\u0007\u0010Ç\u0003\u001a\u00020VH\u0014J\u0013\u0010È\u0003\u001a\u00020E2\b\u0010±\u0002\u001a\u00030«\u0001H\u0016J\u0013\u0010É\u0003\u001a\u00020E2\b\u0010±\u0002\u001a\u00030«\u0001H\u0016J\u001b\u0010Ê\u0003\u001a\u00020E2\u0007\u0010Ë\u0003\u001a\u00020V2\u0007\u0010Ì\u0003\u001a\u00020VH\u0014J\u001f\u0010Í\u0003\u001a\u00020z2\b\u0010Î\u0003\u001a\u00030ÿ\u0002H\u0002ø\u0001\u0000¢\u0006\u0006\bÏ\u0003\u0010Ð\u0003J\u0013\u0010Ñ\u0003\u001a\u00020E2\b\u0010\u0092\u0003\u001a\u00030«\u0001H\u0016J\u001c\u0010Ò\u0003\u001a\u00020E2\b\u0010±\u0002\u001a\u00030«\u00012\u0007\u0010Ó\u0003\u001a\u00020VH\u0016J\u0013\u0010Ô\u0003\u001a\u00020E2\b\u0010\u0092\u0003\u001a\u00030«\u0001H\u0016J\u001c\u0010Õ\u0003\u001a\u00020E2\b\u0010±\u0002\u001a\u00030«\u00012\u0007\u0010Ó\u0003\u001a\u00020VH\u0016J\u001e\u0010Ö\u0003\u001a\u00020E2\n\u0010ï\u0002\u001a\u0005\u0018\u00010ð\u00022\u0007\u0010×\u0003\u001a\u00020VH\u0016J*\u0010Ø\u0003\u001a\u00020z2\n\u0010Î\u0003\u001a\u0005\u0018\u00010ÿ\u00022\n\u0010¿\u0003\u001a\u0005\u0018\u00010¼\u0003H\u0002ø\u0001\u0000¢\u0006\u0003\bÙ\u0003J.\u0010Ú\u0003\u001a\u00020E2\b\u0010±\u0002\u001a\u00030«\u00012\u0007\u0010ý\u0002\u001a\u00020z2\u0007\u0010Û\u0003\u001a\u00020z2\u0007\u0010Ü\u0003\u001a\u00020zH\u0016J%\u0010Ý\u0003\u001a\u00020E2\b\u0010±\u0002\u001a\u00030«\u00012\u0007\u0010ý\u0002\u001a\u00020z2\u0007\u0010Û\u0003\u001a\u00020zH\u0016J\u001d\u0010Þ\u0003\u001a\u00030ß\u00032\b\u0010é\u0002\u001a\u00030Ì\u00012\u0007\u0010à\u0003\u001a\u00020VH\u0017J\u0013\u0010á\u0003\u001a\u00020E2\b\u0010â\u0003\u001a\u00030ã\u0003H\u0016J\u0012\u0010ä\u0003\u001a\u00020E2\u0007\u0010£\u0001\u001a\u00020VH\u0016J.\u0010å\u0003\u001a\u00020E2\b\u0010æ\u0003\u001a\u00030\u0086\u00032\b\u0010ç\u0003\u001a\u00030è\u00032\u000f\u0010é\u0003\u001a\n\u0012\u0005\u0012\u00030ê\u00030µ\u0003H\u0016J\t\u0010ë\u0003\u001a\u00020EH\u0016J\u001c\u0010ì\u0003\u001a\u00020E2\u0011\u0010í\u0003\u001a\f\u0012\u0007\u0012\u0005\u0018\u00010ï\u00030î\u0003H\u0017J\u0012\u0010ð\u0003\u001a\u00020E2\u0007\u0010ñ\u0003\u001a\u00020zH\u0016J+\u0010ò\u0003\u001a\u00030Ó\u00022\u0007\u0010ó\u0003\u001a\u00020V2\u0007\u0010Ç\u0003\u001a\u00020VH\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0006\bô\u0003\u0010õ\u0003J\t\u0010ö\u0003\u001a\u00020EH\u0002J\u0013\u0010ö\u0003\u001a\u00020E2\b\u0010ç\u0002\u001a\u00030Ì\u0001H\u0002J\t\u0010÷\u0003\u001a\u00020EH\u0002J\u0018\u0010ø\u0003\u001a\u00020z2\u0007\u0010¤\u0003\u001a\u00020`H\u0000¢\u0006\u0003\bù\u0003J\u0018\u0010ú\u0003\u001a\u00020E2\r\u0010û\u0003\u001a\b\u0012\u0004\u0012\u00020E0gH\u0016J\u0013\u0010ü\u0003\u001a\u00020E2\b\u0010û\u0003\u001a\u00030ý\u0003H\u0016J\u0011\u0010þ\u0003\u001a\u00020E2\b\u0010\u0096\u0002\u001a\u00030°\u0002J\u0013\u0010ÿ\u0003\u001a\u00020E2\b\u0010\u0092\u0003\u001a\u00030«\u0001H\u0016J\u0007\u0010\u0080\u0004\u001a\u00020EJ\u001e\u0010\u0081\u0004\u001a\u00020z2\u0007\u0010Î\u0002\u001a\u00020V2\n\u0010¿\u0003\u001a\u0005\u0018\u00010\u0086\u0003H\u0016J\u0013\u0010\u0082\u0004\u001a\u00020E2\b\u0010±\u0002\u001a\u00030«\u0001H\u0016J\u0017\u0010Ü\u0003\u001a\u00020E2\f\b\u0002\u0010\u0083\u0004\u001a\u0005\u0018\u00010«\u0001H\u0002J \u0010\u0084\u0004\u001a\u00030\u0098\u00012\b\u0010\u0085\u0004\u001a\u00030\u0098\u0001H\u0016ø\u0001\u0000¢\u0006\u0006\b\u0086\u0004\u0010É\u0002J\u001f\u0010\u0087\u0004\u001a\u00020z2\b\u0010\u0080\u0003\u001a\u00030\u0081\u0003H\u0016ø\u0001\u0000¢\u0006\u0006\b\u0088\u0004\u0010\u0089\u0004J#\u0010\u008a\u0004\u001a\u00030\u0089\u00032\b\u0010ç\u0002\u001a\u00030Ì\u0001H\u0002ø\u0001\u0001ø\u0001\u0000¢\u0006\u0006\b\u008b\u0004\u0010\u008b\u0003J1\u0010\u008c\u0004\u001a\u00020E2\b\u0010ç\u0002\u001a\u00030Ì\u00012\u0007\u0010\u008d\u0004\u001a\u00020V2\b\u0010\u008e\u0004\u001a\u00030\u009a\u00012\t\b\u0002\u0010\u008f\u0004\u001a\u00020zH\u0002J\u0013\u0010\u0090\u0004\u001a\u00020E2\b\u0010\u0091\u0004\u001a\u00030\u009a\u0001H\u0016J\u001c\u0010\u0092\u0004\u001a\u00020E2\u0013\u0010\u0093\u0004\u001a\u000e\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020E0CJ\t\u0010\u0094\u0004\u001a\u00020zH\u0016JE\u0010\u0095\u0004\u001a\u00020z2\b\u0010\u0096\u0004\u001a\u00030\u0097\u00042\b\u0010\u0098\u0004\u001a\u00030\u0099\u00042\u001a\u0010\u009a\u0004\u001a\u0015\u0012\u0005\u0012\u00030\u009b\u0004\u0012\u0004\u0012\u00020E0C¢\u0006\u0003\b\u009c\u0004H\u0002ø\u0001\u0000¢\u0006\u0006\b\u009d\u0004\u0010\u009e\u0004JA\u0010\u009f\u0004\u001a\u00030 \u00042.\u0010¡\u0004\u001a)\b\u0001\u0012\u0005\u0012\u00030¢\u0004\u0012\f\u0012\n\u0012\u0005\u0012\u00030 \u00040£\u0004\u0012\u0007\u0012\u0005\u0018\u00010¤\u00040Ù\u0002¢\u0006\u0003\b\u009c\u0004H\u0096@¢\u0006\u0003\u0010¥\u0004J\t\u0010¦\u0004\u001a\u00020EH\u0002J\t\u0010§\u0004\u001a\u00020EH\u0002J\u000e\u0010¨\u0004\u001a\u00020z*\u00030«\u0001H\u0002J\u001b\u0010©\u0004\u001a\u00020V*\u00030Ó\u0002H\u0082\nø\u0001\u0000¢\u0006\u0006\bª\u0004\u0010«\u0004J\u001b\u0010¬\u0004\u001a\u00020V*\u00030Ó\u0002H\u0082\nø\u0001\u0000¢\u0006\u0006\b\u00ad\u0004\u0010«\u0004R\u0010\u0010\u000b\u001a\u0004\u0018\u00010\fX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\r\u001a\u0004\u0018\u00010\u000eX\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004¢\u0006\u0002\n\u0000R/\u0010\u0017\u001a\u0004\u0018\u00010\u00162\b\u0010\u0015\u001a\u0004\u0018\u00010\u00168B@BX\u0082\u008e\u0002¢\u0006\u0012\n\u0004\b\u001c\u0010\u001d\u001a\u0004\b\u0018\u0010\u0019\"\u0004\b\u001a\u0010\u001bR\u000e\u0010\u001e\u001a\u00020\u001fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010 \u001a\u00020!X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\"\u0010#R\u0014\u0010$\u001a\u00020\f8@X\u0080\u0004¢\u0006\u0006\u001a\u0004\b%\u0010&R\u0016\u0010'\u001a\u0004\u0018\u00010(8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b)\u0010*R\u0016\u0010+\u001a\u0004\u0018\u00010,8VX\u0096\u0004¢\u0006\u0006\u001a\u0004\b-\u0010.R\u0014\u0010/\u001a\u000200X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b1\u00102R\u0010\u00103\u001a\u000204X\u0082\u0004¢\u0006\u0004\n\u0002\u00105R\u000e\u00106\u001a\u000207X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u00108\u001a\u000209X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b:\u0010;R\u0014\u0010<\u001a\u00020=X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b>\u0010?R\u000e\u0010@\u001a\u00020AX\u0082\u0004¢\u0006\u0002\n\u0000R&\u0010B\u001a\u000e\u0012\u0004\u0012\u00020D\u0012\u0004\u0012\u00020E0CX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bF\u0010G\"\u0004\bH\u0010IR\u001a\u0010J\u001a\u00020KX\u0080\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bL\u0010M\"\u0004\bN\u0010OR$\u0010\b\u001a\u00020\t2\u0006\u0010P\u001a\u00020\t@VX\u0096\u000e¢\u0006\u000e\n\u0000\u001a\u0004\bQ\u0010R\"\u0004\bS\u0010TR\u000e\u0010U\u001a\u00020VX\u0082\u000e¢\u0006\u0002\n\u0000R+\u0010X\u001a\u00020W2\u0006\u0010\u0015\u001a\u00020W8V@RX\u0096\u008e\u0002¢\u0006\u0012\n\u0004\b]\u0010\u001d\u001a\u0004\bY\u0010Z\"\u0004\b[\u0010\\R\u0014\u0010^\u001a\b\u0012\u0004\u0012\u00020`0_X\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010a\u001a\u00020bX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\bc\u0010dR\u001c\u0010e\u001a\u0010\u0012\f\u0012\n\u0012\u0004\u0012\u00020E\u0018\u00010g0fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0014\u0010h\u001a\u00020iX\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\bj\u0010kR+\u0010m\u001a\u00020l2\u0006\u0010\u0015\u001a\u00020l8V@RX\u0096\u008e\u0002¢\u0006\u0012\n\u0004\br\u0010\u001d\u001a\u0004\bn\u0010o\"\u0004\bp\u0010qR\u001c\u0010s\u001a\u00020t8\u0016X\u0097\u0004¢\u0006\u000e\n\u0000\u0012\u0004\bu\u0010v\u001a\u0004\bw\u0010xR\u000e\u0010y\u001a\u00020zX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010{\u001a\u00020|X\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010}\u001a\u00020~X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u007fR\u0018\u0010\u0080\u0001\u001a\u00030\u0081\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\b\u0082\u0001\u0010\u0083\u0001R\u0018\u0010\u0084\u0001\u001a\u00030\u0085\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\b\u0086\u0001\u0010\u0087\u0001R\u0017\u0010\u0088\u0001\u001a\u00020z8VX\u0096\u0004¢\u0006\b\u001a\u0006\b\u0089\u0001\u0010\u008a\u0001R\u000f\u0010\u008b\u0001\u001a\u00020zX\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010\u008c\u0001\u001a\u00030\u008d\u00018VX\u0096\u0004¢\u0006\b\u001a\u0006\b\u008e\u0001\u0010\u008f\u0001R\u000f\u0010\u0090\u0001\u001a\u00020zX\u0082\u000e¢\u0006\u0002\n\u0000R\u0017\u0010\u0091\u0001\u001a\u00020z8VX\u0096\u0004¢\u0006\b\u001a\u0006\b\u0091\u0001\u0010\u008a\u0001R\u000f\u0010\u0092\u0001\u001a\u00020zX\u0082\u000e¢\u0006\u0002\n\u0000R\u000f\u0010\u0093\u0001\u001a\u00020zX\u0082\u000e¢\u0006\u0002\n\u0000R\u0010\u0010\u0094\u0001\u001a\u00030\u0095\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000f\u0010\u0096\u0001\u001a\u00020zX\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010\u0097\u0001\u001a\u00030\u0098\u0001X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u007fR+\u0010\u0099\u0001\u001a\u00030\u009a\u00018\u0000@\u0000X\u0081\u000e¢\u0006\u0019\n\u0000\u0012\u0005\b\u009b\u0001\u0010v\u001a\u0006\b\u009c\u0001\u0010\u009d\u0001\"\u0006\b\u009e\u0001\u0010\u009f\u0001R\u0016\u0010 \u0001\u001a\t\u0012\u0004\u0012\u00020`0¡\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R3\u0010£\u0001\u001a\u00030¢\u00012\u0007\u0010\u0015\u001a\u00030¢\u00018V@RX\u0096\u008e\u0002¢\u0006\u0017\n\u0005\b¨\u0001\u0010\u001d\u001a\u0006\b¤\u0001\u0010¥\u0001\"\u0006\b¦\u0001\u0010§\u0001R\u001f\u0010©\u0001\u001a\n\u0012\u0005\u0012\u00030«\u00010ª\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\b¬\u0001\u0010\u00ad\u0001R\u0010\u0010®\u0001\u001a\u00030¯\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010°\u0001\u001a\u00030±\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010²\u0001\u001a\u00030³\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010´\u0001\u001a\u00030\u009a\u00018VX\u0096\u0004¢\u0006\b\u001a\u0006\bµ\u0001\u0010\u009d\u0001R\u0018\u0010¶\u0001\u001a\u00030·\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\b¸\u0001\u0010¹\u0001R\u0010\u0010º\u0001\u001a\u00030»\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000f\u0010¼\u0001\u001a\u00020zX\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010½\u0001\u001a\u0005\u0018\u00010¾\u0001X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0002\n\u0000R\u001d\u0010¿\u0001\u001a\u0010\u0012\u0004\u0012\u00020\u0016\u0012\u0004\u0012\u00020E\u0018\u00010CX\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010À\u0001\u001a\u00030Á\u00018VX\u0096\u0004¢\u0006\b\u001a\u0006\bÂ\u0001\u0010Ã\u0001R\u0018\u0010Ä\u0001\u001a\u00030Å\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\bÆ\u0001\u0010Ç\u0001R\u0010\u0010È\u0001\u001a\u00030É\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u0010Ê\u0001\u001a\n\u0012\u0004\u0012\u00020`\u0018\u00010_X\u0082\u000e¢\u0006\u0002\n\u0000R\u0012\u0010Ë\u0001\u001a\u0005\u0018\u00010Ì\u0001X\u0082\u000e¢\u0006\u0002\n\u0000R\u000f\u0010Í\u0001\u001a\u00020zX\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010Î\u0001\u001a\u00030Ï\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\bÐ\u0001\u0010Ñ\u0001R\u0010\u0010Ò\u0001\u001a\u00030\u009a\u0001X\u0082\u000e¢\u0006\u0002\n\u0000R\u0015\u0010Ó\u0001\u001a\b\u0012\u0004\u0012\u00020E0gX\u0082\u0004¢\u0006\u0002\n\u0000R\u0013\u0010Ô\u0001\u001a\u00030Õ\u0001X\u0082\u0004¢\u0006\u0005\n\u0003\u0010Ö\u0001R\u0018\u0010×\u0001\u001a\u00030«\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\bØ\u0001\u0010Ù\u0001R\u0018\u0010Ú\u0001\u001a\u00030Û\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\bÜ\u0001\u0010Ý\u0001R\u0010\u0010Þ\u0001\u001a\u00030ß\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010à\u0001\u001a\u00030\u0095\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0012\u0010á\u0001\u001a\u0005\u0018\u00010â\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0017\u0010ã\u0001\u001a\u00020z8@X\u0080\u0004¢\u0006\b\u001a\u0006\bä\u0001\u0010\u008a\u0001R\u0010\u0010å\u0001\u001a\u00030æ\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010ç\u0001\u001a\u00030è\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010é\u0001\u001a\u00030ê\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\bë\u0001\u0010ì\u0001R\u0010\u0010í\u0001\u001a\u00030î\u0001X\u0082\u0004¢\u0006\u0002\n\u0000R\u000f\u0010ï\u0001\u001a\u00020VX\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010ð\u0001\u001a\u00030ñ\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\bò\u0001\u0010ó\u0001R&\u0010ô\u0001\u001a\u00020zX\u0096\u000e¢\u0006\u0019\n\u0000\u0012\u0005\bõ\u0001\u0010v\u001a\u0006\bö\u0001\u0010\u008a\u0001\"\u0006\b÷\u0001\u0010ø\u0001R\u0018\u0010ù\u0001\u001a\u00030ú\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\bû\u0001\u0010ü\u0001R\u0018\u0010ý\u0001\u001a\u00030þ\u0001X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\bÿ\u0001\u0010\u0080\u0002R\u000f\u0010\u0081\u0002\u001a\u00020zX\u0082\u000e¢\u0006\u0002\n\u0000R!\u0010\u0082\u0002\u001a\u00030\u0083\u00028\u0016X\u0097\u0004¢\u0006\u0011\n\u0000\u0012\u0005\b\u0084\u0002\u0010v\u001a\u0006\b\u0085\u0002\u0010\u0086\u0002R \u0010\u0087\u0002\u001a\n\u0012\u0005\u0012\u00030\u0089\u00020\u0088\u0002X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0005\n\u0003\u0010\u008a\u0002R\u0018\u0010\u008b\u0002\u001a\u00030\u008c\u0002X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\b\u008d\u0002\u0010\u008e\u0002R\u0019\u0010\u008f\u0002\u001a\u00030\u0090\u0002X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0005\n\u0003\u0010\u0091\u0002R\u0010\u0010\u0092\u0002\u001a\u00030\u0093\u0002X\u0082\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0094\u0002\u001a\u00030\u0095\u0002X\u0082\u0004¢\u0006\u0002\n\u0000R\u0018\u0010\u0096\u0002\u001a\u00030\u0097\u00028VX\u0096\u0004¢\u0006\b\u001a\u0006\b\u0098\u0002\u0010\u0099\u0002R\u0018\u0010\u009a\u0002\u001a\u00030\u009b\u0002X\u0096\u0004¢\u0006\n\n\u0000\u001a\u0006\b\u009c\u0002\u0010\u009d\u0002R\u0012\u0010\u009e\u0002\u001a\u0005\u0018\u00010\u009f\u0002X\u0082\u000e¢\u0006\u0002\n\u0000R\u0019\u0010 \u0002\u001a\u00030\u0090\u0002X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0005\n\u0003\u0010\u0091\u0002R!\u0010¡\u0002\u001a\u0004\u0018\u00010\u00168FX\u0086\u0084\u0002¢\u0006\u000f\n\u0006\b£\u0002\u0010¤\u0002\u001a\u0005\b¢\u0002\u0010\u0019R\u000f\u0010¥\u0002\u001a\u00020zX\u0082\u000e¢\u0006\u0002\n\u0000R\u0018\u0010¦\u0002\u001a\u00030§\u00028VX\u0096\u0004¢\u0006\b\u001a\u0006\b¨\u0002\u0010©\u0002R\u0018\u0010ª\u0002\u001a\u00030\u0098\u0001X\u0082\u000eø\u0001\u0000ø\u0001\u0001¢\u0006\u0004\n\u0002\u0010\u007fR\u0019\u0010«\u0002\u001a\u00030\u0090\u0002X\u0082\u0004ø\u0001\u0000ø\u0001\u0001¢\u0006\u0005\n\u0003\u0010\u0091\u0002R\u001b\u0010¬\u0002\u001a\u00020V*\u00020D8BX\u0082\u0004¢\u0006\b\u001a\u0006\b\u00ad\u0002\u0010®\u0002\u0082\u0002\u000b\n\u0005\b¡\u001e0\u0001\n\u0002\b!¨\u0006°\u0004"}, d2 = {"Landroidx/compose/ui/platform/AndroidComposeView;", "Landroid/view/ViewGroup;", "Landroidx/compose/ui/node/Owner;", "Landroidx/compose/ui/platform/ViewRootForTest;", "Landroidx/compose/ui/input/pointer/MatrixPositionCalculator;", "Landroidx/lifecycle/DefaultLifecycleObserver;", "context", "Landroid/content/Context;", "coroutineContext", "Lkotlin/coroutines/CoroutineContext;", "(Landroid/content/Context;Lkotlin/coroutines/CoroutineContext;)V", "_androidViewsHandler", "Landroidx/compose/ui/platform/AndroidViewsHandler;", "_autofill", "Landroidx/compose/ui/autofill/AndroidAutofill;", "_autofillManager", "Landroidx/compose/ui/autofill/AndroidAutofillManager;", "get_autofillManager$ui_release", "()Landroidx/compose/ui/autofill/AndroidAutofillManager;", "_inputModeManager", "Landroidx/compose/ui/input/InputModeManagerImpl;", "<set-?>", "Landroidx/compose/ui/platform/AndroidComposeView$ViewTreeOwners;", "_viewTreeOwners", "get_viewTreeOwners", "()Landroidx/compose/ui/platform/AndroidComposeView$ViewTreeOwners;", "set_viewTreeOwners", "(Landroidx/compose/ui/platform/AndroidComposeView$ViewTreeOwners;)V", "_viewTreeOwners$delegate", "Landroidx/compose/runtime/MutableState;", "_windowInfo", "Landroidx/compose/ui/platform/LazyWindowInfo;", "accessibilityManager", "Landroidx/compose/ui/platform/AndroidAccessibilityManager;", "getAccessibilityManager", "()Landroidx/compose/ui/platform/AndroidAccessibilityManager;", "androidViewsHandler", "getAndroidViewsHandler$ui_release", "()Landroidx/compose/ui/platform/AndroidViewsHandler;", "autofill", "Landroidx/compose/ui/autofill/Autofill;", "getAutofill", "()Landroidx/compose/ui/autofill/Autofill;", "autofillManager", "Landroidx/compose/ui/autofill/AutofillManager;", "getAutofillManager", "()Landroidx/compose/ui/autofill/AutofillManager;", "autofillTree", "Landroidx/compose/ui/autofill/AutofillTree;", "getAutofillTree", "()Landroidx/compose/ui/autofill/AutofillTree;", "bringIntoViewNode", "androidx/compose/ui/platform/AndroidComposeView$bringIntoViewNode$1", "Landroidx/compose/ui/platform/AndroidComposeView$bringIntoViewNode$1;", "canvasHolder", "Landroidx/compose/ui/graphics/CanvasHolder;", "clipboard", "Landroidx/compose/ui/platform/AndroidClipboard;", "getClipboard", "()Landroidx/compose/ui/platform/AndroidClipboard;", "clipboardManager", "Landroidx/compose/ui/platform/AndroidClipboardManager;", "getClipboardManager", "()Landroidx/compose/ui/platform/AndroidClipboardManager;", "composeAccessibilityDelegate", "Landroidx/compose/ui/platform/AndroidComposeViewAccessibilityDelegateCompat;", "configurationChangeObserver", "Lkotlin/Function1;", "Landroid/content/res/Configuration;", "", "getConfigurationChangeObserver", "()Lkotlin/jvm/functions/Function1;", "setConfigurationChangeObserver", "(Lkotlin/jvm/functions/Function1;)V", "contentCaptureManager", "Landroidx/compose/ui/contentcapture/AndroidContentCaptureManager;", "getContentCaptureManager$ui_release", "()Landroidx/compose/ui/contentcapture/AndroidContentCaptureManager;", "setContentCaptureManager$ui_release", "(Landroidx/compose/ui/contentcapture/AndroidContentCaptureManager;)V", "value", "getCoroutineContext", "()Lkotlin/coroutines/CoroutineContext;", "setCoroutineContext", "(Lkotlin/coroutines/CoroutineContext;)V", "currentFontWeightAdjustment", "", "Landroidx/compose/ui/unit/Density;", "density", "getDensity", "()Landroidx/compose/ui/unit/Density;", "setDensity", "(Landroidx/compose/ui/unit/Density;)V", "density$delegate", "dirtyLayers", "", "Landroidx/compose/ui/node/OwnedLayer;", "dragAndDropManager", "Landroidx/compose/ui/draganddrop/AndroidDragAndDropManager;", "getDragAndDropManager", "()Landroidx/compose/ui/draganddrop/AndroidDragAndDropManager;", "endApplyChangesListeners", "Landroidx/collection/MutableObjectList;", "Lkotlin/Function0;", "focusOwner", "Landroidx/compose/ui/focus/FocusOwner;", "getFocusOwner", "()Landroidx/compose/ui/focus/FocusOwner;", "Landroidx/compose/ui/text/font/FontFamily$Resolver;", "fontFamilyResolver", "getFontFamilyResolver", "()Landroidx/compose/ui/text/font/FontFamily$Resolver;", "setFontFamilyResolver", "(Landroidx/compose/ui/text/font/FontFamily$Resolver;)V", "fontFamilyResolver$delegate", "fontLoader", "Landroidx/compose/ui/text/font/Font$ResourceLoader;", "getFontLoader$annotations", "()V", "getFontLoader", "()Landroidx/compose/ui/text/font/Font$ResourceLoader;", "forceUseMatrixCache", "", "globalLayoutListener", "Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;", "globalPosition", "Landroidx/compose/ui/unit/IntOffset;", "J", "graphicsContext", "Landroidx/compose/ui/graphics/GraphicsContext;", "getGraphicsContext", "()Landroidx/compose/ui/graphics/GraphicsContext;", "hapticFeedBack", "Landroidx/compose/ui/hapticfeedback/HapticFeedback;", "getHapticFeedBack", "()Landroidx/compose/ui/hapticfeedback/HapticFeedback;", "hasPendingMeasureOrLayout", "getHasPendingMeasureOrLayout", "()Z", "hoverExitReceived", "inputModeManager", "Landroidx/compose/ui/input/InputModeManager;", "getInputModeManager", "()Landroidx/compose/ui/input/InputModeManager;", "isDrawingContent", "isLifecycleInResumedState", "isPendingInteropViewLayoutChangeDispatch", "isRenderNodeCompatible", "keyInputModifier", "Landroidx/compose/ui/Modifier;", "keyboardModifiersRequireUpdate", "lastDownPointerPosition", "Landroidx/compose/ui/geometry/Offset;", "lastMatrixRecalculationAnimationTime", "", "getLastMatrixRecalculationAnimationTime$ui_release$annotations", "getLastMatrixRecalculationAnimationTime$ui_release", "()J", "setLastMatrixRecalculationAnimationTime$ui_release", "(J)V", "layerCache", "Landroidx/compose/ui/platform/WeakCache;", "Landroidx/compose/ui/unit/LayoutDirection;", "layoutDirection", "getLayoutDirection", "()Landroidx/compose/ui/unit/LayoutDirection;", "setLayoutDirection", "(Landroidx/compose/ui/unit/LayoutDirection;)V", "layoutDirection$delegate", "layoutNodes", "Landroidx/collection/MutableIntObjectMap;", "Landroidx/compose/ui/node/LayoutNode;", "getLayoutNodes", "()Landroidx/collection/MutableIntObjectMap;", "legacyTextInputServiceAndroid", "Landroidx/compose/ui/text/input/TextInputServiceAndroid;", "matrixToWindow", "Landroidx/compose/ui/platform/CalculateMatrixToWindow;", "measureAndLayoutDelegate", "Landroidx/compose/ui/node/MeasureAndLayoutDelegate;", "measureIteration", "getMeasureIteration", "modifierLocalManager", "Landroidx/compose/ui/modifier/ModifierLocalManager;", "getModifierLocalManager", "()Landroidx/compose/ui/modifier/ModifierLocalManager;", "motionEventAdapter", "Landroidx/compose/ui/input/pointer/MotionEventAdapter;", "observationClearRequested", "onMeasureConstraints", "Landroidx/compose/ui/unit/Constraints;", "onViewTreeOwnersAvailable", "placementScope", "Landroidx/compose/ui/layout/Placeable$PlacementScope;", "getPlacementScope", "()Landroidx/compose/ui/layout/Placeable$PlacementScope;", "pointerIconService", "Landroidx/compose/ui/input/pointer/PointerIconService;", "getPointerIconService", "()Landroidx/compose/ui/input/pointer/PointerIconService;", "pointerInputEventProcessor", "Landroidx/compose/ui/input/pointer/PointerInputEventProcessor;", "postponedDirtyLayers", "previousMotionEvent", "Landroid/view/MotionEvent;", "processingRequestFocusForNextNonChildView", "rectManager", "Landroidx/compose/ui/spatial/RectManager;", "getRectManager", "()Landroidx/compose/ui/spatial/RectManager;", "relayoutTime", "resendMotionEventOnLayout", "resendMotionEventRunnable", "androidx/compose/ui/platform/AndroidComposeView$resendMotionEventRunnable$1", "Landroidx/compose/ui/platform/AndroidComposeView$resendMotionEventRunnable$1;", "root", "getRoot", "()Landroidx/compose/ui/node/LayoutNode;", "rootForTest", "Landroidx/compose/ui/node/RootForTest;", "getRootForTest", "()Landroidx/compose/ui/node/RootForTest;", "rootSemanticsNode", "Landroidx/compose/ui/semantics/EmptySemanticsModifier;", "rotaryInputModifier", "scrollCapture", "Landroidx/compose/ui/scrollcapture/ScrollCapture;", "scrollCaptureInProgress", "getScrollCaptureInProgress$ui_release", "scrollChangedListener", "Landroid/view/ViewTreeObserver$OnScrollChangedListener;", "semanticsModifier", "Landroidx/compose/ui/semantics/EmptySemanticsElement;", "semanticsOwner", "Landroidx/compose/ui/semantics/SemanticsOwner;", "getSemanticsOwner", "()Landroidx/compose/ui/semantics/SemanticsOwner;", "sendHoverExitEvent", "Ljava/lang/Runnable;", "sensitiveComponentCount", "sharedDrawScope", "Landroidx/compose/ui/node/LayoutNodeDrawScope;", "getSharedDrawScope", "()Landroidx/compose/ui/node/LayoutNodeDrawScope;", "showLayoutBounds", "getShowLayoutBounds$annotations", "getShowLayoutBounds", "setShowLayoutBounds", "(Z)V", "snapshotObserver", "Landroidx/compose/ui/node/OwnerSnapshotObserver;", "getSnapshotObserver", "()Landroidx/compose/ui/node/OwnerSnapshotObserver;", "softwareKeyboardController", "Landroidx/compose/ui/platform/SoftwareKeyboardController;", "getSoftwareKeyboardController", "()Landroidx/compose/ui/platform/SoftwareKeyboardController;", "superclassInitComplete", "textInputService", "Landroidx/compose/ui/text/input/TextInputService;", "getTextInputService$annotations", "getTextInputService", "()Landroidx/compose/ui/text/input/TextInputService;", "textInputSessionMutex", "Landroidx/compose/ui/SessionMutex;", "Landroidx/compose/ui/platform/AndroidPlatformTextInputSession;", "Ljava/util/concurrent/atomic/AtomicReference;", "textToolbar", "Landroidx/compose/ui/platform/TextToolbar;", "getTextToolbar", "()Landroidx/compose/ui/platform/TextToolbar;", "tmpMatrix", "Landroidx/compose/ui/graphics/Matrix;", "[F", "tmpPositionArray", "", "touchModeChangeListener", "Landroid/view/ViewTreeObserver$OnTouchModeChangeListener;", "view", "Landroid/view/View;", "getView", "()Landroid/view/View;", "viewConfiguration", "Landroidx/compose/ui/platform/ViewConfiguration;", "getViewConfiguration", "()Landroidx/compose/ui/platform/ViewConfiguration;", "viewLayersContainer", "Landroidx/compose/ui/platform/DrawChildContainer;", "viewToWindowMatrix", "viewTreeOwners", "getViewTreeOwners", "viewTreeOwners$delegate", "Landroidx/compose/runtime/State;", "wasMeasuredWithMultipleConstraints", "windowInfo", "Landroidx/compose/ui/platform/WindowInfo;", "getWindowInfo", "()Landroidx/compose/ui/platform/WindowInfo;", "windowPosition", "windowToViewMatrix", "fontWeightAdjustmentCompat", "getFontWeightAdjustmentCompat", "(Landroid/content/res/Configuration;)I", "addAndroidView", "Landroidx/compose/ui/viewinterop/AndroidViewHolder;", "layoutNode", "addExtraDataToAccessibilityNodeInfoHelper", "virtualViewId", "info", "Landroid/view/accessibility/AccessibilityNodeInfo;", "extraDataKey", "", "addView", "child", "params", "Landroid/view/ViewGroup$LayoutParams;", "index", "width", "height", "values", "Landroid/util/SparseArray;", "Landroid/view/autofill/AutofillValue;", "autofillSupported", "boundsUpdatesAccessibilityEventLoop", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "boundsUpdatesContentCaptureEventLoop", "calculateLocalPosition", "positionInWindow", "calculateLocalPosition-MK-Hz9U", "(J)J", "calculatePositionInWindow", "localPosition", "calculatePositionInWindow-MK-Hz9U", "canScrollHorizontally", "direction", "canScrollVertically", "clearChildInvalidObservations", "viewGroup", "convertMeasureSpec", "Lkotlin/ULong;", "measureSpec", "convertMeasureSpec-I7RO_PI", "(I)J", "createLayer", "drawBlock", "Lkotlin/Function2;", "Landroidx/compose/ui/graphics/Canvas;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "canvas", "Landroidx/compose/ui/graphics/layer/GraphicsLayer;", "parentLayer", "invalidateParentLayer", "explicitLayer", "forceUseOldLayers", "decrementSensitiveComponentCount", "dispatchDraw", "Landroid/graphics/Canvas;", "dispatchGenericMotionEvent", "motionEvent", "dispatchHoverEvent", NotificationCompat.CATEGORY_EVENT, "dispatchKeyEvent", "Landroid/view/KeyEvent;", "dispatchKeyEventPreIme", "dispatchPendingInteropLayoutCallbacks", "dispatchProvideStructure", "structure", "Landroid/view/ViewStructure;", "dispatchTouchEvent", "drawAndroidView", "findNextNonChildView", "findViewByAccessibilityIdRootedAtCurrentView", "accessibilityId", "currentView", "findViewByAccessibilityIdTraversal", "focusSearch", "focused", "forceAccessibilityForTesting", "enable", "forceMeasureTheSubtree", "affectsLookahead", "getFocusDirection", "Landroidx/compose/ui/focus/FocusDirection;", "keyEvent", "Landroidx/compose/ui/input/key/KeyEvent;", "getFocusDirection-P8AzH3I", "(Landroid/view/KeyEvent;)Landroidx/compose/ui/focus/FocusDirection;", "getFocusedRect", "rect", "Landroid/graphics/Rect;", "getImportantForAutofill", "handleMotionEvent", "Landroidx/compose/ui/input/pointer/ProcessResult;", "handleMotionEvent-8iAsVTc", "(Landroid/view/MotionEvent;)I", "handleRotaryEvent", "hasChangedDevices", "lastEvent", "incrementSensitiveComponentCount", "invalidateDescendants", "invalidateLayers", "node", "invalidateLayoutNodeMeasurement", "isBadMotionEvent", "isDevicePressEvent", "isInBounds", "isPositionChanged", "localToScreen", "localToScreen-MK-Hz9U", "localTransform", "localToScreen-58bKbWc", "([F)V", "measureAndLayout", "constraints", "measureAndLayout-0kLqBqw", "(Landroidx/compose/ui/node/LayoutNode;J)V", "sendPointerUpdate", "measureAndLayoutForTest", "notifyLayerIsDirty", "layer", "isDirty", "notifyLayerIsDirty$ui_release", "onAttachedToWindow", "onCheckIsTextEditor", "onClearFocusForOwner", "onConfigurationChanged", "newConfig", "onCreateInputConnection", "Landroid/view/inputmethod/InputConnection;", "outAttrs", "Landroid/view/inputmethod/EditorInfo;", "onCreateVirtualViewTranslationRequests", "virtualIds", "", "supportedFormats", "requestsCollector", "Ljava/util/function/Consumer;", "Landroid/view/translation/ViewTranslationRequest;", "onDetach", "onDetachedFromWindow", "onDraw", "onEndApplyChanges", "onFetchFocusRect", "Landroidx/compose/ui/geometry/Rect;", "onFocusChanged", "gainFocus", "previouslyFocusedRect", "onInteropViewLayoutChange", "Landroidx/compose/ui/viewinterop/InteropView;", "onLayout", "changed", "l", "t", "r", "b", "onLayoutChange", "onLayoutNodeDeactivated", "onMeasure", "widthMeasureSpec", "heightMeasureSpec", "onMoveFocusInChildren", "focusDirection", "onMoveFocusInChildren-3ESFkO8", "(I)Z", "onPostAttach", "onPostLayoutNodeReused", "oldSemanticsId", "onPreAttach", "onPreLayoutNodeReused", "onProvideAutofillVirtualStructure", "flags", "onRequestFocusForOwner", "onRequestFocusForOwner-7o62pno", "onRequestMeasure", "forceRequest", "scheduleMeasureAndLayout", "onRequestRelayout", "onResolvePointerIcon", "Landroid/view/PointerIcon;", "pointerIndex", "onResume", "owner", "Landroidx/lifecycle/LifecycleOwner;", "onRtlPropertiesChanged", "onScrollCaptureSearch", "localVisibleRect", "windowOffset", "Landroid/graphics/Point;", "targets", "Landroid/view/ScrollCaptureTarget;", "onSemanticsChange", "onVirtualViewTranslationResponses", "response", "Landroid/util/LongSparseArray;", "Landroid/view/translation/ViewTranslationResponse;", "onWindowFocusChanged", "hasWindowFocus", "pack", "a", "pack-ZIaKswc", "(II)J", "recalculateWindowPosition", "recalculateWindowViewTransforms", "recycle", "recycle$ui_release", "registerOnEndApplyChangesListener", ServiceSpecificExtraArgs.CastExtraArgs.LISTENER, "registerOnLayoutCompletedListener", "Landroidx/compose/ui/node/Owner$OnLayoutCompletedListener;", "removeAndroidView", "requestAutofill", "requestClearInvalidObservations", "requestFocus", "requestOnPositionedCallback", "nodeToRemeasure", "screenToLocal", "positionOnScreen", "screenToLocal-MK-Hz9U", "sendKeyEvent", "sendKeyEvent-ZmokQxo", "(Landroid/view/KeyEvent;)Z", "sendMotionEvent", "sendMotionEvent-8iAsVTc", "sendSimulatedEvent", "action", "eventTime", "forceHover", "setAccessibilityEventBatchIntervalMillis", "intervalMillis", "setOnViewTreeOwnersAvailable", "callback", "shouldDelayChildPressedState", "startDrag", "transferData", "Landroidx/compose/ui/draganddrop/DragAndDropTransferData;", "decorationSize", "Landroidx/compose/ui/geometry/Size;", "drawDragDecoration", "Landroidx/compose/ui/graphics/drawscope/DrawScope;", "Lkotlin/ExtensionFunctionType;", "startDrag-12SF9DM", "(Landroidx/compose/ui/draganddrop/DragAndDropTransferData;JLkotlin/jvm/functions/Function1;)Z", "textInputSession", "", "session", "Landroidx/compose/ui/platform/PlatformTextInputSessionScope;", "Lkotlin/coroutines/Continuation;", "", "(Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "updatePositionCacheAndDispatch", "updateWindowMetrics", "childSizeCanAffectParentSize", "component1", "component1-VKZWuLQ", "(J)I", "component2", "component2-VKZWuLQ", "Companion", "ViewTreeOwners", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class AndroidComposeView extends ViewGroup implements Owner, ViewRootForTest, MatrixPositionCalculator, DefaultLifecycleObserver {
    private static Method getBooleanMethod;
    private static Class<?> systemPropertiesClass;
    private AndroidViewsHandler _androidViewsHandler;
    private final AndroidAutofill _autofill;
    private final AndroidAutofillManager _autofillManager;
    private final InputModeManagerImpl _inputModeManager;
    private final MutableState _viewTreeOwners$delegate;
    private final LazyWindowInfo _windowInfo;
    private final AndroidAccessibilityManager accessibilityManager;
    private final AutofillTree autofillTree;
    private final AndroidComposeView$bringIntoViewNode$1 bringIntoViewNode;
    private final CanvasHolder canvasHolder;
    private final AndroidClipboard clipboard;
    private final AndroidClipboardManager clipboardManager;
    private final AndroidComposeViewAccessibilityDelegateCompat composeAccessibilityDelegate;
    private Function1<? super Configuration, Unit> configurationChangeObserver;
    private AndroidContentCaptureManager contentCaptureManager;
    private CoroutineContext coroutineContext;
    private int currentFontWeightAdjustment;
    private final MutableState density$delegate;
    private final List<OwnedLayer> dirtyLayers;
    private final AndroidDragAndDropManager dragAndDropManager;
    private final MutableObjectList<Function0<Unit>> endApplyChangesListeners;
    private final FocusOwner focusOwner;
    private final MutableState fontFamilyResolver$delegate;
    private final Font.ResourceLoader fontLoader;
    private boolean forceUseMatrixCache;
    private final ViewTreeObserver.OnGlobalLayoutListener globalLayoutListener;
    private long globalPosition;
    private final GraphicsContext graphicsContext;
    private final HapticFeedback hapticFeedBack;
    private boolean hoverExitReceived;
    private boolean isDrawingContent;
    private boolean isPendingInteropViewLayoutChangeDispatch;
    private boolean isRenderNodeCompatible;
    private final Modifier keyInputModifier;
    private boolean keyboardModifiersRequireUpdate;
    private long lastDownPointerPosition;
    private long lastMatrixRecalculationAnimationTime;
    private final WeakCache<OwnedLayer> layerCache;
    private final MutableState layoutDirection$delegate;
    private final MutableIntObjectMap<LayoutNode> layoutNodes;
    private final TextInputServiceAndroid legacyTextInputServiceAndroid;
    private final CalculateMatrixToWindow matrixToWindow;
    private final MeasureAndLayoutDelegate measureAndLayoutDelegate;
    private final ModifierLocalManager modifierLocalManager;
    private final MotionEventAdapter motionEventAdapter;
    private boolean observationClearRequested;
    private Constraints onMeasureConstraints;
    private Function1<? super ViewTreeOwners, Unit> onViewTreeOwnersAvailable;
    private final PointerIconService pointerIconService;
    private final PointerInputEventProcessor pointerInputEventProcessor;
    private List<OwnedLayer> postponedDirtyLayers;
    private MotionEvent previousMotionEvent;
    private boolean processingRequestFocusForNextNonChildView;
    private final RectManager rectManager;
    private long relayoutTime;
    private final Function0<Unit> resendMotionEventOnLayout;
    private final AndroidComposeView$resendMotionEventRunnable$1 resendMotionEventRunnable;
    private final LayoutNode root;
    private final RootForTest rootForTest;
    private final EmptySemanticsModifier rootSemanticsNode;
    private final Modifier rotaryInputModifier;
    private final ScrollCapture scrollCapture;
    private final ViewTreeObserver.OnScrollChangedListener scrollChangedListener;
    private final EmptySemanticsElement semanticsModifier;
    private final SemanticsOwner semanticsOwner;
    private final Runnable sendHoverExitEvent;
    private int sensitiveComponentCount;
    private final LayoutNodeDrawScope sharedDrawScope;
    private boolean showLayoutBounds;
    private final OwnerSnapshotObserver snapshotObserver;
    private final SoftwareKeyboardController softwareKeyboardController;
    private boolean superclassInitComplete;
    private final TextInputService textInputService;
    private final AtomicReference<SessionMutex.Session<T>> textInputSessionMutex;
    private final TextToolbar textToolbar;
    private final float[] tmpMatrix;
    private final int[] tmpPositionArray;
    private final ViewTreeObserver.OnTouchModeChangeListener touchModeChangeListener;
    private final ViewConfiguration viewConfiguration;
    private DrawChildContainer viewLayersContainer;
    private final float[] viewToWindowMatrix;
    private final State viewTreeOwners$delegate;
    private boolean wasMeasuredWithMultipleConstraints;
    private long windowPosition;
    private final float[] windowToViewMatrix;
    public static final Companion Companion = new Companion(null);
    public static final int $stable = 8;

    @Deprecated(message = "fontLoader is deprecated, use fontFamilyResolver", replaceWith = @ReplaceWith(expression = "fontFamilyResolver", imports = {}))
    public static /* synthetic */ void getFontLoader$annotations() {
    }

    public static /* synthetic */ void getLastMatrixRecalculationAnimationTime$ui_release$annotations() {
    }

    public static /* synthetic */ void getShowLayoutBounds$annotations() {
    }

    @Deprecated(message = "Use PlatformTextInputModifierNode instead.")
    public static /* synthetic */ void getTextInputService$annotations() {
    }

    /* JADX WARN: Type inference failed for: r1v5, types: [androidx.compose.ui.platform.AndroidComposeView$bringIntoViewNode$1] */
    /* JADX WARN: Type inference failed for: r1v66, types: [androidx.compose.ui.platform.AndroidComposeView$resendMotionEventRunnable$1] */
    public AndroidComposeView(Context context, CoroutineContext coroutineContext) {
        super(context);
        AndroidAutofillManager androidAutofillManager;
        this.lastDownPointerPosition = Offset.Companion.m4063getUnspecifiedF1C5BW0();
        this.superclassInitComplete = true;
        this.sharedDrawScope = new LayoutNodeDrawScope(null, 1, null);
        this.density$delegate = SnapshotStateKt.mutableStateOf(AndroidDensity_androidKt.Density(context), SnapshotStateKt.referentialEqualityPolicy());
        this.rootSemanticsNode = new EmptySemanticsModifier();
        this.semanticsModifier = new EmptySemanticsElement(this.rootSemanticsNode);
        this.bringIntoViewNode = new ModifierNodeElement<BringIntoViewOnScreenResponderNode>() { // from class: androidx.compose.ui.platform.AndroidComposeView$bringIntoViewNode$1
            @Override // androidx.compose.ui.node.ModifierNodeElement
            public BringIntoViewOnScreenResponderNode create() {
                return new BringIntoViewOnScreenResponderNode(AndroidComposeView.this);
            }

            @Override // androidx.compose.ui.node.ModifierNodeElement
            public void update(BringIntoViewOnScreenResponderNode node) {
                node.setView(AndroidComposeView.this);
            }

            @Override // androidx.compose.ui.node.ModifierNodeElement
            public void inspectableProperties(InspectorInfo $this$inspectableProperties) {
                $this$inspectableProperties.setName("BringIntoViewOnScreen");
            }

            @Override // androidx.compose.ui.node.ModifierNodeElement
            public int hashCode() {
                return AndroidComposeView.this.hashCode();
            }

            @Override // androidx.compose.ui.node.ModifierNodeElement
            public boolean equals(Object other) {
                return other == this;
            }
        };
        this.focusOwner = new FocusOwnerImpl(new AndroidComposeView$focusOwner$1(this), new AndroidComposeView$focusOwner$2(this), new AndroidComposeView$focusOwner$3(this), new AndroidComposeView$focusOwner$4(this), new AndroidComposeView$focusOwner$5(this), new MutablePropertyReference0Impl(this) { // from class: androidx.compose.ui.platform.AndroidComposeView$focusOwner$6
            @Override // kotlin.jvm.internal.MutablePropertyReference0Impl, kotlin.reflect.KProperty0
            public Object get() {
                return ((AndroidComposeView) this.receiver).getLayoutDirection();
            }

            @Override // kotlin.jvm.internal.MutablePropertyReference0Impl, kotlin.reflect.KMutableProperty0
            public void set(Object value) {
                ((AndroidComposeView) this.receiver).setLayoutDirection((LayoutDirection) value);
            }
        });
        this.coroutineContext = coroutineContext;
        this.dragAndDropManager = new AndroidDragAndDropManager(new AndroidComposeView$dragAndDropManager$1(this));
        this._windowInfo = new LazyWindowInfo();
        this.keyInputModifier = KeyInputModifierKt.onKeyEvent(Modifier.Companion, new Function1<KeyEvent, Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeView$keyInputModifier$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Boolean invoke(KeyEvent keyEvent) {
                return m6012invokeZmokQxo(keyEvent.m5357unboximpl());
            }

            /* renamed from: invoke-ZmokQxo  reason: not valid java name */
            public final Boolean m6012invokeZmokQxo(android.view.KeyEvent keyEvent) {
                Rect focusedRect;
                View nextView;
                int[] iArr;
                int[] iArr2;
                int[] iArr3;
                int[] iArr4;
                int[] iArr5;
                int[] iArr6;
                boolean m6003onMoveFocusInChildren3ESFkO8;
                final FocusDirection focusDirection = AndroidComposeView.this.mo5958getFocusDirectionP8AzH3I(keyEvent);
                if (focusDirection == null || !KeyEventType.m5361equalsimpl0(KeyEvent_androidKt.m5369getTypeZmokQxo(keyEvent), KeyEventType.Companion.m5365getKeyDownCS__XNY())) {
                    return false;
                }
                Integer androidDirection = FocusInteropUtils_androidKt.m3944toAndroidFocusDirection3ESFkO8(focusDirection.m3935unboximpl());
                if (ComposeUiFlags.isViewFocusFixEnabled && AndroidComposeView.this.hasFocus() && androidDirection != null) {
                    m6003onMoveFocusInChildren3ESFkO8 = AndroidComposeView.this.m6003onMoveFocusInChildren3ESFkO8(focusDirection.m3935unboximpl());
                    if (m6003onMoveFocusInChildren3ESFkO8) {
                        return true;
                    }
                }
                focusedRect = AndroidComposeView.this.onFetchFocusRect();
                Boolean mo3950focusSearchULY8qGw = AndroidComposeView.this.getFocusOwner().mo3950focusSearchULY8qGw(focusDirection.m3935unboximpl(), focusedRect, new Function1<FocusTargetNode, Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeView$keyInputModifier$1$focusWasMovedOrCancelled$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public final Boolean invoke(FocusTargetNode it) {
                        return Boolean.valueOf(it.mo3963requestFocus3ESFkO8(FocusDirection.this.m3935unboximpl()));
                    }
                });
                boolean focusWasMovedOrCancelled = mo3950focusSearchULY8qGw != null ? mo3950focusSearchULY8qGw.booleanValue() : true;
                if (focusWasMovedOrCancelled) {
                    return true;
                }
                if (!FocusOwnerImplKt.m3956is1dFocusSearch3ESFkO8(focusDirection.m3935unboximpl())) {
                    return false;
                }
                if (androidDirection != null) {
                    nextView = AndroidComposeView.this.findNextNonChildView(androidDirection.intValue());
                    if (Intrinsics.areEqual(nextView, AndroidComposeView.this)) {
                        nextView = null;
                    }
                    if (nextView != null) {
                        android.graphics.Rect androidRect = focusedRect != null ? RectHelper_androidKt.toAndroidRect(focusedRect) : null;
                        if (androidRect == null) {
                            throw new IllegalStateException("Invalid rect".toString());
                        }
                        iArr = AndroidComposeView.this.tmpPositionArray;
                        nextView.getLocationInWindow(iArr);
                        iArr2 = AndroidComposeView.this.tmpPositionArray;
                        int nextX = iArr2[0];
                        iArr3 = AndroidComposeView.this.tmpPositionArray;
                        int nextY = iArr3[1];
                        AndroidComposeView androidComposeView = AndroidComposeView.this;
                        iArr4 = AndroidComposeView.this.tmpPositionArray;
                        androidComposeView.getLocationInWindow(iArr4);
                        iArr5 = AndroidComposeView.this.tmpPositionArray;
                        int currentX = iArr5[0];
                        iArr6 = AndroidComposeView.this.tmpPositionArray;
                        int currentY = iArr6[1];
                        androidRect.offset(currentX - nextX, currentY - nextY);
                        if (FocusInteropUtils_androidKt.requestInteropFocus(nextView, androidDirection, androidRect)) {
                            return true;
                        }
                    }
                }
                boolean clearedFocusSuccessfully = AndroidComposeView.this.getFocusOwner().mo3947clearFocusI7lrPNg(false, true, false, focusDirection.m3935unboximpl());
                if (clearedFocusSuccessfully) {
                    Boolean mo3950focusSearchULY8qGw2 = AndroidComposeView.this.getFocusOwner().mo3950focusSearchULY8qGw(focusDirection.m3935unboximpl(), null, new Function1<FocusTargetNode, Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeView$keyInputModifier$1.1
                        {
                            super(1);
                        }

                        @Override // kotlin.jvm.functions.Function1
                        public final Boolean invoke(FocusTargetNode it) {
                            return Boolean.valueOf(it.mo3963requestFocus3ESFkO8(FocusDirection.this.m3935unboximpl()));
                        }
                    });
                    return Boolean.valueOf(mo3950focusSearchULY8qGw2 != null ? mo3950focusSearchULY8qGw2.booleanValue() : true);
                }
                return true;
            }
        });
        this.rotaryInputModifier = RotaryInputModifierKt.onRotaryScrollEvent(Modifier.Companion, new Function1<RotaryScrollEvent, Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeView$rotaryInputModifier$1
            @Override // kotlin.jvm.functions.Function1
            public final Boolean invoke(RotaryScrollEvent it) {
                return false;
            }
        });
        this.canvasHolder = new CanvasHolder();
        this.viewConfiguration = new AndroidViewConfiguration(android.view.ViewConfiguration.get(context));
        LayoutNode it = new LayoutNode(false, 0, 3, null);
        it.setMeasurePolicy(RootMeasurePolicy.INSTANCE);
        it.setDensity(getDensity());
        it.setViewConfiguration(getViewConfiguration());
        it.setModifier(Modifier.Companion.then(this.semanticsModifier).then(this.rotaryInputModifier).then(this.keyInputModifier).then(getFocusOwner().getModifier()).then(getDragAndDropManager().getModifier()).then(this.bringIntoViewNode));
        this.root = it;
        this.layoutNodes = IntObjectMapKt.mutableIntObjectMapOf();
        this.rectManager = new RectManager(getLayoutNodes());
        this.rootForTest = this;
        this.semanticsOwner = new SemanticsOwner(getRoot(), this.rootSemanticsNode, getLayoutNodes());
        this.composeAccessibilityDelegate = new AndroidComposeViewAccessibilityDelegateCompat(this);
        this.contentCaptureManager = new AndroidContentCaptureManager(this, new AndroidComposeView$contentCaptureManager$1(this));
        this.accessibilityManager = new AndroidAccessibilityManager(context);
        this.graphicsContext = AndroidGraphicsContext_androidKt.GraphicsContext(this);
        this.autofillTree = new AutofillTree();
        this.dirtyLayers = new ArrayList();
        this.motionEventAdapter = new MotionEventAdapter();
        this.pointerInputEventProcessor = new PointerInputEventProcessor(getRoot());
        this.configurationChangeObserver = new Function1<Configuration, Unit>() { // from class: androidx.compose.ui.platform.AndroidComposeView$configurationChangeObserver$1
            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Unit invoke(Configuration configuration) {
                invoke2(configuration);
                return Unit.INSTANCE;
            }

            /* renamed from: invoke  reason: avoid collision after fix types in other method */
            public final void invoke2(Configuration it2) {
            }
        };
        this._autofill = autofillSupported() ? new AndroidAutofill(this, getAutofillTree()) : null;
        if (autofillSupported()) {
            AutofillManager platformAutofill = (AutofillManager) context.getSystemService(AutofillManager.class);
            if (platformAutofill != null) {
                androidAutofillManager = new AndroidAutofillManager(new PlatformAutofillManagerImpl(platformAutofill), getSemanticsOwner(), this, getRectManager(), context.getPackageName());
            } else {
                InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("Autofill service could not be located.");
                throw new KotlinNothingValueException();
            }
        } else {
            androidAutofillManager = null;
        }
        this._autofillManager = androidAutofillManager;
        this.clipboardManager = new AndroidClipboardManager(context);
        this.clipboard = new AndroidClipboard(getClipboardManager());
        this.snapshotObserver = new OwnerSnapshotObserver(new AndroidComposeView$snapshotObserver$1(this));
        this.measureAndLayoutDelegate = new MeasureAndLayoutDelegate(getRoot());
        this.globalPosition = IntOffset.m6995constructorimpl((Integer.MAX_VALUE << 32) | (Integer.MAX_VALUE & 4294967295L));
        this.tmpPositionArray = new int[]{0, 0};
        this.tmpMatrix = Matrix.m4519constructorimpl$default(null, 1, null);
        this.viewToWindowMatrix = Matrix.m4519constructorimpl$default(null, 1, null);
        this.windowToViewMatrix = Matrix.m4519constructorimpl$default(null, 1, null);
        this.lastMatrixRecalculationAnimationTime = -1L;
        this.windowPosition = Offset.Companion.m4062getInfiniteF1C5BW0();
        this.isRenderNodeCompatible = true;
        this._viewTreeOwners$delegate = SnapshotStateKt.mutableStateOf$default(null, null, 2, null);
        this.viewTreeOwners$delegate = SnapshotStateKt.derivedStateOf(new Function0<ViewTreeOwners>() { // from class: androidx.compose.ui.platform.AndroidComposeView$viewTreeOwners$2
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final AndroidComposeView.ViewTreeOwners invoke() {
                AndroidComposeView.ViewTreeOwners viewTreeOwners;
                viewTreeOwners = AndroidComposeView.this.get_viewTreeOwners();
                return viewTreeOwners;
            }
        });
        this.globalLayoutListener = new ViewTreeObserver.OnGlobalLayoutListener() { // from class: androidx.compose.ui.platform.AndroidComposeView$$ExternalSyntheticLambda0
            @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
            public final void onGlobalLayout() {
                AndroidComposeView.this.updatePositionCacheAndDispatch();
            }
        };
        this.scrollChangedListener = new ViewTreeObserver.OnScrollChangedListener() { // from class: androidx.compose.ui.platform.AndroidComposeView$$ExternalSyntheticLambda1
            @Override // android.view.ViewTreeObserver.OnScrollChangedListener
            public final void onScrollChanged() {
                AndroidComposeView.this.updatePositionCacheAndDispatch();
            }
        };
        this.touchModeChangeListener = new ViewTreeObserver.OnTouchModeChangeListener() { // from class: androidx.compose.ui.platform.AndroidComposeView$$ExternalSyntheticLambda2
            @Override // android.view.ViewTreeObserver.OnTouchModeChangeListener
            public final void onTouchModeChanged(boolean z) {
                AndroidComposeView.touchModeChangeListener$lambda$8(AndroidComposeView.this, z);
            }
        };
        this.legacyTextInputServiceAndroid = new TextInputServiceAndroid(getView(), this);
        this.textInputService = new TextInputService(AndroidComposeView_androidKt.getPlatformTextInputServiceInterceptor().invoke(this.legacyTextInputServiceAndroid));
        this.textInputSessionMutex = SessionMutex.m3868constructorimpl();
        this.softwareKeyboardController = new DelegatingSoftwareKeyboardController(getTextInputService());
        this.fontLoader = new AndroidFontResourceLoader(context);
        this.fontFamilyResolver$delegate = SnapshotStateKt.mutableStateOf(FontFamilyResolver_androidKt.createFontFamilyResolver(context), SnapshotStateKt.referentialEqualityPolicy());
        this.currentFontWeightAdjustment = getFontWeightAdjustmentCompat(context.getResources().getConfiguration());
        LayoutDirection layoutDirection = FocusInteropUtils_androidKt.toLayoutDirection(context.getResources().getConfiguration().getLayoutDirection());
        this.layoutDirection$delegate = SnapshotStateKt.mutableStateOf$default(layoutDirection == null ? LayoutDirection.Ltr : layoutDirection, null, 2, null);
        this.hapticFeedBack = new PlatformHapticFeedback(this);
        this._inputModeManager = new InputModeManagerImpl(isInTouchMode() ? InputMode.Companion.m5051getTouchaOaMEAU() : InputMode.Companion.m5050getKeyboardaOaMEAU(), new Function1<InputMode, Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeView$_inputModeManager$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(1);
            }

            @Override // kotlin.jvm.functions.Function1
            public /* bridge */ /* synthetic */ Boolean invoke(InputMode inputMode) {
                return m6008invokeiuPiT84(inputMode.m5049unboximpl());
            }

            /* renamed from: invoke-iuPiT84  reason: not valid java name */
            public final Boolean m6008invokeiuPiT84(int it2) {
                boolean z;
                if (InputMode.m5046equalsimpl0(it2, InputMode.Companion.m5051getTouchaOaMEAU())) {
                    z = AndroidComposeView.this.isInTouchMode();
                } else if (InputMode.m5046equalsimpl0(it2, InputMode.Companion.m5050getKeyboardaOaMEAU())) {
                    z = AndroidComposeView.this.isInTouchMode() ? AndroidComposeView.this.requestFocusFromTouch() : true;
                } else {
                    z = false;
                }
                return Boolean.valueOf(z);
            }
        }, null);
        this.modifierLocalManager = new ModifierLocalManager(this);
        this.textToolbar = new AndroidTextToolbar(this);
        this.layerCache = new WeakCache<>();
        this.endApplyChangesListeners = new MutableObjectList<>(0, 1, null);
        this.resendMotionEventRunnable = new Runnable() { // from class: androidx.compose.ui.platform.AndroidComposeView$resendMotionEventRunnable$1
            @Override // java.lang.Runnable
            public void run() {
                MotionEvent lastMotionEvent;
                int newAction;
                long j;
                AndroidComposeView.this.removeCallbacks(this);
                lastMotionEvent = AndroidComposeView.this.previousMotionEvent;
                if (lastMotionEvent != null) {
                    boolean resend = false;
                    boolean wasMouseEvent = lastMotionEvent.getToolType(0) == 3;
                    int action = lastMotionEvent.getActionMasked();
                    if (wasMouseEvent) {
                        if (action != 10 && action != 1) {
                            resend = true;
                        }
                    } else if (action != 1) {
                        resend = true;
                    }
                    if (resend) {
                        switch (action) {
                            case 7:
                            case 9:
                                newAction = 7;
                                break;
                            case 8:
                            default:
                                newAction = 2;
                                break;
                        }
                        AndroidComposeView androidComposeView = AndroidComposeView.this;
                        j = AndroidComposeView.this.relayoutTime;
                        androidComposeView.sendSimulatedEvent(lastMotionEvent, newAction, j, false);
                    }
                }
            }
        };
        this.sendHoverExitEvent = new Runnable() { // from class: androidx.compose.ui.platform.AndroidComposeView$$ExternalSyntheticLambda3
            @Override // java.lang.Runnable
            public final void run() {
                AndroidComposeView.sendHoverExitEvent$lambda$10(AndroidComposeView.this);
            }
        };
        this.resendMotionEventOnLayout = new Function0<Unit>() { // from class: androidx.compose.ui.platform.AndroidComposeView$resendMotionEventOnLayout$1
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
                MotionEvent lastEvent;
                AndroidComposeView$resendMotionEventRunnable$1 androidComposeView$resendMotionEventRunnable$1;
                lastEvent = AndroidComposeView.this.previousMotionEvent;
                if (lastEvent != null) {
                    switch (lastEvent.getActionMasked()) {
                        case 7:
                        case 9:
                            AndroidComposeView.this.relayoutTime = SystemClock.uptimeMillis();
                            AndroidComposeView androidComposeView = AndroidComposeView.this;
                            androidComposeView$resendMotionEventRunnable$1 = AndroidComposeView.this.resendMotionEventRunnable;
                            androidComposeView.post(androidComposeView$resendMotionEventRunnable$1);
                            return;
                        case 8:
                        default:
                            return;
                    }
                }
            }
        };
        this.matrixToWindow = Build.VERSION.SDK_INT < 29 ? new CalculateMatrixToWindowApi21(this.tmpMatrix, null) : new CalculateMatrixToWindowApi29();
        addOnAttachStateChangeListener(this.contentCaptureManager);
        setWillNotDraw(false);
        setFocusable(true);
        AndroidComposeViewVerificationHelperMethodsO.INSTANCE.focusable(this, 1, false);
        setFocusableInTouchMode(true);
        setClipChildren(false);
        ViewCompat.setAccessibilityDelegate(this, this.composeAccessibilityDelegate);
        Function1<ViewRootForTest, Unit> onViewCreatedCallback = ViewRootForTest.Companion.getOnViewCreatedCallback();
        if (onViewCreatedCallback != null) {
            onViewCreatedCallback.invoke(this);
        }
        setOnDragListener(getDragAndDropManager());
        getRoot().attach$ui_release(this);
        if (Build.VERSION.SDK_INT >= 29) {
            AndroidComposeViewForceDarkModeQ.INSTANCE.disallowForceDark(this);
        }
        this.scrollCapture = Build.VERSION.SDK_INT >= 31 ? new ScrollCapture() : null;
        this.pointerIconService = new PointerIconService() { // from class: androidx.compose.ui.platform.AndroidComposeView$pointerIconService$1
            private PointerIcon currentMouseCursorIcon = PointerIcon.Companion.getDefault();
            private PointerIcon currentStylusHoverIcon;

            @Override // androidx.compose.ui.input.pointer.PointerIconService
            public PointerIcon getIcon() {
                return this.currentMouseCursorIcon;
            }

            @Override // androidx.compose.ui.input.pointer.PointerIconService
            public void setIcon(PointerIcon value) {
                this.currentMouseCursorIcon = value == null ? PointerIcon.Companion.getDefault() : value;
                AndroidComposeViewVerificationHelperMethodsN.INSTANCE.setPointerIcon(AndroidComposeView.this, this.currentMouseCursorIcon);
            }

            @Override // androidx.compose.ui.input.pointer.PointerIconService
            public PointerIcon getStylusHoverIcon() {
                return this.currentStylusHoverIcon;
            }

            @Override // androidx.compose.ui.input.pointer.PointerIconService
            public void setStylusHoverIcon(PointerIcon value) {
                this.currentStylusHoverIcon = value;
            }
        };
    }

    @Override // androidx.compose.ui.node.Owner
    public LayoutNodeDrawScope getSharedDrawScope() {
        return this.sharedDrawScope;
    }

    @Override // androidx.compose.ui.platform.ViewRootForTest
    public View getView() {
        return this;
    }

    private void setDensity(Density density) {
        MutableState $this$setValue$iv = this.density$delegate;
        $this$setValue$iv.setValue(density);
    }

    @Override // androidx.compose.ui.node.Owner, androidx.compose.ui.node.RootForTest
    public Density getDensity() {
        State $this$getValue$iv = this.density$delegate;
        return (Density) $this$getValue$iv.getValue();
    }

    @Override // androidx.compose.ui.node.Owner
    public FocusOwner getFocusOwner() {
        return this.focusOwner;
    }

    @Override // android.view.View
    public int getImportantForAutofill() {
        return 1;
    }

    @Override // androidx.compose.ui.node.Owner
    public CoroutineContext getCoroutineContext() {
        return this.coroutineContext;
    }

    public void setCoroutineContext(CoroutineContext value) {
        Modifier.Node headModifierNode;
        DelegatableNode $this$visitSubtree_u2dY_u2dYKmho_u24default$iv;
        boolean z;
        Modifier.Node headModifierNode2;
        DelegatableNode $this$visitSubtree_u2dY_u2dYKmho_u24default$iv2;
        DelegatingNode this_$iv$iv$iv;
        Modifier.Node headModifierNode3;
        DelegatableNode $this$visitSubtree_u2dY_u2dYKmho_u24default$iv3;
        int count$iv$iv;
        MutableVector mutableVector;
        this.coroutineContext = value;
        Modifier.Node headModifierNode4 = getRoot().getNodes$ui_release().getHead$ui_release();
        if (headModifierNode4 instanceof SuspendingPointerInputModifierNode) {
            ((SuspendingPointerInputModifierNode) headModifierNode4).resetPointerInputHandler();
        }
        Modifier.Node $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4 = headModifierNode4;
        int m5898constructorimpl = NodeKind.m5898constructorimpl(16);
        boolean value$iv$iv$iv = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4.getNode().isAttached();
        if (!value$iv$iv$iv) {
            InlineClassHelperKt.throwIllegalStateException("visitSubtreeIf called on an unattached node");
        }
        MutableVector branches$iv$iv = new MutableVector(new Modifier.Node[16], 0);
        Modifier.Node child$iv$iv = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4.getNode().getChild$ui_release();
        if (child$iv$iv == null) {
            DelegatableNodeKt.access$addLayoutNodeChildren(branches$iv$iv, $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4.getNode(), false);
        } else {
            branches$iv$iv.add(child$iv$iv);
        }
        while (true) {
            boolean z2 = true;
            MutableVector this_$iv$iv$iv2 = branches$iv$iv.getSize() != 0 ? 1 : null;
            if (this_$iv$iv$iv2 == null) {
                return;
            }
            Modifier.Node branch$iv$iv = (Modifier.Node) branches$iv$iv.removeAt(branches$iv$iv.getSize() - 1);
            if ((branch$iv$iv.getAggregateChildKindSet$ui_release() & m5898constructorimpl) != 0) {
                Modifier.Node node$iv$iv = branch$iv$iv;
                while (node$iv$iv != null) {
                    if ((node$iv$iv.getKindSet$ui_release() & m5898constructorimpl) == 0) {
                        headModifierNode = headModifierNode4;
                        $this$visitSubtree_u2dY_u2dYKmho_u24default$iv = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4;
                        z = z2;
                    } else {
                        Modifier.Node it$iv = node$iv$iv;
                        MutableVector mutableVector2 = null;
                        Modifier.Node node = it$iv;
                        while (node != null) {
                            if (node instanceof PointerInputModifierNode) {
                                PointerInputModifierNode it = (PointerInputModifierNode) node;
                                if (it instanceof SuspendingPointerInputModifierNode) {
                                    ((SuspendingPointerInputModifierNode) it).resetPointerInputHandler();
                                }
                                headModifierNode2 = headModifierNode4;
                                $this$visitSubtree_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4;
                            } else {
                                Modifier.Node this_$iv$iv$iv3 = node;
                                if (!((this_$iv$iv$iv3.getKindSet$ui_release() & m5898constructorimpl) != 0) || !(node instanceof DelegatingNode)) {
                                    headModifierNode2 = headModifierNode4;
                                    $this$visitSubtree_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4;
                                } else {
                                    int count$iv$iv2 = 0;
                                    DelegatingNode this_$iv$iv$iv4 = (DelegatingNode) node;
                                    Modifier.Node node$iv$iv$iv = this_$iv$iv$iv4.getDelegate$ui_release();
                                    while (node$iv$iv$iv != null) {
                                        Modifier.Node next$iv$iv = node$iv$iv$iv;
                                        if (!((next$iv$iv.getKindSet$ui_release() & m5898constructorimpl) != 0)) {
                                            this_$iv$iv$iv = this_$iv$iv$iv4;
                                            headModifierNode3 = headModifierNode4;
                                            $this$visitSubtree_u2dY_u2dYKmho_u24default$iv3 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4;
                                        } else {
                                            count$iv$iv2++;
                                            this_$iv$iv$iv = this_$iv$iv$iv4;
                                            if (count$iv$iv2 == 1) {
                                                node = next$iv$iv;
                                                headModifierNode3 = headModifierNode4;
                                                $this$visitSubtree_u2dY_u2dYKmho_u24default$iv3 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4;
                                            } else {
                                                if (mutableVector2 == null) {
                                                    count$iv$iv = count$iv$iv2;
                                                    headModifierNode3 = headModifierNode4;
                                                    $this$visitSubtree_u2dY_u2dYKmho_u24default$iv3 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4;
                                                    mutableVector = new MutableVector(new Modifier.Node[16], 0);
                                                } else {
                                                    count$iv$iv = count$iv$iv2;
                                                    headModifierNode3 = headModifierNode4;
                                                    $this$visitSubtree_u2dY_u2dYKmho_u24default$iv3 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4;
                                                    mutableVector = mutableVector2;
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
                                        this_$iv$iv$iv4 = this_$iv$iv$iv;
                                        headModifierNode4 = headModifierNode3;
                                        $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv3;
                                    }
                                    headModifierNode2 = headModifierNode4;
                                    $this$visitSubtree_u2dY_u2dYKmho_u24default$iv2 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4;
                                    if (count$iv$iv2 == 1) {
                                        headModifierNode4 = headModifierNode2;
                                        $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv2;
                                    }
                                }
                            }
                            node = DelegatableNodeKt.access$pop(mutableVector2);
                            headModifierNode4 = headModifierNode2;
                            $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv2;
                        }
                        headModifierNode = headModifierNode4;
                        $this$visitSubtree_u2dY_u2dYKmho_u24default$iv = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4;
                        z = true;
                        if (1 == 0) {
                            headModifierNode4 = headModifierNode;
                            $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv;
                            break;
                        }
                    }
                    node$iv$iv = node$iv$iv.getChild$ui_release();
                    z2 = z;
                    headModifierNode4 = headModifierNode;
                    $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv;
                }
            }
            DelegatableNodeKt.access$addLayoutNodeChildren(branches$iv$iv, branch$iv$iv, false);
            headModifierNode4 = headModifierNode4;
            $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4 = $this$visitSubtree_u2dY_u2dYKmho_u24default$iv4;
        }
    }

    @Override // androidx.compose.ui.node.Owner
    public AndroidDragAndDropManager getDragAndDropManager() {
        return this.dragAndDropManager;
    }

    @Override // androidx.compose.ui.node.Owner
    public WindowInfo getWindowInfo() {
        return this._windowInfo;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: onMoveFocusInChildren-3ESFkO8  reason: not valid java name */
    public final boolean m6003onMoveFocusInChildren3ESFkO8(int focusDirection) {
        AndroidViewsHandler androidViewsHandler;
        android.graphics.Rect focusedRect;
        View nextView;
        View nextView2;
        if (!ComposeUiFlags.isViewFocusFixEnabled) {
            if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3937getEnterdhqQ8s()) || FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3938getExitdhqQ8s())) {
                return false;
            }
            Integer m3944toAndroidFocusDirection3ESFkO8 = FocusInteropUtils_androidKt.m3944toAndroidFocusDirection3ESFkO8(focusDirection);
            if (m3944toAndroidFocusDirection3ESFkO8 != null) {
                int direction = m3944toAndroidFocusDirection3ESFkO8.intValue();
                Rect onFetchFocusRect = onFetchFocusRect();
                focusedRect = onFetchFocusRect != null ? RectHelper_androidKt.toAndroidRect(onFetchFocusRect) : null;
                FocusFinder it = FocusFinder.getInstance();
                if (focusedRect == null) {
                    nextView2 = it.findNextFocus(this, findFocus(), direction);
                } else {
                    nextView2 = it.findNextFocusFromRect(this, focusedRect, direction);
                }
                if (nextView2 != null) {
                    return FocusInteropUtils_androidKt.requestInteropFocus(nextView2, Integer.valueOf(direction), focusedRect);
                }
                return false;
            }
            throw new IllegalStateException("Invalid focus direction".toString());
        } else if (FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3937getEnterdhqQ8s()) || FocusDirection.m3932equalsimpl0(focusDirection, FocusDirection.Companion.m3938getExitdhqQ8s()) || !hasFocus() || (androidViewsHandler = this._androidViewsHandler) == null) {
            return false;
        } else {
            Integer m3944toAndroidFocusDirection3ESFkO82 = FocusInteropUtils_androidKt.m3944toAndroidFocusDirection3ESFkO8(focusDirection);
            if (m3944toAndroidFocusDirection3ESFkO82 != null) {
                int direction2 = m3944toAndroidFocusDirection3ESFkO82.intValue();
                View rootView = getRootView();
                Intrinsics.checkNotNull(rootView, "null cannot be cast to non-null type android.view.ViewGroup");
                ViewGroup root = (ViewGroup) rootView;
                View currentFocus = root.findFocus();
                if (currentFocus == null) {
                    throw new IllegalStateException("view hasFocus but root can't find it".toString());
                }
                FocusFinder focusFinder = FocusFinder.getInstance();
                if (FocusOwnerImplKt.m3956is1dFocusSearch3ESFkO8(focusDirection) && androidViewsHandler.hasFocus()) {
                    focusedRect = null;
                    nextView = focusFinder.findNextFocus(root, currentFocus, direction2);
                } else {
                    Rect onFetchFocusRect2 = onFetchFocusRect();
                    focusedRect = onFetchFocusRect2 != null ? RectHelper_androidKt.toAndroidRect(onFetchFocusRect2) : null;
                    nextView = focusFinder.findNextFocusFromRect(root, focusedRect, direction2);
                    if (nextView != null) {
                        nextView.getLocationInWindow(this.tmpPositionArray);
                    }
                    int nextPositionX = this.tmpPositionArray[0];
                    int nextPositionY = this.tmpPositionArray[1];
                    getLocationInWindow(this.tmpPositionArray);
                    if (focusedRect != null) {
                        focusedRect.offset(this.tmpPositionArray[0] - nextPositionX, this.tmpPositionArray[1] - nextPositionY);
                    }
                }
                if (nextView == null || nextView == currentFocus) {
                    return false;
                }
                View focusedChild = androidViewsHandler.getFocusedChild();
                ViewParent nextParent = nextView.getParent();
                while (nextParent != null && nextParent != focusedChild) {
                    nextParent = nextParent.getParent();
                }
                if (nextParent == null) {
                    return false;
                }
                return FocusInteropUtils_androidKt.requestInteropFocus(nextView, Integer.valueOf(direction2), focusedRect);
            }
            throw new IllegalStateException("Invalid focus direction".toString());
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Rect onFetchFocusRect() {
        if (isFocused()) {
            return getFocusOwner().getFocusRect();
        }
        View findFocus = findFocus();
        if (findFocus != null) {
            return FocusInteropUtils_androidKt.calculateBoundingRectRelativeTo(findFocus, this);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final View findNextNonChildView(int direction) {
        AndroidComposeView currentView = this;
        FocusFinder focusFinder = FocusFinder.getInstance();
        while (currentView != null) {
            View rootView = getRootView();
            Intrinsics.checkNotNull(rootView, "null cannot be cast to non-null type android.view.ViewGroup");
            currentView = focusFinder.findNextFocus((ViewGroup) rootView, currentView, direction);
            if (currentView != null && !AndroidComposeView_androidKt.access$containsDescendant(this, currentView)) {
                return currentView;
            }
        }
        return null;
    }

    @Override // androidx.compose.ui.node.Owner
    public ViewConfiguration getViewConfiguration() {
        return this.viewConfiguration;
    }

    @Override // androidx.compose.ui.node.Owner
    public LayoutNode getRoot() {
        return this.root;
    }

    @Override // androidx.compose.ui.node.Owner
    public MutableIntObjectMap<LayoutNode> getLayoutNodes() {
        return this.layoutNodes;
    }

    @Override // androidx.compose.ui.node.Owner
    public RectManager getRectManager() {
        return this.rectManager;
    }

    @Override // androidx.compose.ui.node.Owner
    public RootForTest getRootForTest() {
        return this.rootForTest;
    }

    @Override // androidx.compose.ui.node.Owner, androidx.compose.ui.node.RootForTest
    public SemanticsOwner getSemanticsOwner() {
        return this.semanticsOwner;
    }

    public final AndroidContentCaptureManager getContentCaptureManager$ui_release() {
        return this.contentCaptureManager;
    }

    public final void setContentCaptureManager$ui_release(AndroidContentCaptureManager androidContentCaptureManager) {
        this.contentCaptureManager = androidContentCaptureManager;
    }

    @Override // androidx.compose.ui.node.Owner
    public AndroidAccessibilityManager getAccessibilityManager() {
        return this.accessibilityManager;
    }

    @Override // androidx.compose.ui.node.Owner
    public GraphicsContext getGraphicsContext() {
        return this.graphicsContext;
    }

    @Override // androidx.compose.ui.node.Owner
    public AutofillTree getAutofillTree() {
        return this.autofillTree;
    }

    public final Function1<Configuration, Unit> getConfigurationChangeObserver() {
        return this.configurationChangeObserver;
    }

    public final void setConfigurationChangeObserver(Function1<? super Configuration, Unit> function1) {
        this.configurationChangeObserver = function1;
    }

    public final AndroidAutofillManager get_autofillManager$ui_release() {
        return this._autofillManager;
    }

    @Override // androidx.compose.ui.node.Owner
    public Autofill getAutofill() {
        return this._autofill;
    }

    @Override // androidx.compose.ui.node.Owner
    public androidx.compose.ui.autofill.AutofillManager getAutofillManager() {
        return this._autofillManager;
    }

    @Override // androidx.compose.ui.node.Owner
    public AndroidClipboardManager getClipboardManager() {
        return this.clipboardManager;
    }

    @Override // androidx.compose.ui.node.Owner
    public AndroidClipboard getClipboard() {
        return this.clipboard;
    }

    @Override // androidx.compose.ui.node.Owner
    public OwnerSnapshotObserver getSnapshotObserver() {
        return this.snapshotObserver;
    }

    @Override // androidx.compose.ui.node.Owner
    public boolean getShowLayoutBounds() {
        return this.showLayoutBounds;
    }

    @Override // androidx.compose.ui.node.Owner
    public void setShowLayoutBounds(boolean z) {
        this.showLayoutBounds = z;
    }

    public final AndroidViewsHandler getAndroidViewsHandler$ui_release() {
        if (this._androidViewsHandler == null) {
            this._androidViewsHandler = new AndroidViewsHandler(getContext());
            addView(this._androidViewsHandler);
            requestLayout();
        }
        AndroidViewsHandler androidViewsHandler = this._androidViewsHandler;
        Intrinsics.checkNotNull(androidViewsHandler);
        return androidViewsHandler;
    }

    @Override // androidx.compose.ui.node.Owner
    public long getMeasureIteration() {
        return this.measureAndLayoutDelegate.getMeasureIteration();
    }

    @Override // androidx.compose.ui.platform.ViewRootForTest
    public boolean getHasPendingMeasureOrLayout() {
        return this.measureAndLayoutDelegate.getHasPendingMeasureOrLayout();
    }

    public final long getLastMatrixRecalculationAnimationTime$ui_release() {
        return this.lastMatrixRecalculationAnimationTime;
    }

    public final void setLastMatrixRecalculationAnimationTime$ui_release(long j) {
        this.lastMatrixRecalculationAnimationTime = j;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final ViewTreeOwners get_viewTreeOwners() {
        State $this$getValue$iv = this._viewTreeOwners$delegate;
        return (ViewTreeOwners) $this$getValue$iv.getValue();
    }

    private final void set_viewTreeOwners(ViewTreeOwners viewTreeOwners) {
        MutableState $this$setValue$iv = this._viewTreeOwners$delegate;
        $this$setValue$iv.setValue(viewTreeOwners);
    }

    public final ViewTreeOwners getViewTreeOwners() {
        State $this$getValue$iv = this.viewTreeOwners$delegate;
        return (ViewTreeOwners) $this$getValue$iv.getValue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void touchModeChangeListener$lambda$8(AndroidComposeView this$0, boolean touchMode) {
        InputModeManagerImpl inputModeManagerImpl = this$0._inputModeManager;
        InputMode.Companion companion = InputMode.Companion;
        inputModeManagerImpl.m5054setInputModeiuPiT84(touchMode ? companion.m5051getTouchaOaMEAU() : companion.m5050getKeyboardaOaMEAU());
    }

    @Override // androidx.compose.ui.node.Owner, androidx.compose.ui.node.RootForTest
    public TextInputService getTextInputService() {
        return this.textInputService;
    }

    @Override // androidx.compose.ui.node.Owner
    public SoftwareKeyboardController getSoftwareKeyboardController() {
        return this.softwareKeyboardController;
    }

    @Override // androidx.compose.ui.node.Owner
    public Placeable.PlacementScope getPlacementScope() {
        return PlaceableKt.PlacementScope(this);
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0024  */
    /* JADX WARN: Removed duplicated region for block: B:12:0x002c  */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0030  */
    @Override // androidx.compose.ui.node.Owner
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object textInputSession(kotlin.jvm.functions.Function2<? super androidx.compose.ui.platform.PlatformTextInputSessionScope, ? super kotlin.coroutines.Continuation<?>, ? extends java.lang.Object> r7, kotlin.coroutines.Continuation<?> r8) {
        /*
            r6 = this;
            boolean r0 = r8 instanceof androidx.compose.ui.platform.AndroidComposeView$textInputSession$1
            if (r0 == 0) goto L14
            r0 = r8
            androidx.compose.ui.platform.AndroidComposeView$textInputSession$1 r0 = (androidx.compose.ui.platform.AndroidComposeView$textInputSession$1) r0
            int r1 = r0.label
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r1 = r1 & r2
            if (r1 == 0) goto L14
            int r1 = r0.label
            int r1 = r1 - r2
            r0.label = r1
            goto L19
        L14:
            androidx.compose.ui.platform.AndroidComposeView$textInputSession$1 r0 = new androidx.compose.ui.platform.AndroidComposeView$textInputSession$1
            r0.<init>(r6, r8)
        L19:
            java.lang.Object r1 = r0.result
            java.lang.Object r2 = kotlin.coroutines.intrinsics.IntrinsicsKt.getCOROUTINE_SUSPENDED()
            int r3 = r0.label
            switch(r3) {
                case 0: goto L30;
                case 1: goto L2c;
                default: goto L24;
            }
        L24:
            java.lang.IllegalStateException r7 = new java.lang.IllegalStateException
            java.lang.String r0 = "call to 'resume' before 'invoke' with coroutine"
            r7.<init>(r0)
            throw r7
        L2c:
            kotlin.ResultKt.throwOnFailure(r1)
            goto L48
        L30:
            kotlin.ResultKt.throwOnFailure(r1)
            r3 = r6
            java.util.concurrent.atomic.AtomicReference<androidx.compose.ui.SessionMutex$Session<T>> r4 = r3.textInputSessionMutex
            androidx.compose.ui.platform.AndroidComposeView$textInputSession$2 r5 = new androidx.compose.ui.platform.AndroidComposeView$textInputSession$2
            r5.<init>()
            kotlin.jvm.functions.Function1 r5 = (kotlin.jvm.functions.Function1) r5
            r3 = 1
            r0.label = r3
            java.lang.Object r7 = androidx.compose.ui.SessionMutex.m3875withSessionCancellingPreviousimpl(r4, r5, r7, r0)
            if (r7 != r2) goto L48
            return r2
        L48:
            kotlin.KotlinNothingValueException r7 = new kotlin.KotlinNothingValueException
            r7.<init>()
            throw r7
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.platform.AndroidComposeView.textInputSession(kotlin.jvm.functions.Function2, kotlin.coroutines.Continuation):java.lang.Object");
    }

    @Override // androidx.compose.ui.node.Owner
    public Font.ResourceLoader getFontLoader() {
        return this.fontLoader;
    }

    private void setFontFamilyResolver(FontFamily.Resolver resolver) {
        MutableState $this$setValue$iv = this.fontFamilyResolver$delegate;
        $this$setValue$iv.setValue(resolver);
    }

    @Override // androidx.compose.ui.node.Owner
    public FontFamily.Resolver getFontFamilyResolver() {
        State $this$getValue$iv = this.fontFamilyResolver$delegate;
        return (FontFamily.Resolver) $this$getValue$iv.getValue();
    }

    private final int getFontWeightAdjustmentCompat(Configuration $this$fontWeightAdjustmentCompat) {
        if (Build.VERSION.SDK_INT >= 31) {
            return $this$fontWeightAdjustmentCompat.fontWeightAdjustment;
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setLayoutDirection(LayoutDirection layoutDirection) {
        MutableState $this$setValue$iv = this.layoutDirection$delegate;
        $this$setValue$iv.setValue(layoutDirection);
    }

    @Override // android.view.View, android.view.ViewParent, androidx.compose.ui.node.Owner
    public LayoutDirection getLayoutDirection() {
        State $this$getValue$iv = this.layoutDirection$delegate;
        return (LayoutDirection) $this$getValue$iv.getValue();
    }

    @Override // androidx.compose.ui.node.Owner
    public HapticFeedback getHapticFeedBack() {
        return this.hapticFeedBack;
    }

    @Override // androidx.compose.ui.node.Owner
    public InputModeManager getInputModeManager() {
        return this._inputModeManager;
    }

    @Override // androidx.compose.ui.node.Owner
    public ModifierLocalManager getModifierLocalManager() {
        return this.modifierLocalManager;
    }

    @Override // androidx.compose.ui.node.Owner
    public TextToolbar getTextToolbar() {
        return this.textToolbar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static final void sendHoverExitEvent$lambda$10(AndroidComposeView this$0) {
        this$0.hoverExitReceived = false;
        MotionEvent lastEvent = this$0.previousMotionEvent;
        Intrinsics.checkNotNull(lastEvent);
        if (!(lastEvent.getActionMasked() == 10)) {
            throw new IllegalStateException("The ACTION_HOVER_EXIT event was not cleared.".toString());
        }
        this$0.m6006sendMotionEvent8iAsVTc(lastEvent);
    }

    @Override // android.view.View
    public void getFocusedRect(android.graphics.Rect rect) {
        Unit unit;
        Rect $this$getFocusedRect_u24lambda_u2411 = onFetchFocusRect();
        if ($this$getFocusedRect_u24lambda_u2411 != null) {
            float $this$fastRoundToInt$iv = $this$getFocusedRect_u24lambda_u2411.getLeft();
            rect.left = Math.round($this$fastRoundToInt$iv);
            float $this$fastRoundToInt$iv2 = $this$getFocusedRect_u24lambda_u2411.getTop();
            rect.top = Math.round($this$fastRoundToInt$iv2);
            float $this$fastRoundToInt$iv3 = $this$getFocusedRect_u24lambda_u2411.getRight();
            rect.right = Math.round($this$fastRoundToInt$iv3);
            float $this$fastRoundToInt$iv4 = $this$getFocusedRect_u24lambda_u2411.getBottom();
            rect.bottom = Math.round($this$fastRoundToInt$iv4);
            unit = Unit.INSTANCE;
        } else {
            unit = null;
        }
        if (unit == null) {
            super.getFocusedRect(rect);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchProvideStructure(ViewStructure structure) {
        if (Build.VERSION.SDK_INT < 28) {
            AndroidComposeViewAssistHelperMethodsO.INSTANCE.setClassName(structure, getView());
        } else {
            super.dispatchProvideStructure(structure);
        }
    }

    public final boolean getScrollCaptureInProgress$ui_release() {
        ScrollCapture scrollCapture;
        if (Build.VERSION.SDK_INT < 31 || (scrollCapture = this.scrollCapture) == null) {
            return false;
        }
        return scrollCapture.getScrollCaptureInProgress();
    }

    @Override // android.view.View
    public void onScrollCaptureSearch(android.graphics.Rect localVisibleRect, Point windowOffset, Consumer<ScrollCaptureTarget> consumer) {
        ScrollCapture scrollCapture;
        if (Build.VERSION.SDK_INT >= 31 && (scrollCapture = this.scrollCapture) != null) {
            scrollCapture.onScrollCaptureSearch(this, getSemanticsOwner(), getCoroutineContext(), consumer);
        }
    }

    @Override // androidx.lifecycle.DefaultLifecycleObserver
    public void onResume(LifecycleOwner owner) {
        setShowLayoutBounds(Companion.getIsShowingLayoutBounds());
    }

    /* JADX WARN: Code restructure failed: missing block: B:21:0x0062, code lost:
        if (r0 == null) goto L31;
     */
    @Override // android.view.ViewGroup, android.view.ViewParent
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.view.View focusSearch(android.view.View r8, int r9) {
        /*
            r7 = this;
            if (r8 == 0) goto L98
            androidx.compose.ui.node.MeasureAndLayoutDelegate r0 = r7.measureAndLayoutDelegate
            boolean r0 = r0.getDuringMeasureLayout$ui_release()
            if (r0 == 0) goto Lc
            goto L98
        Lc:
            android.view.FocusFinder r0 = android.view.FocusFinder.getInstance()
            r1 = r7
            android.view.ViewGroup r1 = (android.view.ViewGroup) r1
            android.view.View r0 = r0.findNextFocus(r1, r8, r9)
            if (r8 != r7) goto L2b
            androidx.compose.ui.focus.FocusOwner r1 = r7.getFocusOwner()
            androidx.compose.ui.geometry.Rect r1 = r1.getFocusRect()
            if (r1 != 0) goto L32
            r1 = r7
            android.view.View r1 = (android.view.View) r1
            androidx.compose.ui.geometry.Rect r1 = androidx.compose.ui.focus.FocusInteropUtils_androidKt.calculateBoundingRectRelativeTo(r8, r1)
            goto L32
        L2b:
            r1 = r7
            android.view.View r1 = (android.view.View) r1
            androidx.compose.ui.geometry.Rect r1 = androidx.compose.ui.focus.FocusInteropUtils_androidKt.calculateBoundingRectRelativeTo(r8, r1)
        L32:
            androidx.compose.ui.focus.FocusDirection r2 = androidx.compose.ui.focus.FocusInteropUtils_androidKt.toFocusDirection(r9)
            if (r2 == 0) goto L3f
            int r2 = r2.m3935unboximpl()
            goto L45
        L3f:
            androidx.compose.ui.focus.FocusDirection$Companion r2 = androidx.compose.ui.focus.FocusDirection.Companion
            int r2 = r2.m3936getDowndhqQ8s()
        L45:
            kotlin.jvm.internal.Ref$ObjectRef r3 = new kotlin.jvm.internal.Ref$ObjectRef
            r3.<init>()
            androidx.compose.ui.focus.FocusOwner r4 = r7.getFocusOwner()
            androidx.compose.ui.platform.AndroidComposeView$focusSearch$searchResult$1 r5 = new androidx.compose.ui.platform.AndroidComposeView$focusSearch$searchResult$1
            r5.<init>()
            kotlin.jvm.functions.Function1 r5 = (kotlin.jvm.functions.Function1) r5
            java.lang.Boolean r4 = r4.mo3950focusSearchULY8qGw(r2, r1, r5)
            if (r4 != 0) goto L5e
            goto L64
        L5e:
            T r5 = r3.element
            if (r5 != 0) goto L66
            if (r0 != 0) goto L96
        L64:
            r5 = r8
            goto L97
        L66:
            if (r0 != 0) goto L6c
            r5 = r7
            android.view.View r5 = (android.view.View) r5
            goto L97
        L6c:
            boolean r5 = androidx.compose.ui.focus.FocusOwnerImplKt.m3956is1dFocusSearch3ESFkO8(r2)
            if (r5 == 0) goto L77
            android.view.View r5 = super.focusSearch(r8, r9)
            goto L97
        L77:
            T r5 = r3.element
            kotlin.jvm.internal.Intrinsics.checkNotNull(r5)
            androidx.compose.ui.focus.FocusTargetNode r5 = (androidx.compose.ui.focus.FocusTargetNode) r5
            androidx.compose.ui.geometry.Rect r5 = androidx.compose.ui.focus.FocusTraversalKt.focusRect(r5)
            r6 = r7
            android.view.View r6 = (android.view.View) r6
            androidx.compose.ui.geometry.Rect r6 = androidx.compose.ui.focus.FocusInteropUtils_androidKt.calculateBoundingRectRelativeTo(r0, r6)
            boolean r5 = androidx.compose.ui.focus.TwoDimensionalFocusSearchKt.m3996isBetterCandidateI7lrPNg(r5, r6, r1, r2)
            if (r5 == 0) goto L95
            r5 = r7
            android.view.View r5 = (android.view.View) r5
            goto L97
        L95:
        L96:
            r5 = r0
        L97:
            return r5
        L98:
            android.view.View r0 = super.focusSearch(r8, r9)
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.platform.AndroidComposeView.focusSearch(android.view.View, int):android.view.View");
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean requestFocus(int direction, android.graphics.Rect previouslyFocusedRect) {
        if (!ComposeUiFlags.isViewFocusFixEnabled) {
            if (isFocused()) {
                return true;
            }
            if (getFocusOwner().getRootState().getHasFocus()) {
                return super.requestFocus(direction, previouslyFocusedRect);
            }
            FocusDirection focusDirection = FocusInteropUtils_androidKt.toFocusDirection(direction);
            final int focusDirection2 = focusDirection != null ? focusDirection.m3935unboximpl() : FocusDirection.Companion.m3937getEnterdhqQ8s();
            return Intrinsics.areEqual((Object) getFocusOwner().mo3950focusSearchULY8qGw(focusDirection2, previouslyFocusedRect != null ? RectHelper_androidKt.toComposeRect(previouslyFocusedRect) : null, new Function1<FocusTargetNode, Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeView$requestFocus$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Boolean invoke(FocusTargetNode it) {
                    return Boolean.valueOf(it.mo3963requestFocus3ESFkO8(focusDirection2));
                }
            }), (Object) true);
        } else if (isFocused()) {
            return true;
        } else {
            if (this.processingRequestFocusForNextNonChildView || getFocusOwner().getFocusTransactionManager().getOngoingTransaction()) {
                return false;
            }
            FocusDirection focusDirection3 = FocusInteropUtils_androidKt.toFocusDirection(direction);
            final int focusDirection4 = focusDirection3 != null ? focusDirection3.m3935unboximpl() : FocusDirection.Companion.m3937getEnterdhqQ8s();
            if (hasFocus() && m6003onMoveFocusInChildren3ESFkO8(focusDirection4)) {
                return true;
            }
            final Ref.BooleanRef foundFocusable = new Ref.BooleanRef();
            Boolean focusSearchResult = getFocusOwner().mo3950focusSearchULY8qGw(focusDirection4, previouslyFocusedRect != null ? RectHelper_androidKt.toComposeRect(previouslyFocusedRect) : null, new Function1<FocusTargetNode, Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeView$requestFocus$focusSearchResult$1
                /* JADX INFO: Access modifiers changed from: package-private */
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super(1);
                }

                @Override // kotlin.jvm.functions.Function1
                public final Boolean invoke(FocusTargetNode it) {
                    Ref.BooleanRef.this.element = true;
                    return Boolean.valueOf(it.mo3963requestFocus3ESFkO8(focusDirection4));
                }
            });
            if (focusSearchResult == null) {
                return false;
            }
            if (focusSearchResult.booleanValue()) {
                return true;
            }
            if (foundFocusable.element) {
                return false;
            }
            if (previouslyFocusedRect != null && !hasFocus()) {
                Boolean altFocus = getFocusOwner().mo3950focusSearchULY8qGw(focusDirection4, null, new Function1<FocusTargetNode, Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeView$requestFocus$altFocus$1
                    /* JADX INFO: Access modifiers changed from: package-private */
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super(1);
                    }

                    @Override // kotlin.jvm.functions.Function1
                    public final Boolean invoke(FocusTargetNode it) {
                        return Boolean.valueOf(it.mo3963requestFocus3ESFkO8(focusDirection4));
                    }
                });
                if (Intrinsics.areEqual((Object) altFocus, (Object) true)) {
                    return true;
                }
            }
            View nextFocusedView = findNextNonChildView(direction);
            if (nextFocusedView == null || nextFocusedView == this) {
                return true;
            }
            this.processingRequestFocusForNextNonChildView = true;
            boolean requestFocusResult = nextFocusedView.requestFocus(direction);
            this.processingRequestFocusForNextNonChildView = false;
            return requestFocusResult;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: onRequestFocusForOwner-7o62pno  reason: not valid java name */
    public final boolean m6004onRequestFocusForOwner7o62pno(FocusDirection focusDirection, Rect previouslyFocusedRect) {
        Integer m3944toAndroidFocusDirection3ESFkO8;
        if (isFocused() || hasFocus()) {
            return true;
        }
        return super.requestFocus((focusDirection == null || (m3944toAndroidFocusDirection3ESFkO8 = FocusInteropUtils_androidKt.m3944toAndroidFocusDirection3ESFkO8(focusDirection.m3935unboximpl())) == null) ? Property.ALIGN_CONTENT : m3944toAndroidFocusDirection3ESFkO8.intValue(), previouslyFocusedRect != null ? RectHelper_androidKt.toAndroidRect(previouslyFocusedRect) : null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void onClearFocusForOwner() {
        if (isFocused() || (!ComposeUiFlags.isViewFocusFixEnabled && hasFocus())) {
            super.clearFocus();
        } else if (hasFocus()) {
            View findFocus = findFocus();
            if (findFocus != null) {
                findFocus.clearFocus();
            }
            super.clearFocus();
        }
    }

    @Override // android.view.View
    protected void onFocusChanged(boolean gainFocus, int direction, android.graphics.Rect previouslyFocusedRect) {
        super.onFocusChanged(gainFocus, direction, previouslyFocusedRect);
        if (!gainFocus && !hasFocus()) {
            getFocusOwner().releaseFocus();
        }
    }

    @Override // android.view.View
    public void onWindowFocusChanged(boolean hasWindowFocus) {
        boolean newShowLayoutBounds;
        this._windowInfo.setWindowFocused(hasWindowFocus);
        this.keyboardModifiersRequireUpdate = true;
        super.onWindowFocusChanged(hasWindowFocus);
        if (hasWindowFocus && getShowLayoutBounds() != (newShowLayoutBounds = Companion.getIsShowingLayoutBounds())) {
            setShowLayoutBounds(newShowLayoutBounds);
            invalidateDescendants();
        }
    }

    @Override // androidx.compose.ui.node.RootForTest
    /* renamed from: sendKeyEvent-ZmokQxo */
    public boolean mo5960sendKeyEventZmokQxo(android.view.KeyEvent keyEvent) {
        return getFocusOwner().mo3948dispatchInterceptedSoftKeyboardEventZmokQxo(keyEvent) || FocusOwner.m3946dispatchKeyEventYhN2O0w$default(getFocusOwner(), keyEvent, null, 2, null);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEvent(final android.view.KeyEvent event) {
        if (isFocused()) {
            this._windowInfo.m6055setKeyboardModifiers5xRPYO0(PointerKeyboardModifiers.m5574constructorimpl(event.getMetaState()));
            return FocusOwner.m3946dispatchKeyEventYhN2O0w$default(getFocusOwner(), KeyEvent.m5352constructorimpl(event), null, 2, null) || super.dispatchKeyEvent(event);
        }
        return getFocusOwner().mo3949dispatchKeyEventYhN2O0w(KeyEvent.m5352constructorimpl(event), new Function0<Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeView$dispatchKeyEvent$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                boolean dispatchKeyEvent;
                dispatchKeyEvent = super/*android.view.ViewGroup*/.dispatchKeyEvent(event);
                return Boolean.valueOf(dispatchKeyEvent);
            }
        });
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchKeyEventPreIme(android.view.KeyEvent event) {
        return (isFocused() && getFocusOwner().mo3948dispatchInterceptedSoftKeyboardEventZmokQxo(KeyEvent.m5352constructorimpl(event))) || super.dispatchKeyEventPreIme(event);
    }

    @Override // androidx.compose.ui.node.RootForTest
    public void forceAccessibilityForTesting(boolean enable) {
        this.composeAccessibilityDelegate.setAccessibilityForceEnabledForTesting$ui_release(enable);
    }

    @Override // androidx.compose.ui.node.RootForTest
    public void setAccessibilityEventBatchIntervalMillis(long intervalMillis) {
        this.composeAccessibilityDelegate.setSendRecurringAccessibilityEventsIntervalMillis$ui_release(intervalMillis);
    }

    @Override // androidx.compose.ui.node.Owner
    public void onPreAttach(LayoutNode node) {
        getLayoutNodes().set(node.getSemanticsId(), node);
    }

    @Override // androidx.compose.ui.node.Owner
    public void onPostAttach(LayoutNode node) {
        AndroidAutofillManager androidAutofillManager;
        if (!autofillSupported() || !ComposeUiFlags.isSemanticAutofillEnabled || (androidAutofillManager = this._autofillManager) == null) {
            return;
        }
        androidAutofillManager.onPostAttach$ui_release(node);
    }

    @Override // androidx.compose.ui.node.Owner
    public void onDetach(LayoutNode node) {
        AndroidAutofillManager androidAutofillManager;
        getLayoutNodes().remove(node.getSemanticsId());
        this.measureAndLayoutDelegate.onNodeDetached(node);
        requestClearInvalidObservations();
        if (ComposeUiFlags.isRectTrackingEnabled) {
            getRectManager().remove(node);
        }
        if (!autofillSupported() || !ComposeUiFlags.isSemanticAutofillEnabled || (androidAutofillManager = this._autofillManager) == null) {
            return;
        }
        androidAutofillManager.onDetach$ui_release(node);
    }

    @Override // androidx.compose.ui.node.Owner
    public void requestAutofill(LayoutNode node) {
        AndroidAutofillManager androidAutofillManager;
        if (!autofillSupported() || !ComposeUiFlags.isSemanticAutofillEnabled || (androidAutofillManager = this._autofillManager) == null) {
            return;
        }
        androidAutofillManager.requestAutofill$ui_release(node);
    }

    public final void requestClearInvalidObservations() {
        this.observationClearRequested = true;
    }

    @Override // androidx.compose.ui.node.Owner
    public void onEndApplyChanges() {
        MutableObjectList<Function0<Unit>> mutableObjectList;
        AndroidAutofillManager androidAutofillManager;
        if (this.observationClearRequested) {
            getSnapshotObserver().clearInvalidObservations$ui_release();
            this.observationClearRequested = false;
        }
        AndroidViewsHandler childAndroidViews = this._androidViewsHandler;
        if (childAndroidViews != null) {
            clearChildInvalidObservations(childAndroidViews);
        }
        if (autofillSupported() && ComposeUiFlags.isSemanticAutofillEnabled && (androidAutofillManager = this._autofillManager) != null) {
            androidAutofillManager.onEndApplyChanges$ui_release();
        }
        while (this.endApplyChangesListeners.isNotEmpty() && this.endApplyChangesListeners.get(0) != null) {
            int size = this.endApplyChangesListeners.getSize();
            int i = 0;
            while (true) {
                mutableObjectList = this.endApplyChangesListeners;
                if (i < size) {
                    Function0 listener = mutableObjectList.get(i);
                    this.endApplyChangesListeners.set(i, null);
                    if (listener != null) {
                        listener.invoke();
                    }
                    i++;
                }
            }
            mutableObjectList.removeRange(0, size);
        }
    }

    @Override // androidx.compose.ui.node.Owner
    public void registerOnEndApplyChangesListener(Function0<Unit> function0) {
        if (!this.endApplyChangesListeners.contains(function0)) {
            MutableObjectList this_$iv = this.endApplyChangesListeners;
            this_$iv.add(function0);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* renamed from: startDrag-12SF9DM  reason: not valid java name */
    public final boolean m6007startDrag12SF9DM(DragAndDropTransferData transferData, long decorationSize, Function1<? super DrawScope, Unit> function1) {
        Resources $this$startDrag_12SF9DM_u24lambda_u2413 = getContext().getResources();
        Density density = DensityKt.Density($this$startDrag_12SF9DM_u24lambda_u2413.getDisplayMetrics().density, $this$startDrag_12SF9DM_u24lambda_u2413.getConfiguration().fontScale);
        ComposeDragShadowBuilder shadowBuilder = new ComposeDragShadowBuilder(density, decorationSize, function1, null);
        return AndroidComposeViewStartDragAndDropN.INSTANCE.startDragAndDrop(this, transferData, shadowBuilder);
    }

    private final void clearChildInvalidObservations(ViewGroup viewGroup) {
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View child = viewGroup.getChildAt(i);
            if (child instanceof AndroidComposeView) {
                ((AndroidComposeView) child).onEndApplyChanges();
            } else if (child instanceof ViewGroup) {
                clearChildInvalidObservations((ViewGroup) child);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void addExtraDataToAccessibilityNodeInfoHelper(int virtualViewId, AccessibilityNodeInfo info, String extraDataKey) {
        int it;
        boolean areEqual = Intrinsics.areEqual(extraDataKey, this.composeAccessibilityDelegate.getExtraDataTestTraversalBeforeVal$ui_release());
        AndroidComposeViewAccessibilityDelegateCompat androidComposeViewAccessibilityDelegateCompat = this.composeAccessibilityDelegate;
        if (areEqual) {
            int it2 = androidComposeViewAccessibilityDelegateCompat.getIdToBeforeMap$ui_release().getOrDefault(virtualViewId, -1);
            if (it2 != -1) {
                info.getExtras().putInt(extraDataKey, it2);
            }
        } else if (Intrinsics.areEqual(extraDataKey, androidComposeViewAccessibilityDelegateCompat.getExtraDataTestTraversalAfterVal$ui_release()) && (it = this.composeAccessibilityDelegate.getIdToAfterMap$ui_release().getOrDefault(virtualViewId, -1)) != -1) {
            info.getExtras().putInt(extraDataKey, it);
        }
    }

    @Override // android.view.ViewGroup
    public void addView(View child) {
        addView(child, -1);
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index) {
        Intrinsics.checkNotNull(child);
        ViewGroup.LayoutParams layoutParams = child.getLayoutParams();
        if (layoutParams == null) {
            layoutParams = generateDefaultLayoutParams();
        }
        addView(child, index, layoutParams);
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int width, int height) {
        ViewGroup.LayoutParams it = generateDefaultLayoutParams();
        it.width = width;
        it.height = height;
        Unit unit = Unit.INSTANCE;
        addView(child, -1, it);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public void addView(View child, ViewGroup.LayoutParams params) {
        addView(child, -1, params);
    }

    @Override // android.view.ViewGroup
    public void addView(View child, int index, ViewGroup.LayoutParams params) {
        addViewInLayout(child, index, params, true);
    }

    public final void addAndroidView(AndroidViewHolder view, final LayoutNode layoutNode) {
        getAndroidViewsHandler$ui_release().getHolderToLayoutNode().put(view, layoutNode);
        getAndroidViewsHandler$ui_release().addView(view);
        getAndroidViewsHandler$ui_release().getLayoutNodeToHolder().put(layoutNode, view);
        view.setImportantForAccessibility(1);
        ViewCompat.setAccessibilityDelegate(view, new AccessibilityDelegateCompat() { // from class: androidx.compose.ui.platform.AndroidComposeView$addAndroidView$1
            /* JADX WARN: Code restructure failed: missing block: B:19:0x005c, code lost:
                if (r3.intValue() == r9.this$0.getSemanticsOwner().getUnmergedRootSemanticsNode().getId()) goto L34;
             */
            @Override // androidx.core.view.AccessibilityDelegateCompat
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public void onInitializeAccessibilityNodeInfo(android.view.View r10, androidx.core.view.accessibility.AccessibilityNodeInfoCompat r11) {
                /*
                    r9 = this;
                    super.onInitializeAccessibilityNodeInfo(r10, r11)
                    androidx.compose.ui.platform.AndroidComposeView r0 = androidx.compose.ui.platform.AndroidComposeView.this
                    androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat r0 = androidx.compose.ui.platform.AndroidComposeView.access$getComposeAccessibilityDelegate$p(r0)
                    boolean r0 = r0.isEnabled$ui_release()
                    if (r0 == 0) goto L13
                    r0 = 0
                    r11.setVisibleToUser(r0)
                L13:
                    androidx.compose.ui.node.LayoutNode r0 = r2
                    r1 = 0
                    androidx.compose.ui.node.LayoutNode r2 = r0.getParent$ui_release()
                L1c:
                    r3 = 0
                    if (r2 == 0) goto L38
                    r4 = r2
                    r5 = 0
                    androidx.compose.ui.node.NodeChain r6 = r4.getNodes$ui_release()
                    r7 = 0
                    r8 = 8
                    int r7 = androidx.compose.ui.node.NodeKind.m5898constructorimpl(r8)
                    boolean r4 = r6.m5859hasH91voCI$ui_release(r7)
                    if (r4 == 0) goto L33
                    goto L39
                L33:
                    androidx.compose.ui.node.LayoutNode r2 = r2.getParent$ui_release()
                    goto L1c
                L38:
                    r2 = r3
                L39:
                    if (r2 == 0) goto L45
                L3d:
                    int r0 = r2.getSemanticsId()
                    java.lang.Integer r3 = java.lang.Integer.valueOf(r0)
                L45:
                    r0 = -1
                    if (r3 == 0) goto L5e
                    androidx.compose.ui.platform.AndroidComposeView r1 = androidx.compose.ui.platform.AndroidComposeView.this
                    androidx.compose.ui.semantics.SemanticsOwner r1 = r1.getSemanticsOwner()
                    androidx.compose.ui.semantics.SemanticsNode r1 = r1.getUnmergedRootSemanticsNode()
                    int r1 = r1.getId()
                    int r2 = r3.intValue()
                    if (r2 != r1) goto L62
                L5e:
                    java.lang.Integer r3 = java.lang.Integer.valueOf(r0)
                L62:
                    androidx.compose.ui.platform.AndroidComposeView r1 = r3
                    android.view.View r1 = (android.view.View) r1
                    int r2 = r3.intValue()
                    r11.setParent(r1, r2)
                    androidx.compose.ui.node.LayoutNode r1 = r2
                    int r1 = r1.getSemanticsId()
                    androidx.compose.ui.platform.AndroidComposeView r2 = androidx.compose.ui.platform.AndroidComposeView.this
                    androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat r2 = androidx.compose.ui.platform.AndroidComposeView.access$getComposeAccessibilityDelegate$p(r2)
                    androidx.collection.MutableIntIntMap r2 = r2.getIdToBeforeMap$ui_release()
                    int r2 = r2.getOrDefault(r1, r0)
                    if (r2 == r0) goto Laf
                    androidx.compose.ui.platform.AndroidComposeView r4 = androidx.compose.ui.platform.AndroidComposeView.this
                    androidx.compose.ui.platform.AndroidViewsHandler r4 = r4.getAndroidViewsHandler$ui_release()
                    android.view.View r4 = androidx.compose.ui.platform.SemanticsUtils_androidKt.semanticsIdToView(r4, r2)
                    if (r4 == 0) goto L94
                    r11.setTraversalBefore(r4)
                    goto L9b
                L94:
                    androidx.compose.ui.platform.AndroidComposeView r5 = r3
                    android.view.View r5 = (android.view.View) r5
                    r11.setTraversalBefore(r5, r2)
                L9b:
                    androidx.compose.ui.platform.AndroidComposeView r5 = androidx.compose.ui.platform.AndroidComposeView.this
                    android.view.accessibility.AccessibilityNodeInfo r6 = r11.unwrap()
                    androidx.compose.ui.platform.AndroidComposeView r7 = androidx.compose.ui.platform.AndroidComposeView.this
                    androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat r7 = androidx.compose.ui.platform.AndroidComposeView.access$getComposeAccessibilityDelegate$p(r7)
                    java.lang.String r7 = r7.getExtraDataTestTraversalBeforeVal$ui_release()
                    androidx.compose.ui.platform.AndroidComposeView.access$addExtraDataToAccessibilityNodeInfoHelper(r5, r1, r6, r7)
                Laf:
                    androidx.compose.ui.platform.AndroidComposeView r4 = androidx.compose.ui.platform.AndroidComposeView.this
                    androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat r4 = androidx.compose.ui.platform.AndroidComposeView.access$getComposeAccessibilityDelegate$p(r4)
                    androidx.collection.MutableIntIntMap r4 = r4.getIdToAfterMap$ui_release()
                    int r4 = r4.getOrDefault(r1, r0)
                    if (r4 == r0) goto Leb
                    androidx.compose.ui.platform.AndroidComposeView r0 = androidx.compose.ui.platform.AndroidComposeView.this
                    androidx.compose.ui.platform.AndroidViewsHandler r0 = r0.getAndroidViewsHandler$ui_release()
                    android.view.View r0 = androidx.compose.ui.platform.SemanticsUtils_androidKt.semanticsIdToView(r0, r4)
                    if (r0 == 0) goto Ld0
                    r11.setTraversalAfter(r0)
                    goto Ld7
                Ld0:
                    androidx.compose.ui.platform.AndroidComposeView r5 = r3
                    android.view.View r5 = (android.view.View) r5
                    r11.setTraversalAfter(r5, r4)
                Ld7:
                    androidx.compose.ui.platform.AndroidComposeView r5 = androidx.compose.ui.platform.AndroidComposeView.this
                    android.view.accessibility.AccessibilityNodeInfo r6 = r11.unwrap()
                    androidx.compose.ui.platform.AndroidComposeView r7 = androidx.compose.ui.platform.AndroidComposeView.this
                    androidx.compose.ui.platform.AndroidComposeViewAccessibilityDelegateCompat r7 = androidx.compose.ui.platform.AndroidComposeView.access$getComposeAccessibilityDelegate$p(r7)
                    java.lang.String r7 = r7.getExtraDataTestTraversalAfterVal$ui_release()
                    androidx.compose.ui.platform.AndroidComposeView.access$addExtraDataToAccessibilityNodeInfoHelper(r5, r1, r6, r7)
                Leb:
                    return
                */
                throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.platform.AndroidComposeView$addAndroidView$1.onInitializeAccessibilityNodeInfo(android.view.View, androidx.core.view.accessibility.AccessibilityNodeInfoCompat):void");
            }
        });
    }

    public final void removeAndroidView(final AndroidViewHolder view) {
        registerOnEndApplyChangesListener(new Function0<Unit>() { // from class: androidx.compose.ui.platform.AndroidComposeView$removeAndroidView$1
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
                AndroidComposeView.this.getAndroidViewsHandler$ui_release().removeViewInLayout(view);
                AndroidComposeView.this.getAndroidViewsHandler$ui_release().getLayoutNodeToHolder().remove(AndroidComposeView.this.getAndroidViewsHandler$ui_release().getHolderToLayoutNode().remove(view));
                view.setImportantForAccessibility(0);
            }
        });
    }

    public final void drawAndroidView(AndroidViewHolder view, Canvas canvas) {
        getAndroidViewsHandler$ui_release().drawView(view, canvas);
    }

    static /* synthetic */ void scheduleMeasureAndLayout$default(AndroidComposeView androidComposeView, LayoutNode layoutNode, int i, Object obj) {
        if ((i & 1) != 0) {
            layoutNode = null;
        }
        androidComposeView.scheduleMeasureAndLayout(layoutNode);
    }

    private final void scheduleMeasureAndLayout(LayoutNode nodeToRemeasure) {
        if (!isLayoutRequested() && isAttachedToWindow()) {
            if (nodeToRemeasure != null) {
                LayoutNode node = nodeToRemeasure;
                while (node != null && node.getMeasuredByParent$ui_release() == LayoutNode.UsageByParent.InMeasureBlock && childSizeCanAffectParentSize(node)) {
                    node = node.getParent$ui_release();
                }
                if (node == getRoot()) {
                    requestLayout();
                    return;
                }
            }
            if (getWidth() == 0 || getHeight() == 0) {
                requestLayout();
            } else {
                invalidate();
            }
        }
    }

    private final boolean childSizeCanAffectParentSize(LayoutNode $this$childSizeCanAffectParentSize) {
        if (this.wasMeasuredWithMultipleConstraints) {
            return true;
        }
        LayoutNode parent$ui_release = $this$childSizeCanAffectParentSize.getParent$ui_release();
        return parent$ui_release != null && !parent$ui_release.getHasFixedInnerContentConstraints$ui_release();
    }

    @Override // androidx.compose.ui.node.Owner
    public void measureAndLayout(boolean sendPointerUpdate) {
        Function0 resend;
        if (!this.measureAndLayoutDelegate.getHasPendingMeasureOrLayout() && !this.measureAndLayoutDelegate.getHasPendingOnPositionedCallbacks()) {
            return;
        }
        Trace.beginSection("AndroidOwner:measureAndLayout");
        if (!sendPointerUpdate) {
            resend = null;
        } else {
            try {
                resend = this.resendMotionEventOnLayout;
            } catch (Throwable th) {
                Trace.endSection();
                throw th;
            }
        }
        boolean rootNodeResized = this.measureAndLayoutDelegate.measureAndLayout(resend);
        if (rootNodeResized) {
            requestLayout();
        }
        MeasureAndLayoutDelegate.dispatchOnPositionedCallbacks$default(this.measureAndLayoutDelegate, false, 1, null);
        dispatchPendingInteropLayoutCallbacks();
        Unit unit = Unit.INSTANCE;
        Trace.endSection();
    }

    @Override // androidx.compose.ui.node.Owner
    /* renamed from: measureAndLayout-0kLqBqw */
    public void mo5959measureAndLayout0kLqBqw(LayoutNode layoutNode, long constraints) {
        Trace.beginSection("AndroidOwner:measureAndLayout");
        try {
            this.measureAndLayoutDelegate.m5847measureAndLayout0kLqBqw(layoutNode, constraints);
            if (!this.measureAndLayoutDelegate.getHasPendingMeasureOrLayout()) {
                MeasureAndLayoutDelegate.dispatchOnPositionedCallbacks$default(this.measureAndLayoutDelegate, false, 1, null);
                dispatchPendingInteropLayoutCallbacks();
            }
            if (ComposeUiFlags.isRectTrackingEnabled) {
                getRectManager().dispatchCallbacks();
            }
            Unit unit = Unit.INSTANCE;
        } finally {
            Trace.endSection();
        }
    }

    private final void dispatchPendingInteropLayoutCallbacks() {
        if (this.isPendingInteropViewLayoutChangeDispatch) {
            getViewTreeObserver().dispatchOnGlobalLayout();
            this.isPendingInteropViewLayoutChangeDispatch = false;
        }
    }

    @Override // androidx.compose.ui.node.Owner
    public void forceMeasureTheSubtree(LayoutNode layoutNode, boolean affectsLookahead) {
        this.measureAndLayoutDelegate.forceMeasureTheSubtree(layoutNode, affectsLookahead);
    }

    @Override // androidx.compose.ui.node.Owner
    public void onRequestMeasure(LayoutNode layoutNode, boolean affectsLookahead, boolean forceRequest, boolean scheduleMeasureAndLayout) {
        MeasureAndLayoutDelegate measureAndLayoutDelegate = this.measureAndLayoutDelegate;
        if (affectsLookahead) {
            if (measureAndLayoutDelegate.requestLookaheadRemeasure(layoutNode, forceRequest) && scheduleMeasureAndLayout) {
                scheduleMeasureAndLayout(layoutNode);
            }
        } else if (measureAndLayoutDelegate.requestRemeasure(layoutNode, forceRequest) && scheduleMeasureAndLayout) {
            scheduleMeasureAndLayout(layoutNode);
        }
    }

    @Override // androidx.compose.ui.node.Owner
    public void onRequestRelayout(LayoutNode layoutNode, boolean affectsLookahead, boolean forceRequest) {
        MeasureAndLayoutDelegate measureAndLayoutDelegate = this.measureAndLayoutDelegate;
        if (affectsLookahead) {
            if (measureAndLayoutDelegate.requestLookaheadRelayout(layoutNode, forceRequest)) {
                scheduleMeasureAndLayout$default(this, null, 1, null);
            }
        } else if (measureAndLayoutDelegate.requestRelayout(layoutNode, forceRequest)) {
            scheduleMeasureAndLayout$default(this, null, 1, null);
        }
    }

    @Override // androidx.compose.ui.node.Owner
    public void requestOnPositionedCallback(LayoutNode layoutNode) {
        this.measureAndLayoutDelegate.requestOnPositionedCallback(layoutNode);
        scheduleMeasureAndLayout$default(this, null, 1, null);
    }

    @Override // androidx.compose.ui.node.RootForTest
    public void measureAndLayoutForTest() {
        Owner.measureAndLayout$default(this, false, 1, null);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int minWidth;
        int maxWidth;
        Trace.beginSection("AndroidOwner:onMeasure");
        try {
            if (!isAttachedToWindow()) {
                invalidateLayoutNodeMeasurement(getRoot());
            }
            long $this$component2_u2dVKZWuLQ$iv = m6001convertMeasureSpecI7RO_PI(widthMeasureSpec);
            minWidth = (int) ULong.m7515constructorimpl($this$component2_u2dVKZWuLQ$iv >>> 32);
            maxWidth = (int) ULong.m7515constructorimpl($this$component2_u2dVKZWuLQ$iv & 4294967295L);
        } catch (Throwable th) {
            th = th;
        }
        try {
            long $this$component2_u2dVKZWuLQ$iv2 = m6001convertMeasureSpecI7RO_PI(heightMeasureSpec);
            int minHeight = (int) ULong.m7515constructorimpl($this$component2_u2dVKZWuLQ$iv2 >>> 32);
            int maxHeight = (int) ULong.m7515constructorimpl($this$component2_u2dVKZWuLQ$iv2 & 4294967295L);
            long constraints = Constraints.Companion.m6834fitPrioritizingHeightZbe2FdA(minWidth, maxWidth, minHeight, maxHeight);
            if (this.onMeasureConstraints == null) {
                this.onMeasureConstraints = Constraints.m6813boximpl(constraints);
                this.wasMeasuredWithMultipleConstraints = false;
            } else {
                Constraints constraints2 = this.onMeasureConstraints;
                if (!(constraints2 != null ? Constraints.m6819equalsimpl0(constraints2.m6832unboximpl(), constraints) : false)) {
                    this.wasMeasuredWithMultipleConstraints = true;
                }
            }
            this.measureAndLayoutDelegate.m5848updateRootConstraintsBRTryo0(constraints);
            this.measureAndLayoutDelegate.measureOnly();
            setMeasuredDimension(getRoot().getWidth(), getRoot().getHeight());
            if (this._androidViewsHandler != null) {
                getAndroidViewsHandler$ui_release().measure(View.MeasureSpec.makeMeasureSpec(getRoot().getWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(getRoot().getHeight(), 1073741824));
            }
            Unit unit = Unit.INSTANCE;
            Trace.endSection();
        } catch (Throwable th2) {
            th = th2;
            Trace.endSection();
            throw th;
        }
    }

    /* renamed from: component1-VKZWuLQ  reason: not valid java name */
    private final int m5999component1VKZWuLQ(long $this$component1_u2dVKZWuLQ) {
        return (int) ULong.m7515constructorimpl($this$component1_u2dVKZWuLQ >>> 32);
    }

    /* renamed from: component2-VKZWuLQ  reason: not valid java name */
    private final int m6000component2VKZWuLQ(long $this$component2_u2dVKZWuLQ) {
        return (int) ULong.m7515constructorimpl(4294967295L & $this$component2_u2dVKZWuLQ);
    }

    /* renamed from: pack-ZIaKswc  reason: not valid java name */
    private final long m6005packZIaKswc(int a, int b) {
        return ULong.m7515constructorimpl(ULong.m7515constructorimpl(ULong.m7515constructorimpl(a) << 32) | ULong.m7515constructorimpl(b));
    }

    /* renamed from: convertMeasureSpec-I7RO_PI  reason: not valid java name */
    private final long m6001convertMeasureSpecI7RO_PI(int measureSpec) {
        int mode = View.MeasureSpec.getMode(measureSpec);
        int size = View.MeasureSpec.getSize(measureSpec);
        switch (mode) {
            case Integer.MIN_VALUE:
                return m6005packZIaKswc(0, size);
            case 0:
                return m6005packZIaKswc(0, Integer.MAX_VALUE);
            case 1073741824:
                return m6005packZIaKswc(size, size);
            default:
                throw new IllegalStateException();
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        this.lastMatrixRecalculationAnimationTime = 0L;
        this.measureAndLayoutDelegate.measureAndLayout(this.resendMotionEventOnLayout);
        this.onMeasureConstraints = null;
        updatePositionCacheAndDispatch();
        if (this._androidViewsHandler != null) {
            getAndroidViewsHandler$ui_release().layout(0, 0, r - l, b - t);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void updatePositionCacheAndDispatch() {
        boolean positionChanged = false;
        getLocationOnScreen(this.tmpPositionArray);
        long j = this.globalPosition;
        int m7001getXimpl = IntOffset.m7001getXimpl(j);
        int globalY = IntOffset.m7002getYimpl(j);
        if (m7001getXimpl != this.tmpPositionArray[0] || globalY != this.tmpPositionArray[1] || this.lastMatrixRecalculationAnimationTime < 0) {
            int x$iv = this.tmpPositionArray[0];
            int y$iv = this.tmpPositionArray[1];
            this.globalPosition = IntOffset.m6995constructorimpl((x$iv << 32) | (y$iv & 4294967295L));
            if (m7001getXimpl != Integer.MAX_VALUE && globalY != Integer.MAX_VALUE) {
                positionChanged = true;
                getRoot().getLayoutDelegate$ui_release().getMeasurePassDelegate$ui_release().notifyChildrenUsingCoordinatesWhilePlacing();
            }
        }
        recalculateWindowPosition();
        getRectManager().m6128updateOffsetsucfNpQE(this.globalPosition, IntOffsetKt.m7018roundk4lQ0M(this.windowPosition), this.viewToWindowMatrix);
        this.measureAndLayoutDelegate.dispatchOnPositionedCallbacks(positionChanged);
        if (ComposeUiFlags.isRectTrackingEnabled) {
            getRectManager().dispatchCallbacks();
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
    }

    @Override // androidx.compose.ui.node.Owner
    public OwnedLayer createLayer(Function2<? super androidx.compose.ui.graphics.Canvas, ? super GraphicsLayer, Unit> function2, Function0<Unit> function0, GraphicsLayer explicitLayer, boolean forceUseOldLayers) {
        ViewLayerContainer viewLayerContainer;
        if (explicitLayer != null) {
            return new GraphicsLayerOwnerLayer(explicitLayer, null, this, function2, function0);
        }
        if (!forceUseOldLayers) {
            OwnedLayer layer = this.layerCache.pop();
            if (layer != null) {
                layer.reuseLayer(function2, function0);
                return layer;
            }
            return new GraphicsLayerOwnerLayer(getGraphicsContext().createGraphicsLayer(), getGraphicsContext(), this, function2, function0);
        }
        if (isHardwareAccelerated() && this.isRenderNodeCompatible) {
            try {
                return new RenderNodeLayer(this, function2, function0);
            } catch (Throwable th) {
                this.isRenderNodeCompatible = false;
            }
        }
        if (this.viewLayersContainer == null) {
            if (!ViewLayer.Companion.getHasRetrievedMethod()) {
                ViewLayer.Companion.updateDisplayList(new View(getContext()));
            }
            if (ViewLayer.Companion.getShouldUseDispatchDraw()) {
                viewLayerContainer = new DrawChildContainer(getContext());
            } else {
                viewLayerContainer = new ViewLayerContainer(getContext());
            }
            this.viewLayersContainer = viewLayerContainer;
            addView(this.viewLayersContainer);
        }
        DrawChildContainer drawChildContainer = this.viewLayersContainer;
        Intrinsics.checkNotNull(drawChildContainer);
        return new ViewLayer(this, drawChildContainer, function2, function0);
    }

    public final boolean recycle$ui_release(OwnedLayer layer) {
        if (this.viewLayersContainer == null || !ViewLayer.Companion.getShouldUseDispatchDraw()) {
        }
        if (1 != 0) {
            this.layerCache.push(layer);
        }
        this.dirtyLayers.remove(layer);
        return true;
    }

    @Override // androidx.compose.ui.node.Owner
    public void onSemanticsChange() {
        this.composeAccessibilityDelegate.onSemanticsChange$ui_release();
        this.contentCaptureManager.onSemanticsChange$ui_release();
    }

    @Override // androidx.compose.ui.node.Owner
    public void onLayoutChange(LayoutNode layoutNode) {
        this.composeAccessibilityDelegate.onLayoutChange$ui_release(layoutNode);
        this.contentCaptureManager.onLayoutChange$ui_release();
    }

    @Override // androidx.compose.ui.node.Owner
    public void onLayoutNodeDeactivated(LayoutNode layoutNode) {
        AndroidAutofillManager androidAutofillManager;
        if (ComposeUiFlags.isRectTrackingEnabled) {
            getRectManager().remove(layoutNode);
        }
        if (!autofillSupported() || !ComposeUiFlags.isSemanticAutofillEnabled || (androidAutofillManager = this._autofillManager) == null) {
            return;
        }
        androidAutofillManager.onLayoutNodeDeactivated$ui_release(layoutNode);
    }

    @Override // androidx.compose.ui.node.Owner
    public void onPreLayoutNodeReused(LayoutNode layoutNode, int oldSemanticsId) {
        getLayoutNodes().remove(oldSemanticsId);
        getLayoutNodes().set(layoutNode.getSemanticsId(), layoutNode);
    }

    @Override // androidx.compose.ui.node.Owner
    public void onPostLayoutNodeReused(LayoutNode layoutNode, int oldSemanticsId) {
        AndroidAutofillManager androidAutofillManager;
        if (!autofillSupported() || !ComposeUiFlags.isSemanticAutofillEnabled || (androidAutofillManager = this._autofillManager) == null) {
            return;
        }
        androidAutofillManager.onPostLayoutNodeReused$ui_release(layoutNode, oldSemanticsId);
    }

    @Override // androidx.compose.ui.node.Owner
    public void onInteropViewLayoutChange(View view) {
        this.isPendingInteropViewLayoutChangeDispatch = true;
    }

    @Override // androidx.compose.ui.node.Owner
    public void registerOnLayoutCompletedListener(Owner.OnLayoutCompletedListener listener) {
        this.measureAndLayoutDelegate.registerOnLayoutCompletedListener(listener);
        scheduleMeasureAndLayout$default(this, null, 1, null);
    }

    @Override // androidx.compose.ui.node.Owner
    /* renamed from: getFocusDirection-P8AzH3I */
    public FocusDirection mo5958getFocusDirectionP8AzH3I(android.view.KeyEvent keyEvent) {
        long m5368getKeyZmokQxo = KeyEvent_androidKt.m5368getKeyZmokQxo(keyEvent);
        if (Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5296getTabEK5gGoQ())) {
            return FocusDirection.m3929boximpl(KeyEvent_androidKt.m5374isShiftPressedZmokQxo(keyEvent) ? FocusDirection.Companion.m3941getPreviousdhqQ8s() : FocusDirection.Companion.m3940getNextdhqQ8s());
        } else if (Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5137getDirectionRightEK5gGoQ())) {
            return FocusDirection.m3929boximpl(FocusDirection.Companion.m3942getRightdhqQ8s());
        } else {
            if (Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5136getDirectionLeftEK5gGoQ())) {
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3939getLeftdhqQ8s());
            }
            if (Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5138getDirectionUpEK5gGoQ()) ? true : Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5249getPageUpEK5gGoQ())) {
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3943getUpdhqQ8s());
            }
            if (Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5133getDirectionDownEK5gGoQ()) ? true : Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5248getPageDownEK5gGoQ())) {
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3936getDowndhqQ8s());
            }
            if (Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5132getDirectionCenterEK5gGoQ()) ? true : Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5146getEnterEK5gGoQ()) ? true : Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5238getNumPadEnterEK5gGoQ())) {
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3937getEnterdhqQ8s());
            }
            if (Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5075getBackEK5gGoQ()) ? true : Key.m5060equalsimpl0(m5368getKeyZmokQxo, Key.Companion.m5149getEscapeEK5gGoQ())) {
                return FocusDirection.m3929boximpl(FocusDirection.Companion.m3938getExitdhqQ8s());
            }
            return null;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas canvas) {
        if (!isAttachedToWindow()) {
            invalidateLayers(getRoot());
        }
        Owner.measureAndLayout$default(this, false, 1, null);
        Snapshot.Companion.notifyObjectsInitialized();
        this.isDrawingContent = true;
        CanvasHolder this_$iv = this.canvasHolder;
        Canvas previousCanvas$iv = this_$iv.getAndroidCanvas().getInternalCanvas();
        this_$iv.getAndroidCanvas().setInternalCanvas(canvas);
        androidx.compose.ui.graphics.Canvas $this$dispatchDraw_u24lambda_u2420 = this_$iv.getAndroidCanvas();
        getRoot().draw$ui_release($this$dispatchDraw_u24lambda_u2420, null);
        this_$iv.getAndroidCanvas().setInternalCanvas(previousCanvas$iv);
        if (!this.dirtyLayers.isEmpty()) {
            int size = this.dirtyLayers.size();
            for (int i = 0; i < size; i++) {
                OwnedLayer layer = this.dirtyLayers.get(i);
                layer.updateDisplayList();
            }
        }
        if (ViewLayer.Companion.getShouldUseDispatchDraw()) {
            int saveCount = canvas.save();
            canvas.clipRect(0.0f, 0.0f, 0.0f, 0.0f);
            super.dispatchDraw(canvas);
            canvas.restoreToCount(saveCount);
        }
        this.dirtyLayers.clear();
        this.isDrawingContent = false;
        if (this.postponedDirtyLayers != null) {
            List postponed = this.postponedDirtyLayers;
            Intrinsics.checkNotNull(postponed);
            this.dirtyLayers.addAll(postponed);
            postponed.clear();
        }
    }

    public final void notifyLayerIsDirty$ui_release(OwnedLayer layer, boolean isDirty) {
        boolean z = this.isDrawingContent;
        if (!isDirty) {
            if (!z) {
                this.dirtyLayers.remove(layer);
                List<OwnedLayer> list = this.postponedDirtyLayers;
                if (list != null) {
                    list.remove(layer);
                }
            }
        } else if (!z) {
            this.dirtyLayers.add(layer);
        } else {
            List it = this.postponedDirtyLayers;
            if (it == null) {
                it = new ArrayList();
                this.postponedDirtyLayers = it;
            }
            it.add(layer);
        }
    }

    public final void setOnViewTreeOwnersAvailable(Function1<? super ViewTreeOwners, Unit> function1) {
        ViewTreeOwners viewTreeOwners = getViewTreeOwners();
        if (viewTreeOwners != null) {
            function1.invoke(viewTreeOwners);
        }
        if (!isAttachedToWindow()) {
            this.onViewTreeOwnersAvailable = function1;
        }
    }

    public final Object boundsUpdatesContentCaptureEventLoop(Continuation<? super Unit> continuation) {
        Object boundsUpdatesEventLoop$ui_release = this.contentCaptureManager.boundsUpdatesEventLoop$ui_release(continuation);
        return boundsUpdatesEventLoop$ui_release == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? boundsUpdatesEventLoop$ui_release : Unit.INSTANCE;
    }

    public final Object boundsUpdatesAccessibilityEventLoop(Continuation<? super Unit> continuation) {
        Object boundsUpdatesEventLoop$ui_release = this.composeAccessibilityDelegate.boundsUpdatesEventLoop$ui_release(continuation);
        return boundsUpdatesEventLoop$ui_release == IntrinsicsKt.getCOROUTINE_SUSPENDED() ? boundsUpdatesEventLoop$ui_release : Unit.INSTANCE;
    }

    private final void invalidateLayoutNodeMeasurement(LayoutNode node) {
        MeasureAndLayoutDelegate.requestRemeasure$default(this.measureAndLayoutDelegate, node, false, 2, null);
        MutableVector this_$iv$iv = node.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode it = (LayoutNode) content$iv$iv[i$iv$iv];
            invalidateLayoutNodeMeasurement(it);
        }
    }

    private final void invalidateLayers(LayoutNode node) {
        node.invalidateLayers$ui_release();
        MutableVector this_$iv$iv = node.get_children$ui_release();
        Object[] content$iv$iv = this_$iv$iv.content;
        int size$iv$iv = this_$iv$iv.getSize();
        for (int i$iv$iv = 0; i$iv$iv < size$iv$iv; i$iv$iv++) {
            LayoutNode it = (LayoutNode) content$iv$iv[i$iv$iv];
            invalidateLayers(it);
        }
    }

    @Override // androidx.compose.ui.platform.ViewRootForTest
    public void invalidateDescendants() {
        invalidateLayers(getRoot());
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onAttachedToWindow() {
        LifecycleOwner lifecycleOwner;
        LifecycleOwner lifecycleOwner2;
        Lifecycle lifecycle;
        AndroidAutofill it;
        super.onAttachedToWindow();
        this._windowInfo.setWindowFocused(hasWindowFocus());
        this._windowInfo.setOnInitializeContainerSize(new Function0<IntSize>() { // from class: androidx.compose.ui.platform.AndroidComposeView$onAttachedToWindow$1
            /* JADX INFO: Access modifiers changed from: package-private */
            {
                super(0);
            }

            @Override // kotlin.jvm.functions.Function0
            public /* bridge */ /* synthetic */ IntSize invoke() {
                return IntSize.m7036boximpl(m6013invokeYbymL2g());
            }

            /* renamed from: invoke-YbymL2g  reason: not valid java name */
            public final long m6013invokeYbymL2g() {
                return AndroidWindowInfo_androidKt.calculateWindowSize(AndroidComposeView.this);
            }
        });
        updateWindowMetrics();
        invalidateLayoutNodeMeasurement(getRoot());
        invalidateLayers(getRoot());
        getSnapshotObserver().startObserving$ui_release();
        if (autofillSupported() && (it = this._autofill) != null) {
            AutofillCallback.INSTANCE.register(it);
        }
        LifecycleOwner lifecycleOwner3 = ViewTreeLifecycleOwner.get(this);
        SavedStateRegistryOwner savedStateRegistryOwner = ViewTreeSavedStateRegistryOwner.get(this);
        ViewTreeOwners oldViewTreeOwners = getViewTreeOwners();
        boolean resetViewTreeOwner = oldViewTreeOwners == null || !(lifecycleOwner3 == null || savedStateRegistryOwner == null || (lifecycleOwner3 == oldViewTreeOwners.getLifecycleOwner() && savedStateRegistryOwner == oldViewTreeOwners.getLifecycleOwner()));
        Lifecycle lifecycle2 = null;
        if (resetViewTreeOwner) {
            if (lifecycleOwner3 == null) {
                throw new IllegalStateException("Composed into the View which doesn't propagate ViewTreeLifecycleOwner!");
            }
            if (savedStateRegistryOwner == null) {
                throw new IllegalStateException("Composed into the View which doesn't propagateViewTreeSavedStateRegistryOwner!");
            }
            if (oldViewTreeOwners != null && (lifecycleOwner2 = oldViewTreeOwners.getLifecycleOwner()) != null && (lifecycle = lifecycleOwner2.getLifecycle()) != null) {
                lifecycle.removeObserver(this);
            }
            lifecycleOwner3.getLifecycle().addObserver(this);
            ViewTreeOwners viewTreeOwners = new ViewTreeOwners(lifecycleOwner3, savedStateRegistryOwner);
            set_viewTreeOwners(viewTreeOwners);
            Function1<? super ViewTreeOwners, Unit> function1 = this.onViewTreeOwnersAvailable;
            if (function1 != null) {
                function1.invoke(viewTreeOwners);
            }
            this.onViewTreeOwnersAvailable = null;
        }
        this._inputModeManager.m5054setInputModeiuPiT84(isInTouchMode() ? InputMode.Companion.m5051getTouchaOaMEAU() : InputMode.Companion.m5050getKeyboardaOaMEAU());
        ViewTreeOwners viewTreeOwners2 = getViewTreeOwners();
        if (viewTreeOwners2 != null && (lifecycleOwner = viewTreeOwners2.getLifecycleOwner()) != null) {
            lifecycle2 = lifecycleOwner.getLifecycle();
        }
        if (lifecycle2 != null) {
            lifecycle2.addObserver(this);
            lifecycle2.addObserver(this.contentCaptureManager);
            getViewTreeObserver().addOnGlobalLayoutListener(this.globalLayoutListener);
            getViewTreeObserver().addOnScrollChangedListener(this.scrollChangedListener);
            getViewTreeObserver().addOnTouchModeChangeListener(this.touchModeChangeListener);
            if (Build.VERSION.SDK_INT >= 31) {
                AndroidComposeViewTranslationCallbackS.INSTANCE.setViewTranslationCallback(this);
            }
            AndroidAutofillManager it2 = this._autofillManager;
            if (it2 != null) {
                MutableObjectList this_$iv = getFocusOwner().getListeners();
                this_$iv.add(it2);
                MutableObjectList this_$iv2 = getSemanticsOwner().getListeners$ui_release();
                this_$iv2.add(it2);
                return;
            }
            return;
        }
        InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("No lifecycle owner exists");
        throw new KotlinNothingValueException();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        AndroidAutofill it;
        LifecycleOwner lifecycleOwner;
        super.onDetachedFromWindow();
        getSnapshotObserver().stopObserving$ui_release();
        Lifecycle lifecycle = null;
        this._windowInfo.setOnInitializeContainerSize(null);
        ViewTreeOwners viewTreeOwners = getViewTreeOwners();
        if (viewTreeOwners != null && (lifecycleOwner = viewTreeOwners.getLifecycleOwner()) != null) {
            lifecycle = lifecycleOwner.getLifecycle();
        }
        if (lifecycle != null) {
            lifecycle.removeObserver(this.contentCaptureManager);
            lifecycle.removeObserver(this);
            if (autofillSupported() && (it = this._autofill) != null) {
                AutofillCallback.INSTANCE.unregister(it);
            }
            getViewTreeObserver().removeOnGlobalLayoutListener(this.globalLayoutListener);
            getViewTreeObserver().removeOnScrollChangedListener(this.scrollChangedListener);
            getViewTreeObserver().removeOnTouchModeChangeListener(this.touchModeChangeListener);
            if (Build.VERSION.SDK_INT >= 31) {
                AndroidComposeViewTranslationCallbackS.INSTANCE.clearViewTranslationCallback(this);
            }
            AndroidAutofillManager it2 = this._autofillManager;
            if (it2 != null) {
                MutableObjectList this_$iv = getSemanticsOwner().getListeners$ui_release();
                this_$iv.remove(it2);
                MutableObjectList this_$iv2 = getFocusOwner().getListeners();
                this_$iv2.remove(it2);
                return;
            }
            return;
        }
        InlineClassHelperKt.throwIllegalStateExceptionForNullCheck("No lifecycle owner exists");
        throw new KotlinNothingValueException();
    }

    @Override // android.view.View
    public void onProvideAutofillVirtualStructure(ViewStructure structure, int flags) {
        AndroidAutofillManager androidAutofillManager;
        if (autofillSupported() && structure != null) {
            if (ComposeUiFlags.isSemanticAutofillEnabled && (androidAutofillManager = this._autofillManager) != null) {
                androidAutofillManager.populateViewStructure(structure);
            }
            AndroidAutofill androidAutofill = this._autofill;
            if (androidAutofill != null) {
                AndroidAutofill_androidKt.populateViewStructure(androidAutofill, structure);
            }
        }
    }

    @Override // android.view.View
    public void autofill(SparseArray<AutofillValue> sparseArray) {
        AndroidAutofillManager androidAutofillManager;
        if (autofillSupported()) {
            if (ComposeUiFlags.isSemanticAutofillEnabled && (androidAutofillManager = this._autofillManager) != null) {
                androidAutofillManager.performAutofill(sparseArray);
            }
            AndroidAutofill androidAutofill = this._autofill;
            if (androidAutofill != null) {
                AndroidAutofill_androidKt.performAutofill(androidAutofill, sparseArray);
            }
        }
    }

    @Override // android.view.View
    public void onCreateVirtualViewTranslationRequests(long[] virtualIds, int[] supportedFormats, Consumer<ViewTranslationRequest> consumer) {
        this.contentCaptureManager.onCreateVirtualViewTranslationRequests$ui_release(virtualIds, supportedFormats, consumer);
    }

    @Override // android.view.View
    public void onVirtualViewTranslationResponses(LongSparseArray<ViewTranslationResponse> longSparseArray) {
        this.contentCaptureManager.onVirtualViewTranslationResponses$ui_release(this.contentCaptureManager, longSparseArray);
    }

    @Override // android.view.View
    public boolean dispatchGenericMotionEvent(MotionEvent motionEvent) {
        if (this.hoverExitReceived) {
            removeCallbacks(this.sendHoverExitEvent);
            if (motionEvent.getActionMasked() == 8) {
                this.hoverExitReceived = false;
            } else {
                this.sendHoverExitEvent.run();
            }
        }
        if (motionEvent.getActionMasked() == 8) {
            if (isBadMotionEvent(motionEvent) || !isAttachedToWindow()) {
                return super.dispatchGenericMotionEvent(motionEvent);
            }
            if (motionEvent.isFromSource(4194304)) {
                return handleRotaryEvent(motionEvent);
            }
            int arg0$iv = m6002handleMotionEvent8iAsVTc(motionEvent);
            return (arg0$iv & 1) != 0;
        }
        return super.dispatchGenericMotionEvent(motionEvent);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        if (this.hoverExitReceived) {
            removeCallbacks(this.sendHoverExitEvent);
            MotionEvent lastEvent = this.previousMotionEvent;
            Intrinsics.checkNotNull(lastEvent);
            if (motionEvent.getActionMasked() != 0 || hasChangedDevices(motionEvent, lastEvent)) {
                this.sendHoverExitEvent.run();
            } else {
                this.hoverExitReceived = false;
            }
        }
        if (isBadMotionEvent(motionEvent) || !isAttachedToWindow()) {
            return false;
        }
        if (motionEvent.getActionMasked() != 2 || isPositionChanged(motionEvent)) {
            int processResult = m6002handleMotionEvent8iAsVTc(motionEvent);
            if (((processResult & 2) != 0 ? 1 : 0) != 0) {
                getParent().requestDisallowInterceptTouchEvent(true);
            }
            return (processResult & 1) != 0;
        }
        return false;
    }

    private final boolean handleRotaryEvent(final MotionEvent event) {
        android.view.ViewConfiguration config = android.view.ViewConfiguration.get(getContext());
        float axisValue = -event.getAxisValue(26);
        RotaryScrollEvent rotaryEvent = new RotaryScrollEvent(ViewConfigurationCompat.getScaledVerticalScrollFactor(config, getContext()) * axisValue, ViewConfigurationCompat.getScaledHorizontalScrollFactor(config, getContext()) * axisValue, event.getEventTime(), event.getDeviceId());
        return getFocusOwner().dispatchRotaryEvent(rotaryEvent, new Function0<Boolean>() { // from class: androidx.compose.ui.platform.AndroidComposeView$handleRotaryEvent$1
            /* JADX INFO: Access modifiers changed from: package-private */
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super(0);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // kotlin.jvm.functions.Function0
            public final Boolean invoke() {
                boolean dispatchGenericMotionEvent;
                dispatchGenericMotionEvent = super/*android.view.ViewGroup*/.dispatchGenericMotionEvent(event);
                return Boolean.valueOf(dispatchGenericMotionEvent);
            }
        });
    }

    /* JADX WARN: Removed duplicated region for block: B:103:0x014a  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0081  */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00af  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00b4 A[Catch: all -> 0x0170, TryCatch #0 {all -> 0x0170, blocks: (B:5:0x001f, B:7:0x0029, B:17:0x0044, B:38:0x009b, B:45:0x00b4, B:46:0x00b7, B:48:0x00bb, B:53:0x00c6, B:55:0x00ca, B:57:0x00d0, B:59:0x00d8, B:62:0x00e0, B:63:0x00e7, B:65:0x00ed, B:67:0x00f3, B:69:0x00f9, B:71:0x00ff, B:73:0x0103, B:74:0x0107, B:87:0x0125, B:89:0x012a, B:91:0x0131, B:104:0x014c, B:105:0x0151, B:106:0x0156), top: B:118:0x001f }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00c6 A[Catch: all -> 0x0170, TryCatch #0 {all -> 0x0170, blocks: (B:5:0x001f, B:7:0x0029, B:17:0x0044, B:38:0x009b, B:45:0x00b4, B:46:0x00b7, B:48:0x00bb, B:53:0x00c6, B:55:0x00ca, B:57:0x00d0, B:59:0x00d8, B:62:0x00e0, B:63:0x00e7, B:65:0x00ed, B:67:0x00f3, B:69:0x00f9, B:71:0x00ff, B:73:0x0103, B:74:0x0107, B:87:0x0125, B:89:0x012a, B:91:0x0131, B:104:0x014c, B:105:0x0151, B:106:0x0156), top: B:118:0x001f }] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x012a A[Catch: all -> 0x0170, TryCatch #0 {all -> 0x0170, blocks: (B:5:0x001f, B:7:0x0029, B:17:0x0044, B:38:0x009b, B:45:0x00b4, B:46:0x00b7, B:48:0x00bb, B:53:0x00c6, B:55:0x00ca, B:57:0x00d0, B:59:0x00d8, B:62:0x00e0, B:63:0x00e7, B:65:0x00ed, B:67:0x00f3, B:69:0x00f9, B:71:0x00ff, B:73:0x0103, B:74:0x0107, B:87:0x0125, B:89:0x012a, B:91:0x0131, B:104:0x014c, B:105:0x0151, B:106:0x0156), top: B:118:0x001f }] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x012f  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0139  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x013b  */
    /* renamed from: handleMotionEvent-8iAsVTc  reason: not valid java name */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final int m6002handleMotionEvent8iAsVTc(android.view.MotionEvent r23) {
        /*
            Method dump skipped, instructions count: 377
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.platform.AndroidComposeView.m6002handleMotionEvent8iAsVTc(android.view.MotionEvent):int");
    }

    private final boolean hasChangedDevices(MotionEvent event, MotionEvent lastEvent) {
        return (lastEvent.getSource() == event.getSource() && lastEvent.getToolType(0) == event.getToolType(0)) ? false : true;
    }

    private final boolean isDevicePressEvent(MotionEvent event) {
        if (event.getButtonState() != 0) {
            return true;
        }
        switch (event.getActionMasked()) {
            case 0:
            case 2:
            case 6:
                return true;
            default:
                return false;
        }
    }

    /* renamed from: sendMotionEvent-8iAsVTc  reason: not valid java name */
    private final int m6006sendMotionEvent8iAsVTc(MotionEvent motionEvent) {
        Object item$iv;
        if (this.keyboardModifiersRequireUpdate) {
            this.keyboardModifiersRequireUpdate = false;
            this._windowInfo.m6055setKeyboardModifiers5xRPYO0(PointerKeyboardModifiers.m5574constructorimpl(motionEvent.getMetaState()));
        }
        PointerInputEvent pointerInputEvent = this.motionEventAdapter.convertToPointerInputEvent$ui_release(motionEvent, this);
        if (pointerInputEvent != null) {
            List $this$fastLastOrNull$iv = pointerInputEvent.getPointers();
            int size = $this$fastLastOrNull$iv.size() - 1;
            if (size >= 0) {
                do {
                    int index$iv = size;
                    size--;
                    item$iv = $this$fastLastOrNull$iv.get(index$iv);
                    PointerInputEventData it = (PointerInputEventData) item$iv;
                    if (it.getDown()) {
                        break;
                    }
                } while (size >= 0);
                item$iv = null;
            } else {
                item$iv = null;
            }
            PointerInputEventData pointerInputEventData = (PointerInputEventData) item$iv;
            if (pointerInputEventData != null) {
                long it2 = pointerInputEventData.m5528getPositionF1C5BW0();
                this.lastDownPointerPosition = it2;
            }
            int result = this.pointerInputEventProcessor.m5533processBIzXfog(pointerInputEvent, this, isInBounds(motionEvent));
            int action = motionEvent.getActionMasked();
            if (action != 0 && action != 5) {
                return result;
            }
            if ((result & 1) != 0) {
                return result;
            }
            this.motionEventAdapter.endStream(motionEvent.getPointerId(motionEvent.getActionIndex()));
            return result;
        }
        this.pointerInputEventProcessor.processCancel();
        return PointerInputEventProcessorKt.ProcessResult(false, false);
    }

    static /* synthetic */ void sendSimulatedEvent$default(AndroidComposeView androidComposeView, MotionEvent motionEvent, int i, long j, boolean z, int i2, Object obj) {
        boolean z2;
        if ((i2 & 8) == 0) {
            z2 = z;
        } else {
            z2 = true;
        }
        androidComposeView.sendSimulatedEvent(motionEvent, i, j, z2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void sendSimulatedEvent(MotionEvent motionEvent, int action, long eventTime, boolean forceHover) {
        long downTime;
        MotionEvent motionEvent2 = motionEvent;
        int upIndex = -1;
        switch (motionEvent2.getActionMasked()) {
            case 1:
                switch (action) {
                    case 9:
                    case 10:
                        break;
                    default:
                        upIndex = 0;
                        break;
                }
            case 6:
                upIndex = motionEvent2.getActionIndex();
                break;
        }
        int pointerCount = motionEvent2.getPointerCount() - (upIndex >= 0 ? 1 : 0);
        if (pointerCount == 0) {
            return;
        }
        MotionEvent.PointerProperties[] pointerProperties = new MotionEvent.PointerProperties[pointerCount];
        for (int i = 0; i < pointerCount; i++) {
            pointerProperties[i] = new MotionEvent.PointerProperties();
        }
        MotionEvent.PointerCoords[] pointerCoords = new MotionEvent.PointerCoords[pointerCount];
        for (int i2 = 0; i2 < pointerCount; i2++) {
            pointerCoords[i2] = new MotionEvent.PointerCoords();
        }
        int i3 = 0;
        while (i3 < pointerCount) {
            int sourceIndex = ((upIndex < 0 || i3 < upIndex) ? 0 : 1) + i3;
            motionEvent2.getPointerProperties(sourceIndex, pointerProperties[i3]);
            MotionEvent.PointerCoords coords = pointerCoords[i3];
            motionEvent2.getPointerCoords(sourceIndex, coords);
            float x$iv = coords.x;
            float y$iv = coords.y;
            long v1$iv$iv = Float.floatToRawIntBits(x$iv);
            long v2$iv$iv = Float.floatToRawIntBits(y$iv);
            long localPosition = Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L));
            long screenPosition = mo5592localToScreenMKHz9U(localPosition);
            long localPosition2 = screenPosition >> 32;
            int bits$iv$iv$iv = (int) localPosition2;
            coords.x = Float.intBitsToFloat(bits$iv$iv$iv);
            int bits$iv$iv$iv2 = (int) (screenPosition & 4294967295L);
            coords.y = Float.intBitsToFloat(bits$iv$iv$iv2);
            i3++;
            motionEvent2 = motionEvent;
        }
        int buttonState = forceHover ? 0 : motionEvent.getButtonState();
        if (motionEvent.getDownTime() == motionEvent.getEventTime()) {
            downTime = eventTime;
        } else {
            downTime = motionEvent.getDownTime();
        }
        MotionEvent event = MotionEvent.obtain(downTime, eventTime, action, pointerCount, pointerProperties, pointerCoords, motionEvent.getMetaState(), buttonState, motionEvent.getXPrecision(), motionEvent.getYPrecision(), motionEvent.getDeviceId(), motionEvent.getEdgeFlags(), motionEvent.getSource(), motionEvent.getFlags());
        PointerInputEvent pointerInputEvent = this.motionEventAdapter.convertToPointerInputEvent$ui_release(event, this);
        Intrinsics.checkNotNull(pointerInputEvent);
        this.pointerInputEventProcessor.m5533processBIzXfog(pointerInputEvent, this, true);
        event.recycle();
    }

    @Override // android.view.View
    public boolean canScrollHorizontally(int direction) {
        return this.composeAccessibilityDelegate.m6015canScroll0AR0LA0$ui_release(false, direction, this.lastDownPointerPosition);
    }

    @Override // android.view.View
    public boolean canScrollVertically(int direction) {
        return this.composeAccessibilityDelegate.m6015canScroll0AR0LA0$ui_release(true, direction, this.lastDownPointerPosition);
    }

    private final boolean isInBounds(MotionEvent motionEvent) {
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        if (0.0f <= x && x <= ((float) getWidth())) {
            if (0.0f <= y && y <= ((float) getHeight())) {
                return true;
            }
        }
        return false;
    }

    @Override // androidx.compose.ui.input.pointer.PositionCalculator
    /* renamed from: localToScreen-MK-Hz9U */
    public long mo5592localToScreenMKHz9U(long localPosition) {
        recalculateWindowPosition();
        long local = Matrix.m4525mapMKHz9U(this.viewToWindowMatrix, localPosition);
        int bits$iv$iv$iv = (int) (local >> 32);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv);
        long arg0$iv = this.windowPosition;
        int bits$iv$iv$iv2 = (int) (arg0$iv >> 32);
        float x$iv = intBitsToFloat + Float.intBitsToFloat(bits$iv$iv$iv2);
        int bits$iv$iv$iv3 = (int) (local & 4294967295L);
        float intBitsToFloat2 = Float.intBitsToFloat(bits$iv$iv$iv3);
        long arg0$iv2 = this.windowPosition;
        int bits$iv$iv$iv4 = (int) (arg0$iv2 & 4294967295L);
        float y$iv = intBitsToFloat2 + Float.intBitsToFloat(bits$iv$iv$iv4);
        long v1$iv$iv = Float.floatToRawIntBits(x$iv);
        long v2$iv$iv = Float.floatToRawIntBits(y$iv);
        return Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv));
    }

    @Override // androidx.compose.ui.input.pointer.MatrixPositionCalculator
    /* renamed from: localToScreen-58bKbWc */
    public void mo5441localToScreen58bKbWc(float[] localTransform) {
        recalculateWindowPosition();
        Matrix.m4538timesAssign58bKbWc(localTransform, this.viewToWindowMatrix);
        long arg0$iv = this.windowPosition;
        int bits$iv$iv$iv = (int) (arg0$iv >> 32);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv);
        long arg0$iv2 = this.windowPosition;
        int bits$iv$iv$iv2 = (int) (4294967295L & arg0$iv2);
        AndroidComposeView_androidKt.m6017access$preTranslatecG2Xzmc(localTransform, intBitsToFloat, Float.intBitsToFloat(bits$iv$iv$iv2), this.tmpMatrix);
    }

    @Override // androidx.compose.ui.input.pointer.PositionCalculator
    /* renamed from: screenToLocal-MK-Hz9U */
    public long mo5593screenToLocalMKHz9U(long positionOnScreen) {
        recalculateWindowPosition();
        int bits$iv$iv$iv = (int) (positionOnScreen >> 32);
        float intBitsToFloat = Float.intBitsToFloat(bits$iv$iv$iv);
        long arg0$iv = this.windowPosition;
        int bits$iv$iv$iv2 = (int) (arg0$iv >> 32);
        float x = intBitsToFloat - Float.intBitsToFloat(bits$iv$iv$iv2);
        int bits$iv$iv$iv3 = (int) (positionOnScreen & 4294967295L);
        float intBitsToFloat2 = Float.intBitsToFloat(bits$iv$iv$iv3);
        long arg0$iv2 = this.windowPosition;
        int bits$iv$iv$iv4 = (int) (arg0$iv2 & 4294967295L);
        float y = intBitsToFloat2 - Float.intBitsToFloat(bits$iv$iv$iv4);
        float[] fArr = this.windowToViewMatrix;
        long v1$iv$iv = Float.floatToRawIntBits(x);
        long v2$iv$iv = Float.floatToRawIntBits(y);
        return Matrix.m4525mapMKHz9U(fArr, Offset.m4040constructorimpl((v1$iv$iv << 32) | (4294967295L & v2$iv$iv)));
    }

    private final void recalculateWindowPosition() {
        if (!this.forceUseMatrixCache) {
            long animationTime = AnimationUtils.currentAnimationTimeMillis();
            if (animationTime != this.lastMatrixRecalculationAnimationTime) {
                this.lastMatrixRecalculationAnimationTime = animationTime;
                recalculateWindowViewTransforms();
                ViewParent viewParent = getParent();
                AndroidComposeView view = this;
                while (viewParent instanceof ViewGroup) {
                    view = (View) viewParent;
                    viewParent = ((ViewGroup) view).getParent();
                }
                view.getLocationOnScreen(this.tmpPositionArray);
                float screenX = this.tmpPositionArray[0];
                float screenY = this.tmpPositionArray[1];
                view.getLocationInWindow(this.tmpPositionArray);
                float windowX = this.tmpPositionArray[0];
                float windowY = this.tmpPositionArray[1];
                float x$iv = screenX - windowX;
                float y$iv = screenY - windowY;
                long v1$iv$iv = Float.floatToRawIntBits(x$iv);
                long v2$iv$iv = (v1$iv$iv << 32) | (Float.floatToRawIntBits(y$iv) & 4294967295L);
                this.windowPosition = Offset.m4040constructorimpl(v2$iv$iv);
            }
        }
    }

    private final void recalculateWindowPosition(MotionEvent motionEvent) {
        this.lastMatrixRecalculationAnimationTime = AnimationUtils.currentAnimationTimeMillis();
        recalculateWindowViewTransforms();
        float[] fArr = this.viewToWindowMatrix;
        float x$iv = motionEvent.getX();
        float y$iv = motionEvent.getY();
        long v1$iv$iv = Float.floatToRawIntBits(x$iv);
        long v2$iv$iv = Float.floatToRawIntBits(y$iv);
        long positionInWindow = Matrix.m4525mapMKHz9U(fArr, Offset.m4040constructorimpl((v1$iv$iv << 32) | (v2$iv$iv & 4294967295L)));
        int bits$iv$iv$iv = (int) (positionInWindow >> 32);
        float x$iv2 = motionEvent.getRawX() - Float.intBitsToFloat(bits$iv$iv$iv);
        int bits$iv$iv$iv2 = (int) (positionInWindow & 4294967295L);
        float y$iv2 = motionEvent.getRawY() - Float.intBitsToFloat(bits$iv$iv$iv2);
        long v1$iv$iv2 = Float.floatToRawIntBits(x$iv2);
        long v2$iv$iv2 = Float.floatToRawIntBits(y$iv2);
        this.windowPosition = Offset.m4040constructorimpl((v1$iv$iv2 << 32) | (4294967295L & v2$iv$iv2));
    }

    private final void recalculateWindowViewTransforms() {
        this.matrixToWindow.mo6021calculateMatrixToWindowEL8BTi8(this, this.viewToWindowMatrix);
        InvertMatrixKt.m6047invertToJiSxe2E(this.viewToWindowMatrix, this.windowToViewMatrix);
    }

    private final void updateWindowMetrics() {
        LazyWindowInfo this_$iv = this._windowInfo;
        MutableState it$iv = LazyWindowInfo.access$get_containerSize$p(this_$iv);
        if (it$iv == null) {
            return;
        }
        it$iv.setValue(IntSize.m7036boximpl(AndroidWindowInfo_androidKt.calculateWindowSize(this)));
    }

    @Override // android.view.View
    public boolean onCheckIsTextEditor() {
        AndroidPlatformTextInputSession parentSession = (AndroidPlatformTextInputSession) SessionMutex.m3872getCurrentSessionimpl(this.textInputSessionMutex);
        if (parentSession == null) {
            return this.legacyTextInputServiceAndroid.isEditorFocused();
        }
        return parentSession.isReadyForConnection();
    }

    @Override // android.view.View
    public InputConnection onCreateInputConnection(EditorInfo outAttrs) {
        AndroidPlatformTextInputSession parentSession = (AndroidPlatformTextInputSession) SessionMutex.m3872getCurrentSessionimpl(this.textInputSessionMutex);
        if (parentSession == null) {
            return this.legacyTextInputServiceAndroid.createInputConnection(outAttrs);
        }
        return parentSession.createInputConnection(outAttrs);
    }

    @Override // androidx.compose.ui.node.Owner
    /* renamed from: calculateLocalPosition-MK-Hz9U */
    public long mo5956calculateLocalPositionMKHz9U(long positionInWindow) {
        recalculateWindowPosition();
        return Matrix.m4525mapMKHz9U(this.windowToViewMatrix, positionInWindow);
    }

    @Override // androidx.compose.ui.node.Owner
    /* renamed from: calculatePositionInWindow-MK-Hz9U */
    public long mo5957calculatePositionInWindowMKHz9U(long localPosition) {
        recalculateWindowPosition();
        return Matrix.m4525mapMKHz9U(this.viewToWindowMatrix, localPosition);
    }

    @Override // android.view.View
    protected void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        setDensity(AndroidDensity_androidKt.Density(getContext()));
        updateWindowMetrics();
        if (getFontWeightAdjustmentCompat(newConfig) != this.currentFontWeightAdjustment) {
            this.currentFontWeightAdjustment = getFontWeightAdjustmentCompat(newConfig);
            setFontFamilyResolver(FontFamilyResolver_androidKt.createFontFamilyResolver(getContext()));
        }
        this.configurationChangeObserver.invoke(newConfig);
    }

    @Override // android.view.View
    public void onRtlPropertiesChanged(int layoutDirection) {
        if (this.superclassInitComplete) {
            LayoutDirection layoutDirection2 = FocusInteropUtils_androidKt.toLayoutDirection(layoutDirection);
            if (layoutDirection2 == null) {
                layoutDirection2 = LayoutDirection.Ltr;
            }
            setLayoutDirection(layoutDirection2);
        }
    }

    private final boolean autofillSupported() {
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchHoverEvent(MotionEvent event) {
        if (this.hoverExitReceived) {
            removeCallbacks(this.sendHoverExitEvent);
            this.sendHoverExitEvent.run();
        }
        if (isBadMotionEvent(event) || !isAttachedToWindow()) {
            return false;
        }
        this.composeAccessibilityDelegate.dispatchHoverEvent$ui_release(event);
        switch (event.getActionMasked()) {
            case 7:
                if (!isPositionChanged(event)) {
                    return false;
                }
                break;
            case 10:
                if (isInBounds(event)) {
                    if (event.getToolType(0) != 3 || event.getButtonState() == 0) {
                        MotionEvent motionEvent = this.previousMotionEvent;
                        if (motionEvent != null) {
                            motionEvent.recycle();
                        }
                        this.previousMotionEvent = MotionEvent.obtainNoHistory(event);
                        this.hoverExitReceived = true;
                        postDelayed(this.sendHoverExitEvent, 8L);
                        return false;
                    }
                    return false;
                }
                break;
        }
        int result = m6002handleMotionEvent8iAsVTc(event);
        return (result & 1) != 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:27:0x0052  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x0090 A[LOOP:0: B:28:0x0057->B:48:0x0090, LOOP_END] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x0093 A[EDGE_INSN: B:50:0x0093->B:49:0x0093 ?: BREAK  , SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private final boolean isBadMotionEvent(android.view.MotionEvent r11) {
        /*
            r10 = this;
            float r0 = r11.getX()
            r1 = 0
            int r2 = java.lang.Float.floatToRawIntBits(r0)
            r3 = 2147483647(0x7fffffff, float:NaN)
            r2 = r2 & r3
            r4 = 0
            r5 = 1
            r6 = 2139095040(0x7f800000, float:Infinity)
            if (r2 >= r6) goto L15
            r0 = r5
            goto L16
        L15:
            r0 = r4
        L16:
            if (r0 == 0) goto L4e
            float r0 = r11.getY()
            r1 = 0
            int r2 = java.lang.Float.floatToRawIntBits(r0)
            r2 = r2 & r3
            if (r2 >= r6) goto L26
            r0 = r5
            goto L27
        L26:
            r0 = r4
        L27:
            if (r0 == 0) goto L4e
            float r0 = r11.getRawX()
            r1 = 0
            int r2 = java.lang.Float.floatToRawIntBits(r0)
            r2 = r2 & r3
            if (r2 >= r6) goto L37
            r0 = r5
            goto L38
        L37:
            r0 = r4
        L38:
            if (r0 == 0) goto L4e
            float r0 = r11.getRawY()
            r1 = 0
            int r2 = java.lang.Float.floatToRawIntBits(r0)
            r2 = r2 & r3
            if (r2 >= r6) goto L48
            r0 = r5
            goto L49
        L48:
            r0 = r4
        L49:
            if (r0 != 0) goto L4c
            goto L4e
        L4c:
            r0 = r4
            goto L4f
        L4e:
            r0 = r5
        L4f:
            if (r0 != 0) goto L93
            r1 = 1
            int r2 = r11.getPointerCount()
        L57:
            if (r1 >= r2) goto L93
            float r7 = r11.getX(r1)
            r8 = 0
            int r9 = java.lang.Float.floatToRawIntBits(r7)
            r9 = r9 & r3
            if (r9 >= r6) goto L67
            r7 = r5
            goto L68
        L67:
            r7 = r4
        L68:
            if (r7 == 0) goto L8c
            float r7 = r11.getY(r1)
            r8 = 0
            int r9 = java.lang.Float.floatToRawIntBits(r7)
            r9 = r9 & r3
            if (r9 >= r6) goto L78
            r7 = r5
            goto L79
        L78:
            r7 = r4
        L79:
            if (r7 == 0) goto L8c
            int r7 = android.os.Build.VERSION.SDK_INT
            r8 = 29
            if (r7 < r8) goto L8a
            androidx.compose.ui.platform.MotionEventVerifierApi29 r7 = androidx.compose.ui.platform.MotionEventVerifierApi29.INSTANCE
            boolean r7 = r7.isValidMotionEvent(r11, r1)
            if (r7 != 0) goto L8a
            goto L8c
        L8a:
            r7 = r4
            goto L8d
        L8c:
            r7 = r5
        L8d:
            r0 = r7
            if (r0 != 0) goto L93
            int r1 = r1 + 1
            goto L57
        L93:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.compose.ui.platform.AndroidComposeView.isBadMotionEvent(android.view.MotionEvent):boolean");
    }

    private final boolean isPositionChanged(MotionEvent event) {
        MotionEvent lastEvent;
        if (event.getPointerCount() == 1 && (lastEvent = this.previousMotionEvent) != null && lastEvent.getPointerCount() == event.getPointerCount()) {
            if (event.getRawX() == lastEvent.getRawX()) {
                return !((event.getRawY() > lastEvent.getRawY() ? 1 : (event.getRawY() == lastEvent.getRawY() ? 0 : -1)) == 0);
            }
            return true;
        }
        return true;
    }

    private final View findViewByAccessibilityIdRootedAtCurrentView(int accessibilityId, View currentView) {
        if (Build.VERSION.SDK_INT < 29) {
            Method getAccessibilityViewIdMethod = Class.forName(AndroidComposeViewAccessibilityDelegateCompat.ClassName).getDeclaredMethod("getAccessibilityViewId", new Class[0]);
            getAccessibilityViewIdMethod.setAccessible(true);
            if (Intrinsics.areEqual(getAccessibilityViewIdMethod.invoke(currentView, new Object[0]), Integer.valueOf(accessibilityId))) {
                return currentView;
            }
            if (currentView instanceof ViewGroup) {
                int childCount = ((ViewGroup) currentView).getChildCount();
                for (int i = 0; i < childCount; i++) {
                    View foundView = findViewByAccessibilityIdRootedAtCurrentView(accessibilityId, ((ViewGroup) currentView).getChildAt(i));
                    if (foundView != null) {
                        return foundView;
                    }
                }
                return null;
            }
            return null;
        }
        return null;
    }

    @Override // android.view.ViewGroup, android.view.View
    public android.view.PointerIcon onResolvePointerIcon(MotionEvent event, int pointerIndex) {
        PointerIcon icon;
        int toolType = event.getToolType(pointerIndex);
        if (!event.isFromSource(8194) && event.isFromSource(InputDeviceCompat.SOURCE_STYLUS) && ((toolType == 2 || toolType == 4) && (icon = getPointerIconService().getStylusHoverIcon()) != null)) {
            return AndroidComposeViewVerificationHelperMethodsN.INSTANCE.toAndroidPointerIcon(getContext(), icon);
        }
        return super.onResolvePointerIcon(event, pointerIndex);
    }

    @Override // androidx.compose.ui.node.Owner
    public PointerIconService getPointerIconService() {
        return this.pointerIconService;
    }

    public final View findViewByAccessibilityIdTraversal(int accessibilityId) {
        try {
            if (Build.VERSION.SDK_INT >= 29) {
                Method findViewByAccessibilityIdTraversalMethod = Class.forName(AndroidComposeViewAccessibilityDelegateCompat.ClassName).getDeclaredMethod("findViewByAccessibilityIdTraversal", Integer.TYPE);
                findViewByAccessibilityIdTraversalMethod.setAccessible(true);
                Object invoke = findViewByAccessibilityIdTraversalMethod.invoke(this, Integer.valueOf(accessibilityId));
                if (invoke instanceof View) {
                    return (View) invoke;
                }
                return null;
            }
            return findViewByAccessibilityIdRootedAtCurrentView(accessibilityId, this);
        } catch (NoSuchMethodException e) {
            return null;
        }
    }

    @Override // androidx.compose.ui.platform.ViewRootForTest
    public boolean isLifecycleInResumedState() {
        LifecycleOwner lifecycleOwner;
        Lifecycle lifecycle;
        ViewTreeOwners viewTreeOwners = getViewTreeOwners();
        return ((viewTreeOwners == null || (lifecycleOwner = viewTreeOwners.getLifecycleOwner()) == null || (lifecycle = lifecycleOwner.getLifecycle()) == null) ? null : lifecycle.getCurrentState()) == Lifecycle.State.RESUMED;
    }

    @Override // android.view.ViewGroup
    public boolean shouldDelayChildPressedState() {
        return false;
    }

    @Override // androidx.compose.ui.node.Owner
    public void incrementSensitiveComponentCount() {
        if (Build.VERSION.SDK_INT >= 35) {
            if (this.sensitiveComponentCount == 0) {
                AndroidComposeViewSensitiveContent35.INSTANCE.setContentSensitivity(getView(), true);
            }
            this.sensitiveComponentCount++;
        }
    }

    @Override // androidx.compose.ui.node.Owner
    public void decrementSensitiveComponentCount() {
        if (Build.VERSION.SDK_INT >= 35) {
            if (this.sensitiveComponentCount == 1) {
                AndroidComposeViewSensitiveContent35.INSTANCE.setContentSensitivity(getView(), false);
            }
            this.sensitiveComponentCount--;
        }
    }

    /* compiled from: AndroidComposeView.android.kt */
    @Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\b\u0086\u0003\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\b\u0010\u0007\u001a\u00020\bH\u0002R\u0010\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0082\u000e¢\u0006\u0002\n\u0000R\u0014\u0010\u0005\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0006X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\t"}, d2 = {"Landroidx/compose/ui/platform/AndroidComposeView$Companion;", "", "()V", "getBooleanMethod", "Ljava/lang/reflect/Method;", "systemPropertiesClass", "Ljava/lang/Class;", "getIsShowingLayoutBounds", "", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        private Companion() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public final boolean getIsShowingLayoutBounds() {
            try {
                if (AndroidComposeView.systemPropertiesClass == null) {
                    AndroidComposeView.systemPropertiesClass = Class.forName("android.os.SystemProperties");
                    Class cls = AndroidComposeView.systemPropertiesClass;
                    AndroidComposeView.getBooleanMethod = cls != null ? cls.getDeclaredMethod("getBoolean", String.class, Boolean.TYPE) : null;
                }
                Method method = AndroidComposeView.getBooleanMethod;
                Object invoke = method != null ? method.invoke(null, "debug.layout", false) : null;
                Boolean bool = invoke instanceof Boolean ? invoke : null;
                if (bool != null) {
                    return bool.booleanValue();
                }
                return false;
            } catch (Exception e) {
                return false;
            }
        }
    }

    /* compiled from: AndroidComposeView.android.kt */
    @Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\b\u0007\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0002\u0010\u0006R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\bR\u0011\u0010\u0004\u001a\u00020\u0005¢\u0006\b\n\u0000\u001a\u0004\b\t\u0010\n¨\u0006\u000b"}, d2 = {"Landroidx/compose/ui/platform/AndroidComposeView$ViewTreeOwners;", "", "lifecycleOwner", "Landroidx/lifecycle/LifecycleOwner;", "savedStateRegistryOwner", "Landroidx/savedstate/SavedStateRegistryOwner;", "(Landroidx/lifecycle/LifecycleOwner;Landroidx/savedstate/SavedStateRegistryOwner;)V", "getLifecycleOwner", "()Landroidx/lifecycle/LifecycleOwner;", "getSavedStateRegistryOwner", "()Landroidx/savedstate/SavedStateRegistryOwner;", "ui_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
    /* loaded from: classes11.dex */
    public static final class ViewTreeOwners {
        public static final int $stable = 8;
        private final LifecycleOwner lifecycleOwner;
        private final SavedStateRegistryOwner savedStateRegistryOwner;

        public ViewTreeOwners(LifecycleOwner lifecycleOwner, SavedStateRegistryOwner savedStateRegistryOwner) {
            this.lifecycleOwner = lifecycleOwner;
            this.savedStateRegistryOwner = savedStateRegistryOwner;
        }

        public final LifecycleOwner getLifecycleOwner() {
            return this.lifecycleOwner;
        }

        public final SavedStateRegistryOwner getSavedStateRegistryOwner() {
            return this.savedStateRegistryOwner;
        }
    }
}
