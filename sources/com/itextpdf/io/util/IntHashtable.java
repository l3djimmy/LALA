package com.itextpdf.io.util;

import com.itextpdf.commons.utils.MessageFormatUtil;
import java.util.Arrays;
/* loaded from: classes12.dex */
public class IntHashtable implements Cloneable {
    int count;
    private float loadFactor;
    private Entry[] table;
    private int threshold;

    public IntHashtable() {
        this(150, 0.75f);
    }

    public IntHashtable(int initialCapacity) {
        this(initialCapacity, 0.75f);
    }

    public IntHashtable(int initialCapacity, float loadFactor) {
        if (initialCapacity < 0) {
            throw new IllegalArgumentException(MessageFormatUtil.format("Illegal Capacity: {0}", Integer.valueOf(initialCapacity)));
        }
        if (loadFactor <= 0.0f) {
            throw new IllegalArgumentException(MessageFormatUtil.format("Illegal Load: {0}", Float.valueOf(loadFactor)));
        }
        initialCapacity = initialCapacity == 0 ? 1 : initialCapacity;
        this.loadFactor = loadFactor;
        this.table = new Entry[initialCapacity];
        this.threshold = (int) (initialCapacity * loadFactor);
    }

    public IntHashtable(IntHashtable o) {
        this(o.table.length, o.loadFactor);
    }

    public int size() {
        return this.count;
    }

    public boolean isEmpty() {
        return this.count == 0;
    }

    public boolean contains(int value) {
        Entry[] tab = this.table;
        int i = tab.length;
        while (true) {
            int i2 = i - 1;
            if (i > 0) {
                for (Entry e = tab[i2]; e != null; e = e.next) {
                    if (e.value == value) {
                        return true;
                    }
                }
                i = i2;
            } else {
                return false;
            }
        }
    }

    public boolean containsValue(int value) {
        return contains(value);
    }

    public boolean containsKey(int key) {
        Entry[] tab = this.table;
        int index = (Integer.MAX_VALUE & key) % tab.length;
        for (Entry e = tab[index]; e != null; e = e.next) {
            if (e.key == key) {
                return true;
            }
        }
        return false;
    }

    public int get(int key) {
        Entry[] tab = this.table;
        int index = (Integer.MAX_VALUE & key) % tab.length;
        for (Entry e = tab[index]; e != null; e = e.next) {
            if (e.key == key) {
                return e.value;
            }
        }
        return 0;
    }

    protected void rehash() {
        int oldCapacity = this.table.length;
        Entry[] oldMap = this.table;
        int newCapacity = (oldCapacity * 2) + 1;
        Entry[] newMap = new Entry[newCapacity];
        this.threshold = (int) (newCapacity * this.loadFactor);
        this.table = newMap;
        int i = oldCapacity;
        while (true) {
            int i2 = i - 1;
            if (i > 0) {
                Entry old = oldMap[i2];
                while (old != null) {
                    Entry e = old;
                    old = old.next;
                    int index = (e.key & Integer.MAX_VALUE) % newCapacity;
                    e.next = newMap[index];
                    newMap[index] = e;
                }
                i = i2;
            } else {
                return;
            }
        }
    }

    public int put(int key, int value) {
        Entry[] tab = this.table;
        int index = (key & Integer.MAX_VALUE) % tab.length;
        for (Entry e = tab[index]; e != null; e = e.next) {
            if (e.key == key) {
                int old = e.value;
                e.value = value;
                return old;
            }
        }
        if (this.count >= this.threshold) {
            rehash();
            tab = this.table;
            index = (Integer.MAX_VALUE & key) % tab.length;
        }
        Entry e2 = new Entry(key, value, tab[index]);
        tab[index] = e2;
        this.count++;
        return 0;
    }

    public int remove(int key) {
        Entry[] tab = this.table;
        int index = (Integer.MAX_VALUE & key) % tab.length;
        Entry prev = null;
        for (Entry e = tab[index]; e != null; e = e.next) {
            if (e.key != key) {
                prev = e;
            } else {
                if (prev != null) {
                    prev.next = e.next;
                } else {
                    tab[index] = e.next;
                }
                this.count--;
                int oldValue = e.value;
                e.value = 0;
                return oldValue;
            }
        }
        return 0;
    }

    public void clear() {
        Entry[] tab = this.table;
        int index = tab.length;
        while (true) {
            index--;
            if (index >= 0) {
                tab[index] = null;
            } else {
                this.count = 0;
                return;
            }
        }
    }

    /* loaded from: classes12.dex */
    public static class Entry {
        int key;
        Entry next;
        int value;

        Entry(int key, int value, Entry next) {
            this.key = key;
            this.value = value;
            this.next = next;
        }

        public int getKey() {
            return this.key;
        }

        public int getValue() {
            return this.value;
        }

        protected Object clone() {
            return new Entry(this.key, this.value, this.next != null ? (Entry) this.next.clone() : null);
        }

        public String toString() {
            return MessageFormatUtil.format("{0}={1}", Integer.valueOf(this.key), Integer.valueOf(this.value));
        }
    }

    public int[] toOrderedKeys() {
        int[] res = getKeys();
        Arrays.sort(res);
        return res;
    }

    public int[] getKeys() {
        int index;
        int[] res = new int[this.count];
        int ptr = 0;
        int index2 = this.table.length;
        Entry entry = null;
        while (true) {
            if (entry == null) {
                while (true) {
                    index = index2 - 1;
                    if (index2 <= 0) {
                        break;
                    }
                    Entry entry2 = this.table[index];
                    entry = entry2;
                    if (entry2 != null) {
                        break;
                    }
                    index2 = index;
                }
                index2 = index;
            }
            if (entry != null) {
                Entry e = entry;
                entry = e.next;
                res[ptr] = e.key;
                ptr++;
            } else {
                return res;
            }
        }
    }

    public int getOneKey() {
        if (this.count == 0) {
            return 0;
        }
        int index = this.table.length;
        Entry entry = null;
        while (true) {
            int index2 = index - 1;
            if (index <= 0) {
                break;
            }
            Entry entry2 = this.table[index2];
            entry = entry2;
            if (entry2 != null) {
                break;
            }
            index = index2;
        }
        if (entry == null) {
            return 0;
        }
        return entry.key;
    }

    public Object clone() {
        IntHashtable t = new IntHashtable(this);
        t.table = new Entry[this.table.length];
        int i = this.table.length;
        while (true) {
            int i2 = i - 1;
            if (i > 0) {
                t.table[i2] = this.table[i2] != null ? (Entry) this.table[i2].clone() : null;
                i = i2;
            } else {
                t.count = this.count;
                return t;
            }
        }
    }
}
