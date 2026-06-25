package com.rajat.pdfviewer.databinding;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.widget.FrameLayout;
import androidx.viewbinding.ViewBinding;
import androidx.viewbinding.ViewBindings;
import com.rajat.pdfviewer.PinchZoomRecyclerView;
import com.rajat.pdfviewer.R;
/* loaded from: classes12.dex */
public final class PdfRendererviewBinding implements ViewBinding {
    public final PdfViewPageNoBinding pageNumber;
    public final PinchZoomRecyclerView recyclerView;
    private final FrameLayout rootView;
    public final WebView webView;

    private PdfRendererviewBinding(FrameLayout rootView, PdfViewPageNoBinding pageNumber, PinchZoomRecyclerView recyclerView, WebView webView) {
        this.rootView = rootView;
        this.pageNumber = pageNumber;
        this.recyclerView = recyclerView;
        this.webView = webView;
    }

    @Override // androidx.viewbinding.ViewBinding
    public FrameLayout getRoot() {
        return this.rootView;
    }

    public static PdfRendererviewBinding inflate(LayoutInflater inflater) {
        return inflate(inflater, null, false);
    }

    public static PdfRendererviewBinding inflate(LayoutInflater inflater, ViewGroup parent, boolean attachToParent) {
        View root = inflater.inflate(R.layout.pdf_rendererview, parent, false);
        if (attachToParent) {
            parent.addView(root);
        }
        return bind(root);
    }

    public static PdfRendererviewBinding bind(View rootView) {
        int id = R.id.pageNumber;
        View pageNumber = ViewBindings.findChildViewById(rootView, id);
        if (pageNumber != null) {
            PdfViewPageNoBinding binding_pageNumber = PdfViewPageNoBinding.bind(pageNumber);
            id = R.id.recyclerView;
            PinchZoomRecyclerView recyclerView = (PinchZoomRecyclerView) ViewBindings.findChildViewById(rootView, id);
            if (recyclerView != null) {
                id = R.id.webView;
                WebView webView = (WebView) ViewBindings.findChildViewById(rootView, id);
                if (webView != null) {
                    return new PdfRendererviewBinding((FrameLayout) rootView, binding_pageNumber, recyclerView, webView);
                }
            }
        }
        String missingId = rootView.getResources().getResourceName(id);
        throw new NullPointerException("Missing required view with ID: ".concat(missingId));
    }
}
