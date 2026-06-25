package com.itextpdf.layout.element;

import com.itextpdf.kernel.pdf.canvas.draw.ILineDrawer;
import com.itextpdf.layout.properties.TabAlignment;
/* loaded from: classes12.dex */
public class TabStop {
    private TabAlignment tabAlignment;
    private Character tabAnchor;
    private ILineDrawer tabLeader;
    private float tabPosition;

    public TabStop(float tabPosition) {
        this(tabPosition, TabAlignment.LEFT);
    }

    public TabStop(float tabPosition, TabAlignment tabAlignment) {
        this(tabPosition, tabAlignment, null);
    }

    public TabStop(float tabPosition, TabAlignment tabAlignment, ILineDrawer tabLeader) {
        this.tabPosition = tabPosition;
        this.tabAlignment = tabAlignment;
        this.tabLeader = tabLeader;
        this.tabAnchor = '.';
    }

    public float getTabPosition() {
        return this.tabPosition;
    }

    public TabAlignment getTabAlignment() {
        return this.tabAlignment;
    }

    public void setTabAlignment(TabAlignment tabAlignment) {
        this.tabAlignment = tabAlignment;
    }

    public Character getTabAnchor() {
        return this.tabAnchor;
    }

    public void setTabAnchor(Character tabAnchor) {
        this.tabAnchor = tabAnchor;
    }

    public ILineDrawer getTabLeader() {
        return this.tabLeader;
    }

    public void setTabLeader(ILineDrawer tabLeader) {
        this.tabLeader = tabLeader;
    }
}
