package com.itextpdf.layout.renderer;

import java.util.HashMap;
import java.util.Map;
/* loaded from: classes12.dex */
public class TargetCounterHandler {
    private Map<String, Integer> previousRenderersPages;
    private Map<String, Integer> renderersPages;

    public TargetCounterHandler(TargetCounterHandler targetCounterHandler) {
        this.renderersPages = new HashMap();
        this.previousRenderersPages = new HashMap();
        this.renderersPages = targetCounterHandler.renderersPages;
        this.previousRenderersPages = targetCounterHandler.previousRenderersPages;
    }

    public TargetCounterHandler() {
        this.renderersPages = new HashMap();
        this.previousRenderersPages = new HashMap();
    }

    public static void addPageByID(IRenderer renderer) {
        TargetCounterHandler targetCounterHandler;
        String id = (String) renderer.getProperty(126);
        if (id != null && (targetCounterHandler = getTargetCounterHandler(renderer)) != null && renderer.getOccupiedArea() != null) {
            int currentPageNumber = renderer.getOccupiedArea().getPageNumber();
            targetCounterHandler.renderersPages.put(id, Integer.valueOf(currentPageNumber));
        }
    }

    public static Integer getPageByID(IRenderer renderer, String id) {
        TargetCounterHandler targetCounterHandler = getTargetCounterHandler(renderer);
        if (targetCounterHandler == null) {
            return null;
        }
        return targetCounterHandler.previousRenderersPages.get(id);
    }

    public static boolean isValueDefinedForThisId(IRenderer renderer, String id) {
        TargetCounterHandler targetCounterHandler = getTargetCounterHandler(renderer);
        return targetCounterHandler != null && targetCounterHandler.renderersPages.containsKey(id);
    }

    public boolean isRelayoutRequired() {
        for (Map.Entry<String, Integer> rendererPage : this.renderersPages.entrySet()) {
            if (!rendererPage.getValue().equals(this.previousRenderersPages.get(rendererPage.getKey()))) {
                return true;
            }
        }
        return false;
    }

    public void prepareHandlerToRelayout() {
        this.previousRenderersPages = new HashMap(this.renderersPages);
    }

    private static TargetCounterHandler getTargetCounterHandler(IRenderer renderer) {
        IRenderer rootRenderer = renderer;
        while (rootRenderer.getParent() != null) {
            rootRenderer = rootRenderer.getParent();
        }
        if (rootRenderer instanceof DocumentRenderer) {
            return ((DocumentRenderer) rootRenderer).getTargetCounterHandler();
        }
        return null;
    }
}
