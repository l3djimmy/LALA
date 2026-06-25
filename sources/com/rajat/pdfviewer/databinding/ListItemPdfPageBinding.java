package com.rajat.pdfviewer.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import androidx.viewbinding.ViewBinding;
import androidx.viewbinding.ViewBindings;
import com.rajat.pdfviewer.R;
/* loaded from: classes12.dex */
public final class ListItemPdfPageBinding implements ViewBinding {
    public final FrameLayout containerView;
    public final PdfViewPageLoadingLayoutBinding pageLoadingLayout;
    public final ImageView pageView;
    private final FrameLayout rootView;

    private ListItemPdfPageBinding(FrameLayout rootView, FrameLayout containerView, PdfViewPageLoadingLayoutBinding pageLoadingLayout, ImageView pageView) {
        this.rootView = rootView;
        this.containerView = containerView;
        this.pageLoadingLayout = pageLoadingLayout;
        this.pageView = pageView;
    }

    @Override // androidx.viewbinding.ViewBinding
    public FrameLayout getRoot() {
        return this.rootView;
    }

    public static ListItemPdfPageBinding inflate(LayoutInflater inflater) {
        return inflate(inflater, null, false);
    }

    public static ListItemPdfPageBinding inflate(LayoutInflater inflater, ViewGroup parent, boolean attachToParent) {
        View root = inflater.inflate(R.layout.list_item_pdf_page, parent, false);
        if (attachToParent) {
            parent.addView(root);
        }
        return bind(root);
    }

    public static ListItemPdfPageBinding bind(View rootView) {
        FrameLayout containerView = (FrameLayout) rootView;
        int id = R.id.pageLoadingLayout;
        View pageLoadingLayout = ViewBindings.findChildViewById(rootView, id);
        if (pageLoadingLayout != null) {
            PdfViewPageLoadingLayoutBinding binding_pageLoadingLayout = PdfViewPageLoadingLayoutBinding.bind(pageLoadingLayout);
            id = R.id.pageView;
            ImageView pageView = (ImageView) ViewBindings.findChildViewById(rootView, id);
            if (pageView != null) {
                return new ListItemPdfPageBinding((FrameLayout) rootView, containerView, binding_pageLoadingLayout, pageView);
            }
        }
        String missingId = rootView.getResources().getResourceName(id);
        throw new NullPointerException("Missing required view with ID: ".concat(missingId));
    }
}
