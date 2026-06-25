package com.rajat.pdfviewer.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import androidx.viewbinding.ViewBinding;
import com.rajat.pdfviewer.R;
/* loaded from: classes12.dex */
public final class PdfViewPageNoBinding implements ViewBinding {
    public final TextView pageNo;
    private final TextView rootView;

    private PdfViewPageNoBinding(TextView rootView, TextView pageNo) {
        this.rootView = rootView;
        this.pageNo = pageNo;
    }

    @Override // androidx.viewbinding.ViewBinding
    public TextView getRoot() {
        return this.rootView;
    }

    public static PdfViewPageNoBinding inflate(LayoutInflater inflater) {
        return inflate(inflater, null, false);
    }

    public static PdfViewPageNoBinding inflate(LayoutInflater inflater, ViewGroup parent, boolean attachToParent) {
        View root = inflater.inflate(R.layout.pdf_view_page_no, parent, false);
        if (attachToParent) {
            parent.addView(root);
        }
        return bind(root);
    }

    public static PdfViewPageNoBinding bind(View rootView) {
        if (rootView == null) {
            throw new NullPointerException("rootView");
        }
        TextView pageNo = (TextView) rootView;
        return new PdfViewPageNoBinding((TextView) rootView, pageNo);
    }
}
