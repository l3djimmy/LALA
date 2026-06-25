package androidx.compose.ui.util;

import androidx.autofill.HintConstants;
import androidx.collection.MutableScatterSet;
import androidx.exifinterface.media.ExifInterface;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.NoSuchElementException;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.collections.CollectionsKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
/* compiled from: ListUtils.kt */
@Metadata(d1 = {"\u0000n\n\u0000\n\u0002\u0010\u0001\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0010\r\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\u0010 \n\u0002\b\u0007\n\u0002\u0010\u0000\n\u0002\b\u0006\n\u0002\u0010\u001c\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\b\n\u0002\b\u0013\n\u0002\u0010\u001f\n\u0002\b\u0003\n\u0002\u0010\u000f\n\u0002\b\u0011\u001a\u0010\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0001\u001a\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0002\u001a\u00020\u0003H\u0001\u001a9\u0010\u0006\u001a\u00020\u0005\"\u0004\b\u0000\u0010\u0007*\u00060\bj\u0002`\t2\u0006\u0010\n\u001a\u0002H\u00072\u0014\u0010\u000b\u001a\u0010\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\r\u0018\u00010\fH\u0002¢\u0006\u0002\u0010\u000e\u001a8\u0010\u000f\u001a\u00020\u0010\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\u00100\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001a8\u0010\u0013\u001a\u00020\u0010\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\u00100\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001aD\u0010\u0014\u001a\b\u0012\u0004\u0012\u0002H\u00070\u0011\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u0015*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u00150\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001a>\u0010\u0017\u001a\b\u0012\u0004\u0012\u0002H\u00070\u0011\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\u00100\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001a\"\u0010\u0018\u001a\b\u0012\u0004\u0012\u0002H\u00070\u0011\"\b\b\u0000\u0010\u0007*\u00020\u0019*\n\u0012\u0006\u0012\u0004\u0018\u0001H\u00070\u0011\u001a`\u0010\u001a\u001a\b\u0012\u0004\u0012\u0002H\u001b0\u0011\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\u00100\f2\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u001b0\fH\u0086\b\u0082\u0002\u0010\n\u0006\b\u0001\u0012\u0002\u0010\u0001\n\u0006\b\u0001\u0012\u0002\u0010\u0002\u001a=\u0010\u001c\u001a\u0002H\u0007\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\u00100\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010\u001d\u001a?\u0010\u001e\u001a\u0004\u0018\u0001H\u0007\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\u00100\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010\u001d\u001aJ\u0010\u001f\u001a\b\u0012\u0004\u0012\u0002H\u001b0\u0011\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0018\u0010\u000b\u001a\u0014\u0012\u0004\u0012\u0002H\u0007\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u001b0 0\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001a`\u0010!\u001a\u0002H\u001b\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0006\u0010\"\u001a\u0002H\u001b2'\u0010#\u001a#\u0012\u0013\u0012\u0011H\u001b¢\u0006\f\b%\u0012\b\b&\u0012\u0004\b\b('\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u001b0$H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0002¢\u0006\u0002\u0010(\u001a8\u0010)\u001a\u00020\u0005\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\u00050\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001a>\u0010+\u001a\u00020\u0005\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0018\u0010*\u001a\u0014\u0012\u0004\u0012\u00020,\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\u00050$H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001a8\u0010-\u001a\u00020\u0005\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010*\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\u00050\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001a}\u0010.\u001a\u0002H/\"\u0004\b\u0000\u0010\u0007\"\f\b\u0001\u0010/*\u00060\bj\u0002`\t*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0006\u00100\u001a\u0002H/2\b\b\u0002\u00101\u001a\u00020\r2\b\b\u0002\u00102\u001a\u00020\r2\b\b\u0002\u00103\u001a\u00020\r2\b\b\u0002\u00104\u001a\u00020,2\b\b\u0002\u00105\u001a\u00020\r2\u0016\b\u0002\u0010\u000b\u001a\u0010\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\r\u0018\u00010\fH\u0002¢\u0006\u0002\u00106\u001a`\u00107\u001a\u00020\u0003\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\b\b\u0002\u00101\u001a\u00020\r2\b\b\u0002\u00102\u001a\u00020\r2\b\b\u0002\u00103\u001a\u00020\r2\b\b\u0002\u00104\u001a\u00020,2\b\b\u0002\u00105\u001a\u00020\r2\u0016\b\u0002\u0010\u000b\u001a\u0010\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\r\u0018\u00010\f\u001a?\u00108\u001a\u0004\u0018\u0001H\u0007\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020\u00100\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010\u001d\u001aD\u00109\u001a\b\u0012\u0004\u0012\u0002H\u001b0\u0011\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u001b0\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001aY\u0010:\u001a\b\u0012\u0004\u0012\u0002H\u001b0\u0011\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u00070\u00112'\u0010\u000b\u001a#\u0012\u0013\u0012\u00110,¢\u0006\f\b%\u0012\b\b&\u0012\u0004\b\b(;\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u001b0$H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001a[\u0010<\u001a\b\u0012\u0004\u0012\u0002H\u001b0\u0011\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u00070\u00112)\u0010\u000b\u001a%\u0012\u0013\u0012\u00110,¢\u0006\f\b%\u0012\b\b&\u0012\u0004\b\b(;\u0012\u0004\u0012\u0002H\u0007\u0012\u0006\u0012\u0004\u0018\u0001H\u001b0$H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001aF\u0010=\u001a\b\u0012\u0004\u0012\u0002H\u001b0\u0011\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0014\u0010\u000b\u001a\u0010\u0012\u0004\u0012\u0002H\u0007\u0012\u0006\u0012\u0004\u0018\u0001H\u001b0\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001a]\u0010>\u001a\u0002H?\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u001b\"\u0010\b\u0002\u0010?*\n\u0012\u0006\b\u0000\u0012\u0002H\u001b0@*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0006\u0010A\u001a\u0002H?2\u0012\u0010\u000b\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u001b0\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0002¢\u0006\u0002\u0010B\u001aO\u0010C\u001a\u0004\u0018\u0001H\u0007\"\u0004\b\u0000\u0010\u0007\"\u000e\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u001b0D*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u001b0\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010\u001d\u001aU\u0010E\u001a\u0002H\u001b\"\u0004\b\u0000\u0010\u0007\"\u000e\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u001b0D*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0006\u0010F\u001a\u0002H\u001b2\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u001b0\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0002¢\u0006\u0002\u0010G\u001aO\u0010H\u001a\u0004\u0018\u0001H\u001b\"\u0004\b\u0000\u0010\u0007\"\u000e\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u001b0D*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u001b0\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010I\u001aO\u0010J\u001a\u0004\u0018\u0001H\u0007\"\u0004\b\u0000\u0010\u0007\"\u000e\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u001b0D*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u001b0\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010\u001d\u001a\\\u0010K\u001a\u0002HL\"\u0004\b\u0000\u0010L\"\b\b\u0001\u0010\u0007*\u0002HL*\b\u0012\u0004\u0012\u0002H\u00070\u00112'\u0010#\u001a#\u0012\u0013\u0012\u0011HL¢\u0006\f\b%\u0012\b\b&\u0012\u0004\b\b('\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002HL0$H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¢\u0006\u0002\u0010M\u001a8\u0010N\u001a\u00020,\"\u0004\b\u0000\u0010\u0007*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0012\u0010\u0016\u001a\u000e\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u00020,0\fH\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001\u001a|\u0010O\u001a\b\u0012\u0004\u0012\u0002HP0\u0011\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u001b\"\u0004\b\u0002\u0010P*\b\u0012\u0004\u0012\u0002H\u00070\u00112\f\u0010Q\u001a\b\u0012\u0004\u0012\u0002H\u001b0\u001126\u0010\u000b\u001a2\u0012\u0013\u0012\u0011H\u0007¢\u0006\f\b%\u0012\b\b&\u0012\u0004\b\b(R\u0012\u0013\u0012\u0011H\u001b¢\u0006\f\b%\u0012\b\b&\u0012\u0004\b\b(S\u0012\u0004\u0012\u0002HP0$H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0002\u001aJ\u0010T\u001a\b\u0012\u0004\u0012\u0002H\u001b0\u0011\"\u0004\b\u0000\u0010\u0007\"\u0004\b\u0001\u0010\u001b*\b\u0012\u0004\u0012\u0002H\u00070\u00112\u0018\u0010\u000b\u001a\u0014\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u0007\u0012\u0004\u0012\u0002H\u001b0$H\u0086\b\u0082\u0002\b\n\u0006\b\u0001\u0012\u0002\u0010\u0001¨\u0006U"}, d2 = {"throwNoSuchElementException", "", "message", "", "throwUnsupportedOperationException", "", "appendElement", ExifInterface.GPS_DIRECTION_TRUE, "Ljava/lang/Appendable;", "Lkotlin/text/Appendable;", "element", "transform", "Lkotlin/Function1;", "", "(Ljava/lang/Appendable;Ljava/lang/Object;Lkotlin/jvm/functions/Function1;)V", "fastAll", "", "", "predicate", "fastAny", "fastDistinctBy", "K", "selector", "fastFilter", "fastFilterNotNull", "", "fastFilteredMap", "R", "fastFirst", "(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;", "fastFirstOrNull", "fastFlatMap", "", "fastFold", "initial", "operation", "Lkotlin/Function2;", "Lkotlin/ParameterName;", HintConstants.AUTOFILL_HINT_NAME, "acc", "(Ljava/util/List;Ljava/lang/Object;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;", "fastForEach", "action", "fastForEachIndexed", "", "fastForEachReversed", "fastJoinTo", ExifInterface.GPS_MEASUREMENT_IN_PROGRESS, "buffer", "separator", "prefix", "postfix", "limit", "truncated", "(Ljava/util/List;Ljava/lang/Appendable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;)Ljava/lang/Appendable;", "fastJoinToString", "fastLastOrNull", "fastMap", "fastMapIndexed", "index", "fastMapIndexedNotNull", "fastMapNotNull", "fastMapTo", "C", "", "destination", "(Ljava/util/List;Ljava/util/Collection;Lkotlin/jvm/functions/Function1;)Ljava/util/Collection;", "fastMaxBy", "", "fastMaxOfOrDefault", "defaultValue", "(Ljava/util/List;Ljava/lang/Comparable;Lkotlin/jvm/functions/Function1;)Ljava/lang/Comparable;", "fastMaxOfOrNull", "(Ljava/util/List;Lkotlin/jvm/functions/Function1;)Ljava/lang/Comparable;", "fastMinByOrNull", "fastReduce", ExifInterface.LATITUDE_SOUTH, "(Ljava/util/List;Lkotlin/jvm/functions/Function2;)Ljava/lang/Object;", "fastSumBy", "fastZip", ExifInterface.GPS_MEASUREMENT_INTERRUPTED, "other", "a", "b", "fastZipWithNext", "ui-util_release"}, k = 2, mv = {1, 8, 0}, xi = 48)
/* loaded from: classes11.dex */
public final class ListUtilsKt {
    public static final <T> void fastForEach(List<? extends T> list, Function1<? super T, Unit> function1) {
        int size = list.size();
        for (int index = 0; index < size; index++) {
            Object item = (T) list.get(index);
            function1.invoke(item);
        }
    }

