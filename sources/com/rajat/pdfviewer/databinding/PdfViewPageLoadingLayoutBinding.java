package com.rajat.pdfviewer.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import androidx.viewbinding.ViewBinding;
import androidx.viewbinding.ViewBindings;
import com.rajat.pdfviewer.R;
/* loaded from: classes12.dex */
public final class PdfViewPageLoadingLayoutBinding implements ViewBinding {
    public final ProgressBar pdfViewPageLoadingProgress;
    private final FrameLayout rootView;

    private PdfViewPageLoadingLayoutBinding(FrameLayout rootView, ProgressBar pdfViewPageLoadingProgress) {
        this.rootView = rootView;
        this.pdfViewPageLoadingProgress = pdfViewPageLoadingProgress;
    }

    @Override // androidx.viewbinding.ViewBinding
    public FrameLayout getRoot() {
        return this.rootView;
    }

    public static PdfViewPageLoadingLayoutBinding inflate(LayoutInflater inflater) {
        return inflate(inflater, null, false);
    }

    public static PdfViewPageLoadingLayoutBinding inflate(LayoutInflater inflater, ViewGroup parent, boolean attachToParent) {
        View root = inflater.inflate(R.layout.pdf_view_page_loading_layout, parent, false);
        if (attachToParent) {
            parent.addView(root);
        }
        return bind(root);
    }

    public static PdfViewPageLoadingLayoutBinding bind(View rootView) {
        int id = R.id.pdf_view_page_loading_progress;
        ProgressBar pdfViewPageLoadingProgress = (ProgressBar) ViewBindings.findChildViewById(rootView, id);
        if (pdfViewPageLoadingProgress != null) {
            return new PdfViewPageLoadingLayoutBinding((FrameLayout) rootView, pdfViewPageLoadingProgress);
        }
        String missingId = rootView.getResources().getResourceName(id);
        throw new NullPointerException("Missing required view with ID: ".concat(missingId));
    }
}
