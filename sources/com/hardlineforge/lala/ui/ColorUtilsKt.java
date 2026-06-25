package com.hardlineforge.lala.ui;

import androidx.compose.material3.MaterialTheme;
import androidx.compose.runtime.Composer;
import androidx.compose.runtime.ComposerKt;
import androidx.compose.ui.graphics.Color;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
/* compiled from: ColorUtils.kt */
@Metadata(d1 = {"\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\u001a\u0015\u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u0003H\u0007¢\u0006\u0002\u0010\u0004¨\u0006\u0005"}, d2 = {"categoryColor", "Landroidx/compose/ui/graphics/Color;", "category", "", "(Ljava/lang/String;Landroidx/compose/runtime/Composer;I)J", "app_debug"}, k = 2, mv = {2, 2, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ColorUtilsKt {
    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    public static final long categoryColor(String category, Composer $composer, int $changed) {
        long m1960getPrimary0d7_KjU;
        Intrinsics.checkNotNullParameter(category, "category");
        ComposerKt.sourceInformationMarkerStart($composer, 259434326, "C(categoryColor):ColorUtils.kt#f9vj6j");
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventStart(259434326, $changed, -1, "com.hardlineforge.lala.ui.categoryColor (ColorUtils.kt:7)");
        }
        switch (category.hashCode()) {
            case -1043760014:
                if (category.equals("Suspicious Activity")) {
                    $composer.startReplaceGroup(208289791);
                    ComposerKt.sourceInformation($composer, "9@334L11");
                    m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1963getSecondary0d7_KjU();
                    $composer.endReplaceGroup();
                    break;
                }
                $composer.startReplaceGroup(208305085);
                ComposerKt.sourceInformation($composer, "17@812L11");
                m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                $composer.endReplaceGroup();
                break;
            case -1027965060:
                if (category.equals("Poaching / Wildlife")) {
                    $composer.startReplaceGroup(208303582);
                    ComposerKt.sourceInformation($composer, "16@765L11");
                    m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1975getTertiary0d7_KjU();
                    $composer.endReplaceGroup();
                    break;
                }
                $composer.startReplaceGroup(208305085);
                ComposerKt.sourceInformation($composer, "17@812L11");
                m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                $composer.endReplaceGroup();
                break;
            case 75446010:
                if (category.equals("Noise")) {
                    $composer.startReplaceGroup(208287835);
                    ComposerKt.sourceInformation($composer, "8@273L11");
                    m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1942getError0d7_KjU();
                    $composer.endReplaceGroup();
                    break;
                }
                $composer.startReplaceGroup(208305085);
                ComposerKt.sourceInformation($composer, "17@812L11");
                m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                $composer.endReplaceGroup();
                break;
            case 555081395:
                if (category.equals("Trash / Yard")) {
                    $composer.startReplaceGroup(208296996);
                    ComposerKt.sourceInformation($composer, "13@559L11");
                    m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1974getSurfaceVariant0d7_KjU();
                    $composer.endReplaceGroup();
                    break;
                }
                $composer.startReplaceGroup(208305085);
                ComposerKt.sourceInformation($composer, "17@812L11");
                m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                $composer.endReplaceGroup();
                break;
            case 692157961:
                if (category.equals("HOA / Code Violation")) {
                    $composer.startReplaceGroup(208299464);
                    ComposerKt.sourceInformation($composer, "14@630L11");
                    m1960getPrimary0d7_KjU = Color.m4287copywmQWz5c(r1, (r12 & 1) != 0 ? Color.m4291getAlphaimpl(r1) : 0.8f, (r12 & 2) != 0 ? Color.m4295getRedimpl(r1) : 0.0f, (r12 & 4) != 0 ? Color.m4294getGreenimpl(r1) : 0.0f, (r12 & 8) != 0 ? Color.m4292getBlueimpl(MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1942getError0d7_KjU()) : 0.0f);
                    $composer.endReplaceGroup();
                    break;
                }
                $composer.startReplaceGroup(208305085);
                ComposerKt.sourceInformation($composer, "17@812L11");
                m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                $composer.endReplaceGroup();
                break;
            case 703283637:
                if (category.equals("Animal Issue")) {
                    $composer.startReplaceGroup(208293565);
                    ComposerKt.sourceInformation($composer, "11@452L11");
                    m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                    $composer.endReplaceGroup();
                    break;
                }
                $composer.startReplaceGroup(208305085);
                ComposerKt.sourceInformation($composer, "17@812L11");
                m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                $composer.endReplaceGroup();
                break;
            case 871451544:
                if (category.equals("Parking")) {
                    $composer.startReplaceGroup(208295197);
                    ComposerKt.sourceInformation($composer, "12@503L11");
                    m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1958getOutline0d7_KjU();
                    $composer.endReplaceGroup();
                    break;
                }
                $composer.startReplaceGroup(208305085);
                ComposerKt.sourceInformation($composer, "17@812L11");
                m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                $composer.endReplaceGroup();
                break;
            case 1469542426:
                if (category.equals("Property Damage")) {
                    $composer.startReplaceGroup(208291742);
                    ComposerKt.sourceInformation($composer, "10@395L11");
                    m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1975getTertiary0d7_KjU();
                    $composer.endReplaceGroup();
                    break;
                }
                $composer.startReplaceGroup(208305085);
                ComposerKt.sourceInformation($composer, "17@812L11");
                m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                $composer.endReplaceGroup();
                break;
            case 1485327648:
                if (category.equals("Safety Hazard")) {
                    $composer.startReplaceGroup(208301627);
                    ComposerKt.sourceInformation($composer, "15@704L11");
                    m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1942getError0d7_KjU();
                    $composer.endReplaceGroup();
                    break;
                }
                $composer.startReplaceGroup(208305085);
                ComposerKt.sourceInformation($composer, "17@812L11");
                m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                $composer.endReplaceGroup();
                break;
            default:
                $composer.startReplaceGroup(208305085);
                ComposerKt.sourceInformation($composer, "17@812L11");
                m1960getPrimary0d7_KjU = MaterialTheme.INSTANCE.getColorScheme($composer, MaterialTheme.$stable).m1960getPrimary0d7_KjU();
                $composer.endReplaceGroup();
                break;
        }
        if (ComposerKt.isTraceInProgress()) {
            ComposerKt.traceEventEnd();
        }
        ComposerKt.sourceInformationMarkerEnd($composer);
        return m1960getPrimary0d7_KjU;
    }
}
