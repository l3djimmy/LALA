package com.rajat.pdfviewer.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ProgressBar;
import android.widget.TextView;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.viewbinding.ViewBinding;
import androidx.viewbinding.ViewBindings;
import com.google.android.material.appbar.MaterialToolbar;
import com.rajat.pdfviewer.PdfRendererView;
import com.rajat.pdfviewer.R;
/* loaded from: classes12.dex */
public final class ActivityPdfViewerBinding implements ViewBinding {
    public final FrameLayout mainLayout;
    public final MaterialToolbar myToolbar;
    public final ConstraintLayout parentLayout;
    public final PdfRendererView pdfView;
    public final ProgressBar progressBar;
    private final ConstraintLayout rootView;
    public final TextView toolbarTitle;

    private ActivityPdfViewerBinding(ConstraintLayout rootView, FrameLayout mainLayout, MaterialToolbar myToolbar, ConstraintLayout parentLayout, PdfRendererView pdfView, ProgressBar progressBar, TextView toolbarTitle) {
        this.rootView = rootView;
        this.mainLayout = mainLayout;
        this.myToolbar = myToolbar;
        this.parentLayout = parentLayout;
        this.pdfView = pdfView;
        this.progressBar = progressBar;
        this.toolbarTitle = toolbarTitle;
    }

    @Override // androidx.viewbinding.ViewBinding
    public ConstraintLayout getRoot() {
        return this.rootView;
    }

    public static ActivityPdfViewerBinding inflate(LayoutInflater inflater) {
        return inflate(inflater, null, false);
    }

    public static ActivityPdfViewerBinding inflate(LayoutInflater inflater, ViewGroup parent, boolean attachToParent) {
        View root = inflater.inflate(R.layout.activity_pdf_viewer, parent, false);
        if (attachToParent) {
            parent.addView(root);
        }
        return bind(root);
    }

    public static ActivityPdfViewerBinding bind(View rootView) {
        int id = R.id.mainLayout;
        FrameLayout mainLayout = (FrameLayout) ViewBindings.findChildViewById(rootView, id);
        if (mainLayout != null) {
            id = R.id.my_toolbar;
            MaterialToolbar myToolbar = (MaterialToolbar) ViewBindings.findChildViewById(rootView, id);
            if (myToolbar != null) {
                ConstraintLayout parentLayout = (ConstraintLayout) rootView;
                id = R.id.pdfView;
                PdfRendererView pdfView = (PdfRendererView) ViewBindings.findChildViewById(rootView, id);
                if (pdfView != null) {
                    id = R.id.progressBar;
                    ProgressBar progressBar = (ProgressBar) ViewBindings.findChildViewById(rootView, id);
                    if (progressBar != null) {
                        id = R.id.toolbar_title;
                        TextView toolbarTitle = (TextView) ViewBindings.findChildViewById(rootView, id);
                        if (toolbarTitle != null) {
                            return new ActivityPdfViewerBinding((ConstraintLayout) rootView, mainLayout, myToolbar, parentLayout, pdfView, progressBar, toolbarTitle);
                        }
                    }
                }
            }
        }
        String missingId = rootView.getResources().getResourceName(id);
        throw new NullPointerException("Missing required view with ID: ".concat(missingId));
    }
}
