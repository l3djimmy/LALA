package androidx.camera.core.impl;

import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class SurfaceCombination {
    private final List<SurfaceConfig> mSurfaceConfigList = new ArrayList();

    private static void generateArrangements(List<int[]> arrangementsResultList, int n, int[] result, int index) {
        if (index >= result.length) {
            arrangementsResultList.add((int[]) result.clone());
            return;
        }
        for (int i = 0; i < n; i++) {
            boolean included = false;
            int j = 0;
            while (true) {
                if (j < index) {
                    if (i != result[j]) {
                        j++;
                    } else {
                        included = true;
                        break;
                    }
                } else {
                    break;
                }
            }
            if (!included) {
                result[index] = i;
                generateArrangements(arrangementsResultList, n, result, index + 1);
            }
        }
    }

    public boolean addSurfaceConfig(SurfaceConfig surfaceConfig) {
        return this.mSurfaceConfigList.add(surfaceConfig);
    }

    public boolean removeSurfaceConfig(SurfaceConfig surfaceConfig) {
        return this.mSurfaceConfigList.remove(surfaceConfig);
    }

    public List<SurfaceConfig> getSurfaceConfigList() {
        return this.mSurfaceConfigList;
    }

    /* JADX WARN: Code restructure failed: missing block: B:31:0x0074, code lost:
        continue;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<androidx.camera.core.impl.SurfaceConfig> getOrderedSupportedSurfaceConfigList(java.util.List<androidx.camera.core.impl.SurfaceConfig> r11) {
        /*
            r10 = this;
            r0 = 0
            boolean r1 = r11.isEmpty()
            if (r1 == 0) goto Ld
            java.util.ArrayList r1 = new java.util.ArrayList
            r1.<init>()
            return r1
        Ld:
            int r1 = r11.size()
            java.util.List<androidx.camera.core.impl.SurfaceConfig> r2 = r10.mSurfaceConfigList
            int r2 = r2.size()
            r3 = 0
            if (r1 == r2) goto L1b
            return r3
        L1b:
            java.util.List<androidx.camera.core.impl.SurfaceConfig> r1 = r10.mSurfaceConfigList
            int r1 = r1.size()
            java.util.List r1 = r10.getElementsArrangements(r1)
            int r2 = r11.size()
            androidx.camera.core.impl.SurfaceConfig[] r2 = new androidx.camera.core.impl.SurfaceConfig[r2]
            java.util.Iterator r4 = r1.iterator()
        L2f:
            boolean r5 = r4.hasNext()
            if (r5 == 0) goto L79
            java.lang.Object r5 = r4.next()
            int[] r5 = (int[]) r5
            r6 = 1
            r7 = 0
        L3d:
            java.util.List<androidx.camera.core.impl.SurfaceConfig> r8 = r10.mSurfaceConfigList
            int r8 = r8.size()
            if (r7 >= r8) goto L74
            r8 = r5[r7]
            int r9 = r11.size()
            if (r8 >= r9) goto L71
            java.util.List<androidx.camera.core.impl.SurfaceConfig> r8 = r10.mSurfaceConfigList
            java.lang.Object r8 = r8.get(r7)
            androidx.camera.core.impl.SurfaceConfig r8 = (androidx.camera.core.impl.SurfaceConfig) r8
            r9 = r5[r7]
            java.lang.Object r9 = r11.get(r9)
            androidx.camera.core.impl.SurfaceConfig r9 = (androidx.camera.core.impl.SurfaceConfig) r9
            boolean r8 = r8.isSupported(r9)
            r6 = r6 & r8
            if (r6 != 0) goto L65
            goto L74
        L65:
            r8 = r5[r7]
            java.util.List<androidx.camera.core.impl.SurfaceConfig> r9 = r10.mSurfaceConfigList
            java.lang.Object r9 = r9.get(r7)
            androidx.camera.core.impl.SurfaceConfig r9 = (androidx.camera.core.impl.SurfaceConfig) r9
            r2[r8] = r9
        L71:
            int r7 = r7 + 1
            goto L3d
        L74:
            if (r6 == 0) goto L78
            r0 = 1
            goto L79
        L78:
            goto L2f
        L79:
            if (r0 == 0) goto L7f
            java.util.List r3 = java.util.Arrays.asList(r2)
        L7f:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.camera.core.impl.SurfaceCombination.getOrderedSupportedSurfaceConfigList(java.util.List):java.util.List");
    }

    private List<int[]> getElementsArrangements(int n) {
        List<int[]> arrangementsResultList = new ArrayList<>();
        generateArrangements(arrangementsResultList, n, new int[n], 0);
        return arrangementsResultList;
    }
}
