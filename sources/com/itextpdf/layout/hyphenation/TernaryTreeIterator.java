package com.itextpdf.layout.hyphenation;

import java.util.Enumeration;
import java.util.Stack;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes12.dex */
public class TernaryTreeIterator implements Enumeration {
    String curkey;
    TernaryTree tt;
    int cur = -1;
    Stack ns = new Stack();
    StringBuffer ks = new StringBuffer();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes12.dex */
    public class Item {
        char child;
        char parent;

        public Item() {
            this.parent = (char) 0;
            this.child = (char) 0;
        }

        public Item(char p, char c) {
            this.parent = p;
            this.child = c;
        }

        public Item(Item i) {
            this.parent = i.parent;
            this.child = i.child;
        }
    }

    public TernaryTreeIterator(TernaryTree tt) {
        this.tt = tt;
        reset();
    }

    public void reset() {
        this.ns.removeAllElements();
        this.ks.setLength(0);
        this.cur = this.tt.root;
        run();
    }

    @Override // java.util.Enumeration
    public Object nextElement() {
        String res = this.curkey;
        this.cur = up();
        run();
        return res;
    }

    public char getValue() {
        if (this.cur >= 0) {
            return this.tt.eq[this.cur];
        }
        return (char) 0;
    }

    @Override // java.util.Enumeration
    public boolean hasMoreElements() {
        return this.cur != -1;
    }

    private int up() {
        new Item();
        char c = 0;
        if (this.ns.size() == 0) {
            return -1;
        }
        if (this.cur != 0 && this.tt.sc[this.cur] == 0) {
            return this.tt.lo[this.cur];
        }
        boolean climb = true;
        while (climb) {
            Item i = (Item) this.ns.pop();
            i.child = (char) (i.child + 1);
            switch (i.child) {
                case 1:
                    if (this.tt.sc[i.parent] != 0) {
                        c = this.tt.eq[i.parent];
                        this.ns.push(new Item(i));
                        this.ks.append(this.tt.sc[i.parent]);
                    } else {
                        i.child = (char) (i.child + 1);
                        this.ns.push(new Item(i));
                        c = this.tt.hi[i.parent];
                    }
                    climb = false;
                    break;
                case 2:
                    c = this.tt.hi[i.parent];
                    this.ns.push(new Item(i));
                    if (this.ks.length() > 0) {
                        this.ks.setLength(this.ks.length() - 1);
                    }
                    climb = false;
                    break;
                default:
                    if (this.ns.size() != 0) {
                        climb = true;
                        break;
                    } else {
                        return -1;
                    }
            }
        }
        return c;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v1, types: [int] */
    private int run() {
        if (this.cur == -1) {
            return -1;
        }
        boolean leaf = false;
        while (true) {
            if (this.cur != 0) {
                if (this.tt.sc[this.cur] == 65535) {
                    leaf = true;
                } else {
                    this.ns.push(new Item((char) this.cur, (char) 0));
                    if (this.tt.sc[this.cur] == 0) {
                        leaf = true;
                    } else {
                        this.cur = this.tt.lo[this.cur];
                    }
                }
            }
            if (!leaf) {
                this.cur = up();
                if (this.cur == -1) {
                    return -1;
                }
            } else {
                StringBuffer buf = new StringBuffer(this.ks.toString());
                if (this.tt.sc[this.cur] == 65535) {
                    for (char c = this.tt.lo[this.cur]; this.tt.kv.get(c) != 0; c++) {
                        buf.append(this.tt.kv.get(c));
                    }
                }
                this.curkey = buf.toString();
                return 0;
            }
        }
    }
}