    public static final <T> void fastForEachReversed(List<? extends T> list, Function1<? super T, Unit> function1) {
        int size = list.size() - 1;
        if (size >= 0) {
            do {
                int index = size;
                size--;
                Object item = (T) list.get(index);
                function1.invoke(item);
            } while (size >= 0);
        }
    }

    public static final <T> void fastForEachIndexed(List<? extends T> list, Function2<? super Integer, ? super T, Unit> function2) {
        int size = list.size();
        for (int index = 0; index < size; index++) {
            Object item = (T) list.get(index);
            function2.invoke(Integer.valueOf(index), item);
        }
    }

    public static final <T> boolean fastAll(List<? extends T> list, Function1<? super T, Boolean> function1) {
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            if (!function1.invoke(item$iv).booleanValue()) {
                return false;
            }
        }
        return true;
    }

    public static final <T> boolean fastAny(List<? extends T> list, Function1<? super T, Boolean> function1) {
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            if (function1.invoke(item$iv).booleanValue()) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r5v0, types: [T, java.lang.Object] */
    public static final <T> T fastFirstOrNull(List<? extends T> list, Function1<? super T, Boolean> function1) {
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            T t = list.get(index$iv);
            if (function1.invoke(t).booleanValue()) {
                return t;
            }
        }
        return null;
    }

    public static final <T> int fastSumBy(List<? extends T> list, Function1<? super T, Integer> function1) {
        int sum = 0;
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            sum += function1.invoke(item$iv).intValue();
        }
        return sum;
    }

    public static final <T, R> List<R> fastMap(List<? extends T> list, Function1<? super T, ? extends R> function1) {
        ArrayList target = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            target.add(function1.invoke(item$iv));
        }
        return target;
    }

    public static final <T, R extends Comparable<? super R>> T fastMaxBy(List<? extends T> list, Function1<? super T, ? extends R> function1) {
        if (list.isEmpty()) {
            return null;
        }
        T maxElem = list.get(0);
        Comparable maxValue = function1.invoke(maxElem);
        int i = 1;
        int lastIndex = CollectionsKt.getLastIndex(list);
        if (1 <= lastIndex) {
            while (true) {
                T e = list.get(i);
                R invoke = function1.invoke(e);
                if (maxValue.compareTo(invoke) < 0) {
                    maxElem = e;
                    maxValue = invoke;
                }
                if (i == lastIndex) {
                    break;
                }
                i++;
            }
        }
        return (T) maxElem;
    }

    public static final <T, R, C extends Collection<? super R>> C fastMapTo(List<? extends T> list, C c, Function1<? super T, ? extends R> function1) {
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            c.add(function1.invoke(item$iv));
        }
        return c;
    }

    /* JADX WARN: Type inference failed for: r3v0, types: [T, java.lang.Object] */
    public static final <T> T fastLastOrNull(List<? extends T> list, Function1<? super T, Boolean> function1) {
        int size = list.size() - 1;
        if (size >= 0) {
            do {
                int index = size;
                size--;
                T t = list.get(index);
                if (function1.invoke(t).booleanValue()) {
                    return t;
                }
            } while (size >= 0);
            return null;
        }
        return null;
    }

    public static final <T> List<T> fastFilter(List<? extends T> list, Function1<? super T, Boolean> function1) {
        ArrayList target = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            if (function1.invoke(item$iv).booleanValue()) {
                target.add(item$iv);
            }
        }
        return target;
    }

    public static final <T, R> List<R> fastFilteredMap(List<? extends T> list, Function1<? super T, Boolean> function1, Function1<? super T, ? extends R> function12) {
        ArrayList target = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            if (function1.invoke(item$iv).booleanValue()) {
                target.add(function12.invoke(item$iv));
            }
        }
        return target;
    }

    public static final <T, R> R fastFold(List<? extends T> list, R r, Function2<? super R, ? super T, ? extends R> function2) {
        Object accumulator = r;
        Object accumulator2 = (R) accumulator;
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            accumulator2 = (R) function2.invoke(accumulator2, item$iv);
        }
        return (R) accumulator2;
    }

    public static final <T, R> List<R> fastMapIndexed(List<? extends T> list, Function2<? super Integer, ? super T, ? extends R> function2) {
        ArrayList target = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            int index = index$iv;
            target.add(function2.invoke(Integer.valueOf(index), item$iv));
        }
        return target;
    }

    public static final <T, R> List<R> fastMapIndexedNotNull(List<? extends T> list, Function2<? super Integer, ? super T, ? extends R> function2) {
        ArrayList target = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            int index = index$iv;
            R invoke = function2.invoke(Integer.valueOf(index), item$iv);
            if (invoke != null) {
                target.add(invoke);
            }
        }
        return target;
    }

    public static final <T, R extends Comparable<? super R>> R fastMaxOfOrNull(List<? extends T> list, Function1<? super T, ? extends R> function1) {
        if (list.isEmpty()) {
            return null;
        }
        R invoke = function1.invoke((T) list.get(0));
        int i = 1;
        int lastIndex = CollectionsKt.getLastIndex(list);
        if (1 <= lastIndex) {
            while (true) {
                R invoke2 = function1.invoke((T) list.get(i));
                if (invoke2.compareTo(invoke) > 0) {
                    invoke = invoke2;
                }
                if (i == lastIndex) {
                    break;
                }
                i++;
            }
        }
        return invoke;
    }

    public static final <T, R extends Comparable<? super R>> R fastMaxOfOrDefault(List<? extends T> list, R r, Function1<? super T, ? extends R> function1) {
        if (list.isEmpty()) {
            return r;
        }
        R invoke = function1.invoke((T) list.get(0));
        int i = 1;
        int lastIndex = CollectionsKt.getLastIndex(list);
        if (1 <= lastIndex) {
            while (true) {
                R invoke2 = function1.invoke((T) list.get(i));
                if (invoke2.compareTo(invoke) > 0) {
                    invoke = invoke2;
                }
                if (i == lastIndex) {
                    break;
                }
                i++;
            }
        }
        return invoke;
    }

    public static final <T, R> List<R> fastZipWithNext(List<? extends T> list, Function2<? super T, ? super T, ? extends R> function2) {
        if (list.size() <= 1) {
            return CollectionsKt.emptyList();
        }
        List result = new ArrayList();
        T current = list.get(0);
        int lastIndex = CollectionsKt.getLastIndex(list);
        for (int i = 0; i < lastIndex; i++) {
            T next = list.get(i + 1);
            result.add(function2.invoke(current, next));
            Object current2 = next;
            current = (Object) current2;
        }
        return result;
    }

    public static final <S, T extends S> S fastReduce(List<? extends T> list, Function2<? super S, ? super T, ? extends S> function2) {
        if (list.isEmpty()) {
            throwUnsupportedOperationException("Empty collection can't be reduced.");
        }
        Object accumulator = (Object) CollectionsKt.first((List<? extends Object>) list);
        int i = 1;
        int lastIndex = CollectionsKt.getLastIndex(list);
        if (1 <= lastIndex) {
            while (true) {
                accumulator = (S) function2.invoke(accumulator, (T) list.get(i));
                if (i == lastIndex) {
                    break;
                }
                i++;
            }
        }
        return (S) accumulator;
    }

    public static final <T, R, V> List<V> fastZip(List<? extends T> list, List<? extends R> list2, Function2<? super T, ? super R, ? extends V> function2) {
        int minSize = Math.min(list.size(), list2.size());
        ArrayList target = new ArrayList(minSize);
        for (int i = 0; i < minSize; i++) {
            target.add(function2.invoke((T) list.get(i), (R) list2.get(i)));
        }
        return target;
    }

    public static final <T, R> List<R> fastMapNotNull(List<? extends T> list, Function1<? super T, ? extends R> function1) {
        ArrayList target = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            R invoke = function1.invoke(item$iv);
            if (invoke != null) {
                target.add(invoke);
            }
        }
        return target;
    }

    public static /* synthetic */ String fastJoinToString$default(List list, CharSequence charSequence, CharSequence charSequence2, CharSequence charSequence3, int i, CharSequence charSequence4, Function1 function1, int i2, Object obj) {
        if ((i2 & 1) != 0) {
        }
        if ((i2 & 2) != 0) {
        }
        if ((i2 & 4) != 0) {
        }
        if ((i2 & 8) != 0) {
            i = -1;
        }
        if ((i2 & 16) != 0) {
        }
        Function1 function12 = (i2 & 32) != 0 ? null : function1;
        CharSequence charSequence5 = charSequence4;
        return fastJoinToString(list, charSequence, charSequence2, charSequence3, i, charSequence5, function12);
    }

    public static final <T> String fastJoinToString(List<? extends T> list, CharSequence separator, CharSequence prefix, CharSequence postfix, int limit, CharSequence truncated, Function1<? super T, ? extends CharSequence> function1) {
        return ((StringBuilder) fastJoinTo(list, new StringBuilder(), separator, prefix, postfix, limit, truncated, function1)).toString();
    }

    public static final <T, K> List<T> fastDistinctBy(List<? extends T> list, Function1<? super T, ? extends K> function1) {
        MutableScatterSet set = new MutableScatterSet(list.size());
        ArrayList target = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            if (set.add(function1.invoke(item$iv))) {
                target.add(item$iv);
            }
        }
        return target;
    }

    public static final <T, R extends Comparable<? super R>> T fastMinByOrNull(List<? extends T> list, Function1<? super T, ? extends R> function1) {
        if (list.isEmpty()) {
            return null;
        }
        T minElem = list.get(0);
        Comparable minValue = function1.invoke(minElem);
        int i = 1;
        int lastIndex = CollectionsKt.getLastIndex(list);
        if (1 <= lastIndex) {
            while (true) {
                T e = list.get(i);
                R invoke = function1.invoke(e);
                if (minValue.compareTo(invoke) > 0) {
                    minElem = e;
                    minValue = invoke;
                }
                if (i == lastIndex) {
                    break;
                }
                i++;
            }
        }
        return (T) minElem;
    }

    public static final <T, R> List<R> fastFlatMap(List<? extends T> list, Function1<? super T, ? extends Iterable<? extends R>> function1) {
        ArrayList target = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            Object item$iv = (T) list.get(index$iv);
            Iterable list2 = function1.invoke(item$iv);
            CollectionsKt.addAll(target, list2);
        }
        return target;
    }

    public static final <T> List<T> fastFilterNotNull(List<? extends T> list) {
        ArrayList target = new ArrayList(list.size());
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            T t = list.get(index$iv);
            if (t != null) {
                target.add(t);
            }
        }
        return target;
    }

    /* JADX WARN: Type inference failed for: r5v0, types: [T, java.lang.Object] */
    public static final <T> T fastFirst(List<? extends T> list, Function1<? super T, Boolean> function1) {
        int size = list.size();
        for (int index$iv = 0; index$iv < size; index$iv++) {
            T t = list.get(index$iv);
            if (function1.invoke(t).booleanValue()) {
                return t;
            }
        }
        throwNoSuchElementException("Collection contains no element matching the predicate.");
        throw new KotlinNothingValueException();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final <T, A extends Appendable> A fastJoinTo(List<? extends T> list, A a, CharSequence separator, CharSequence prefix, CharSequence postfix, int limit, CharSequence truncated, Function1<? super T, ? extends CharSequence> function1) {
        a.append(prefix);
        int count = 0;
        int size = list.size();
        for (int index = 0; index < size; index++) {
            Object element = list.get(index);
            count++;
            if (count > 1) {
                a.append(separator);
            }
            if (limit >= 0 && count > limit) {
                break;
            }
            appendElement(a, element, function1);
        }
        if (limit >= 0 && count > limit) {
            a.append(truncated);
        }
        a.append(postfix);
        return a;
    }

    private static final <T> void appendElement(Appendable $this$appendElement, T t, Function1<? super T, ? extends CharSequence> function1) {
        if (function1 == null) {
            if (!(t == null ? true : t instanceof CharSequence)) {
                if (!(t instanceof Character)) {
                    $this$appendElement.append(String.valueOf(t));
                    return;
                } else {
                    $this$appendElement.append(((Character) t).charValue());
                    return;
                }
            }
            $this$appendElement.append((CharSequence) t);
            return;
        }
        $this$appendElement.append(function1.invoke(t));
    }

    public static final Void throwNoSuchElementException(String message) {
        throw new NoSuchElementException(message);
    }

    public static final void throwUnsupportedOperationException(String message) {
        throw new UnsupportedOperationException(message);
    }
}
