package com.itextpdf.layout.font;

import java.util.AbstractCollection;
import java.util.Collection;
import java.util.Iterator;
/* loaded from: classes12.dex */
class FontSetCollection extends AbstractCollection<FontInfo> {
    private final Collection<FontInfo> additional;
    private final Collection<FontInfo> primary;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FontSetCollection(Collection<FontInfo> primary, Collection<FontInfo> additional) {
        this.primary = primary;
        this.additional = additional;
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public int size() {
        return this.primary.size() + (this.additional != null ? this.additional.size() : 0);
    }

    @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable
    public Iterator<FontInfo> iterator() {
        return new Iterator<FontInfo>() { // from class: com.itextpdf.layout.font.FontSetCollection.1
            private Iterator<FontInfo> i;
            boolean isPrimary = true;

            {
                this.i = FontSetCollection.this.primary.iterator();
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                boolean hasNext = this.i.hasNext();
                if (!hasNext && this.isPrimary && FontSetCollection.this.additional != null) {
                    this.i = FontSetCollection.this.additional.iterator();
                    this.isPrimary = false;
                    return this.i.hasNext();
                }
                return hasNext;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.Iterator
            public FontInfo next() {
                return this.i.next();
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException();
            }
        };
    }

    @Override // java.util.AbstractCollection, java.util.Collection
    public boolean remove(Object o) {
        throw new UnsupportedOperationException();
    }
}
