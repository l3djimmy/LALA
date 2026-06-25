.class public interface abstract Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper;
.super Ljava/lang/Object;
.source "IClipper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$IZFillCallback;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$JoinType;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$EndType;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$Direction;,
        Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;
    }
.end annotation


# static fields
.field public static final PRESERVE_COLINEAR:I = 0x4

.field public static final REVERSE_SOLUTION:I = 0x1

.field public static final STRICTLY_SIMPLE:I = 0x2


# virtual methods
.method public abstract addPath(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Path;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z
.end method

.method public abstract addPaths(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyType;Z)Z
.end method

.method public abstract clear()V
.end method

.method public abstract execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;)Z
.end method

.method public abstract execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/Paths;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z
.end method

.method public abstract execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;)Z
.end method

.method public abstract execute(Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$ClipType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/PolyTree;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;Lcom/itextpdf/kernel/pdf/canvas/parser/clipper/IClipper$PolyFillType;)Z
.end method
