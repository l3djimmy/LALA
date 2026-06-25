.class public abstract Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
.super Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;
.source "PdfAnnotation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation$PdfUnknownAnnotation;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/itextpdf/kernel/pdf/PdfObjectWrapper<",
        "Lcom/itextpdf/kernel/pdf/PdfDictionary;",
        ">;"
    }
.end annotation


# static fields
.field public static final Accepted:Lcom/itextpdf/kernel/pdf/PdfString;

.field public static final Canceled:Lcom/itextpdf/kernel/pdf/PdfString;

.field public static final Completed:Lcom/itextpdf/kernel/pdf/PdfString;

.field public static final HIDDEN:I = 0x2

.field public static final HIGHLIGHT_INVERT:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final HIGHLIGHT_NONE:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final HIGHLIGHT_OUTLINE:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final HIGHLIGHT_PUSH:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final HIGHLIGHT_TOGGLE:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final INVISIBLE:I = 0x1

.field public static final LOCKED:I = 0x80

.field public static final LOCKED_CONTENTS:I = 0x200

.field public static final Marked:Lcom/itextpdf/kernel/pdf/PdfString;

.field public static final MarkedModel:Lcom/itextpdf/kernel/pdf/PdfString;

.field public static final NO_ROTATE:I = 0x10

.field public static final NO_VIEW:I = 0x20

.field public static final NO_ZOOM:I = 0x8

.field public static final None:Lcom/itextpdf/kernel/pdf/PdfString;

.field public static final PRINT:I = 0x4

.field public static final READ_ONLY:I = 0x40

.field public static final Rejected:Lcom/itextpdf/kernel/pdf/PdfString;

.field public static final ReviewModel:Lcom/itextpdf/kernel/pdf/PdfString;

.field public static final STYLE_BEVELED:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final STYLE_DASHED:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final STYLE_INSET:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final STYLE_SOLID:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final STYLE_UNDERLINE:Lcom/itextpdf/kernel/pdf/PdfName;

.field public static final TOGGLE_NO_VIEW:I = 0x100

.field public static final Unmarked:Lcom/itextpdf/kernel/pdf/PdfString;


# instance fields
.field protected page:Lcom/itextpdf/kernel/pdf/PdfPage;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 121
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->HIGHLIGHT_NONE:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 127
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->I:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->HIGHLIGHT_INVERT:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 133
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->O:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->HIGHLIGHT_OUTLINE:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 139
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->HIGHLIGHT_PUSH:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 145
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->HIGHLIGHT_TOGGLE:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 151
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->S:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->STYLE_SOLID:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 156
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->STYLE_DASHED:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 161
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->B:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->STYLE_BEVELED:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 166
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->I:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->STYLE_INSET:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 171
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->U:Lcom/itextpdf/kernel/pdf/PdfName;

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->STYLE_UNDERLINE:Lcom/itextpdf/kernel/pdf/PdfName;

    .line 178
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v1, "Marked"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->Marked:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 184
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "Unmarked"

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->Unmarked:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 190
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "Accepted"

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->Accepted:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 196
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "Rejected"

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->Rejected:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 202
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "Cancelled"

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->Canceled:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 208
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "Completed"

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->Completed:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 214
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "None"

    invoke-direct {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->None:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 221
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->MarkedModel:Lcom/itextpdf/kernel/pdf/PdfString;

    .line 227
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v1, "Review"

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->ReviewModel:Lcom/itextpdf/kernel/pdf/PdfString;

    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/geom/Rectangle;)V
    .locals 2
    .param p1, "rect"    # Lcom/itextpdf/kernel/geom/Rectangle;

    .line 299
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    invoke-direct {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    .line 300
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Rect:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>(Lcom/itextpdf/kernel/geom/Rectangle;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 301
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 302
    return-void
.end method

.method protected constructor <init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V
    .locals 1
    .param p1, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 305
    invoke-direct {p0, p1}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;-><init>(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 306
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    invoke-static {v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->markObjectAsIndirect(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 307
    return-void
.end method

.method public static makeAnnotation(Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 5
    .param p0, "pdfObject"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 241
    const/4 v0, 0x0

    .line 242
    .local v0, "annotation":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isIndirectReference()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 243
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getRefersTo()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object p0

    .line 244
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/PdfObject;->isDictionary()Z

    move-result v1

    if-eqz v1, :cond_18

    .line 245
    move-object v1, p0

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 246
    .local v1, "dictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->Subtype:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v2

    .line 247
    .local v2, "subtype":Lcom/itextpdf/kernel/pdf/PdfName;
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Link:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 248
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfLinkAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 249
    :cond_1
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Popup:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 250
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfPopupAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 251
    :cond_2
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Widget:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 252
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfWidgetAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfWidgetAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 253
    :cond_3
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Screen:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 254
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfScreenAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfScreenAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 255
    :cond_4
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->_3D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 256
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/Pdf3DAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 257
    :cond_5
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Highlight:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Underline:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Squiggly:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_17

    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->StrikeOut:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    goto/16 :goto_0

    .line 259
    :cond_6
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Caret:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 260
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfCaretAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfCaretAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 261
    :cond_7
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Text:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 262
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfTextAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 263
    :cond_8
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Sound:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 264
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfSoundAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 265
    :cond_9
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Stamp:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 266
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfStampAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfStampAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 267
    :cond_a
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->FileAttachment:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_b

    .line 268
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfFileAttachmentAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfFileAttachmentAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 269
    :cond_b
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Ink:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 270
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfInkAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 271
    :cond_c
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->PrinterMark:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_d

    .line 272
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfPrinterMarkAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfPrinterMarkAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 273
    :cond_d
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->TrapNet:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_e

    .line 274
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfTrapNetworkAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfTrapNetworkAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 275
    :cond_e
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->FreeText:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 276
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfFreeTextAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 277
    :cond_f
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Square:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_10

    .line 278
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfSquareAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfSquareAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 279
    :cond_10
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Circle:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    .line 280
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfCircleAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfCircleAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto/16 :goto_1

    .line 281
    :cond_11
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Line:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_12

    .line 282
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfLineAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto :goto_1

    .line 283
    :cond_12
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Polygon:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_13

    .line 284
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfPolygonAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfPolygonAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto :goto_1

    .line 285
    :cond_13
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->PolyLine:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_14

    .line 286
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfPolylineAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfPolylineAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto :goto_1

    .line 287
    :cond_14
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Redact:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_15

    .line 288
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfRedactAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto :goto_1

    .line 289
    :cond_15
    sget-object v3, Lcom/itextpdf/kernel/pdf/PdfName;->Watermark:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v3, v2}, Lcom/itextpdf/kernel/pdf/PdfName;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    .line 290
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfWatermarkAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfWatermarkAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto :goto_1

    .line 292
    :cond_16
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation$PdfUnknownAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation$PdfUnknownAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    goto :goto_1

    .line 258
    :cond_17
    :goto_0
    new-instance v3, Lcom/itextpdf/kernel/pdf/annot/PdfTextMarkupAnnotation;

    move-object v4, p0

    check-cast v4, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v3, v4}, Lcom/itextpdf/kernel/pdf/annot/PdfTextMarkupAnnotation;-><init>(Lcom/itextpdf/kernel/pdf/PdfDictionary;)V

    move-object v0, v3

    .line 295
    .end local v1    # "dictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v2    # "subtype":Lcom/itextpdf/kernel/pdf/PdfName;
    :cond_18
    :goto_1
    return-object v0
.end method


# virtual methods
.method public addAssociatedFile(Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;)V
    .locals 2
    .param p1, "fs"    # Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;

    .line 1060
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AFRelationship:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    if-nez v0, :cond_0

    .line 1061
    const-class v0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 1062
    .local v0, "logger":Lorg/slf4j/Logger;
    const-string v1, "For associated files their associated file specification dictionaries shall include the AFRelationship key."

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;)V

    .line 1064
    .end local v0    # "logger":Lorg/slf4j/Logger;
    :cond_0
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 1065
    .local v0, "afArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_1

    .line 1066
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 1067
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 1069
    :cond_1
    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/filespec/PdfFileSpec;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;->add(Lcom/itextpdf/kernel/pdf/PdfObject;)V

    .line 1070
    return-void
.end method

.method public flush()V
    .locals 0

    .line 1097
    invoke-super {p0}, Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;->flush()V

    .line 1098
    return-void
.end method

.method public getAppearanceDictionary()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 579
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getAppearanceObject(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 3
    .param p1, "appearanceType"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 593
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getAppearanceDictionary()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 594
    .local v0, "ap":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v0, :cond_0

    .line 595
    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->get(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    .line 596
    .local v1, "apObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    instance-of v2, v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    if-eqz v2, :cond_0

    .line 597
    move-object v2, v1

    check-cast v2, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    return-object v2

    .line 600
    .end local v1    # "apObject":Lcom/itextpdf/kernel/pdf/PdfObject;
    :cond_0
    const/4 v1, 0x0

    return-object v1
.end method

.method public getAppearanceState()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 748
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getAssociatedFiles(Z)Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2
    .param p1, "create"    # Z

    .line 1079
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    .line 1080
    .local v0, "afArray":Lcom/itextpdf/kernel/pdf/PdfArray;
    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    .line 1081
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>()V

    move-object v0, v1

    .line 1082
    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->AF:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v1, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 1084
    :cond_0
    return-object v0
.end method

.method public getBlendMode()Lcom/itextpdf/kernel/pdf/PdfName;
    .locals 2

    .line 955
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->BM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsName(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfName;

    move-result-object v0

    return-object v0
.end method

.method public getBorder()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 775
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Border:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getColorObject()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 818
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->C:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getContents()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 333
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Contents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getDate()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 444
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->M:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getDownAppearanceObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 635
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getAppearanceObject(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getFlags()I
    .locals 2

    .line 466
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 467
    .local v0, "f":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v0, :cond_0

    .line 468
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    return v1

    .line 470
    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public getLang()Ljava/lang/String;
    .locals 2

    .line 933
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Lang:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    .line 934
    .local v0, "lang":Lcom/itextpdf/kernel/pdf/PdfString;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfString;->toUnicodeString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getName()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 423
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->NM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public getNonStrokingOpacity()F
    .locals 2

    .line 978
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->ca:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 979
    .local v0, "nonStrokingOpacity":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    goto :goto_0

    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    :goto_0
    return v1
.end method

.method public getNormalAppearanceObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 611
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getAppearanceObject(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getPage()Lcom/itextpdf/kernel/pdf/PdfPage;
    .locals 8

    .line 375
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->page:Lcom/itextpdf/kernel/pdf/PdfPage;

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v0

    move-object v1, v0

    .local v1, "annotationIndirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    if-eqz v0, :cond_3

    .line 376
    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->getDocument()Lcom/itextpdf/kernel/pdf/PdfDocument;

    move-result-object v0

    .line 378
    .local v0, "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v2

    .line 379
    .local v2, "pageDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-eqz v2, :cond_0

    .line 380
    invoke-virtual {v0, v2}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v3

    iput-object v3, p0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->page:Lcom/itextpdf/kernel/pdf/PdfPage;

    goto :goto_3

    .line 382
    :cond_0
    const/4 v3, 0x1

    .local v3, "i":I
    :goto_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getNumberOfPages()I

    move-result v4

    if-gt v3, v4, :cond_3

    .line 383
    invoke-virtual {v0, v3}, Lcom/itextpdf/kernel/pdf/PdfDocument;->getPage(I)Lcom/itextpdf/kernel/pdf/PdfPage;

    move-result-object v4

    .line 384
    .local v4, "docPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfPage;->isFlushed()Z

    move-result v5

    if-nez v5, :cond_2

    .line 385
    invoke-virtual {v4}, Lcom/itextpdf/kernel/pdf/PdfPage;->getAnnotations()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    .line 386
    .local v6, "annot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    invoke-virtual {v6}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v7

    check-cast v7, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v7}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v7

    invoke-virtual {v1, v7}, Lcom/itextpdf/kernel/pdf/PdfIndirectReference;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 387
    iput-object v4, p0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->page:Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 388
    goto :goto_2

    .line 390
    .end local v6    # "annot":Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    :cond_1
    goto :goto_1

    .line 382
    .end local v4    # "docPage":Lcom/itextpdf/kernel/pdf/PdfPage;
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 397
    .end local v0    # "doc":Lcom/itextpdf/kernel/pdf/PdfDocument;
    .end local v1    # "annotationIndirectReference":Lcom/itextpdf/kernel/pdf/PdfIndirectReference;
    .end local v2    # "pageDictionary":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .end local v3    # "i":I
    :cond_3
    :goto_3
    iget-object v0, p0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->page:Lcom/itextpdf/kernel/pdf/PdfPage;

    return-object v0
.end method

.method public getPageObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 2

    .line 365
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsDictionary(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getRectangle()Lcom/itextpdf/kernel/pdf/PdfArray;
    .locals 2

    .line 922
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->Rect:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsArray(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfArray;

    move-result-object v0

    return-object v0
.end method

.method public getRolloverAppearanceObject()Lcom/itextpdf/kernel/pdf/PdfDictionary;
    .locals 1

    .line 623
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getAppearanceObject(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    return-object v0
.end method

.method public getStrokingOpacity()F
    .locals 2

    .line 1005
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->CA:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 1006
    .local v0, "strokingOpacity":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->floatValue()F

    move-result v1

    goto :goto_0

    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    :goto_0
    return v1
.end method

.method public getStructParentIndex()I
    .locals 2

    .line 862
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->StructParent:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsNumber(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfNumber;

    move-result-object v0

    .line 863
    .local v0, "n":Lcom/itextpdf/kernel/pdf/PdfNumber;
    if-nez v0, :cond_0

    .line 864
    const/4 v1, -0x1

    return v1

    .line 866
    :cond_0
    invoke-virtual {v0}, Lcom/itextpdf/kernel/pdf/PdfNumber;->intValue()I

    move-result v1

    return v1
.end method

.method public abstract getSubtype()Lcom/itextpdf/kernel/pdf/PdfName;
.end method

.method public getTitle()Lcom/itextpdf/kernel/pdf/PdfString;
    .locals 2

    .line 901
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getAsString(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfString;

    move-result-object v0

    return-object v0
.end method

.method public hasFlag(I)Z
    .locals 3
    .param p1, "flag"    # I

    .line 560
    const/4 v0, 0x0

    if-nez p1, :cond_0

    .line 561
    return v0

    .line 563
    :cond_0
    add-int/lit8 v1, p1, -0x1

    and-int/2addr v1, p1

    if-nez v1, :cond_2

    .line 567
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getFlags()I

    move-result v1

    .line 568
    .local v1, "flags":I
    and-int v2, v1, p1

    if-eqz v2, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    .line 564
    .end local v1    # "flags":I
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Only one flag must be checked at once."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected isWrappedObjectMustBeIndirect()Z
    .locals 1

    .line 1102
    const/4 v0, 0x1

    return v0
.end method

.method public put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "value"    # Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1032
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1033
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setModified()Lcom/itextpdf/kernel/pdf/PdfObjectWrapper;

    .line 1034
    return-object p0
.end method

.method public remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "key"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 1044
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->remove(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 1045
    return-object p0
.end method

.method public resetFlag(I)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 2
    .param p1, "flag"    # I

    .line 545
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getFlags()I

    move-result v0

    .line 546
    .local v0, "flags":I
    not-int v1, p1

    and-int/2addr v0, v1

    .line 547
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setFlags(I)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v1

    return-object v1
.end method

.method public setAppearance(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 3
    .param p1, "appearanceType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "appearance"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 648
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getAppearanceDictionary()Lcom/itextpdf/kernel/pdf/PdfDictionary;

    move-result-object v0

    .line 649
    .local v0, "ap":Lcom/itextpdf/kernel/pdf/PdfDictionary;
    if-nez v0, :cond_0

    .line 650
    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-direct {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;-><init>()V

    move-object v0, v1

    .line 651
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v2, Lcom/itextpdf/kernel/pdf/PdfName;->AP:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {v1, v2, v0}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 653
    :cond_0
    invoke-virtual {v0, p1, p2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 654
    return-object p0
.end method

.method public setAppearance(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "appearanceType"    # Lcom/itextpdf/kernel/pdf/PdfName;
    .param p2, "appearance"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;

    .line 701
    invoke-virtual {p2}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {p0, p1, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setAppearance(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setAppearanceState(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "as"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 760
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->AS:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setBlendMode(Lcom/itextpdf/kernel/pdf/PdfName;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "blendMode"    # Lcom/itextpdf/kernel/pdf/PdfName;

    .line 965
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->BM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setBorder(Lcom/itextpdf/kernel/pdf/PdfAnnotationBorder;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 2
    .param p1, "border"    # Lcom/itextpdf/kernel/pdf/PdfAnnotationBorder;

    .line 786
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Border:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfAnnotationBorder;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setBorder(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "border"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 797
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Border:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setColor(Lcom/itextpdf/kernel/colors/Color;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 2
    .param p1, "color"    # Lcom/itextpdf/kernel/colors/Color;

    .line 852
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/colors/Color;->getColorValue()[F

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "color"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 829
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->C:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setColor([F)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "color"    # [F

    .line 840
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfArray;

    invoke-direct {v0, p1}, Lcom/itextpdf/kernel/pdf/PdfArray;-><init>([F)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setColor(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setContents(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "contents"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 344
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Contents:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setContents(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 2
    .param p1, "contents"    # Ljava/lang/String;

    .line 355
    new-instance v0, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v1, "UnicodeBig"

    invoke-direct {v0, p1, v1}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setContents(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setDate(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "date"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 455
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->M:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setDownAppearance(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "appearance"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 687
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setAppearance(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setDownAppearance(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "appearance"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;

    .line 737
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->D:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setAppearance(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setFlag(I)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 2
    .param p1, "flag"    # I

    .line 533
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getFlags()I

    move-result v0

    .line 534
    .local v0, "flags":I
    or-int/2addr v0, p1

    .line 535
    invoke-virtual {p0, v0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setFlags(I)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v1

    return-object v1
.end method

.method public setFlags(I)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 2
    .param p1, "flags"    # I

    .line 482
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->F:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setLang(Ljava/lang/String;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 3
    .param p1, "lang"    # Ljava/lang/String;

    .line 946
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Lang:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfString;

    const-string v2, "UnicodeBig"

    invoke-direct {v1, p1, v2}, Lcom/itextpdf/kernel/pdf/PdfString;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setLayer(Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;)V
    .locals 3
    .param p1, "layer"    # Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;

    .line 323
    invoke-virtual {p0}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v0

    check-cast v0, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    sget-object v1, Lcom/itextpdf/kernel/pdf/PdfName;->OC:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-interface {p1}, Lcom/itextpdf/kernel/pdf/layer/IPdfOCG;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/PdfObject;

    .line 324
    return-void
.end method

.method public setName(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "name"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 434
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->NM:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setNonStrokingOpacity(F)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 4
    .param p1, "nonStrokingOpacity"    # F

    .line 993
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->ca:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setNormalAppearance(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "appearance"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 665
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setAppearance(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setNormalAppearance(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "appearance"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;

    .line 713
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->N:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setAppearance(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setPage(Lcom/itextpdf/kernel/pdf/PdfPage;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 2
    .param p1, "page"    # Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 410
    iput-object p1, p0, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->page:Lcom/itextpdf/kernel/pdf/PdfPage;

    .line 412
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->P:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p1}, Lcom/itextpdf/kernel/pdf/PdfPage;->getPdfObject()Lcom/itextpdf/kernel/pdf/PdfObject;

    move-result-object v1

    check-cast v1, Lcom/itextpdf/kernel/pdf/PdfDictionary;

    invoke-virtual {v1}, Lcom/itextpdf/kernel/pdf/PdfDictionary;->getIndirectReference()Lcom/itextpdf/kernel/pdf/PdfIndirectReference;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setRectangle(Lcom/itextpdf/kernel/pdf/PdfArray;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "array"    # Lcom/itextpdf/kernel/pdf/PdfArray;

    .line 912
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->Rect:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setRolloverAppearance(Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "appearance"    # Lcom/itextpdf/kernel/pdf/PdfDictionary;

    .line 676
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setAppearance(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfDictionary;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setRolloverAppearance(Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "appearance"    # Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;

    .line 725
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->R:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->setAppearance(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/annot/PdfAnnotationAppearance;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setStrokingOpacity(F)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 4
    .param p1, "strokingOpacity"    # F

    .line 1019
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->CA:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    float-to-double v2, p1

    invoke-direct {v1, v2, v3}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(D)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setStructParentIndex(I)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 2
    .param p1, "structParentIndex"    # I

    .line 880
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->StructParent:Lcom/itextpdf/kernel/pdf/PdfName;

    new-instance v1, Lcom/itextpdf/kernel/pdf/PdfNumber;

    invoke-direct {v1, p1}, Lcom/itextpdf/kernel/pdf/PdfNumber;-><init>(I)V

    invoke-virtual {p0, v0, v1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method

.method public setTitle(Lcom/itextpdf/kernel/pdf/PdfString;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;
    .locals 1
    .param p1, "title"    # Lcom/itextpdf/kernel/pdf/PdfString;

    .line 890
    sget-object v0, Lcom/itextpdf/kernel/pdf/PdfName;->T:Lcom/itextpdf/kernel/pdf/PdfName;

    invoke-virtual {p0, v0, p1}, Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;->put(Lcom/itextpdf/kernel/pdf/PdfName;Lcom/itextpdf/kernel/pdf/PdfObject;)Lcom/itextpdf/kernel/pdf/annot/PdfAnnotation;

    move-result-object v0

    return-object v0
.end method
